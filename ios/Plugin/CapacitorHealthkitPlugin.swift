import Foundation
import Capacitor
import HealthKit

var healthStore = HKHealthStore()

@objc(CapacitorHealthkitPlugin)
public class CapacitorHealthkitPlugin: CAPPlugin {
    @objc func requestAuthorization(_ call: CAPPluginCall) {
        if !HKHealthStore.isHealthDataAvailable() {
            return call.reject("Health data is not available.")
        }
        
        let _all = call.options["all"] as? [String] ?? []
        let _read = call.options["read"] as? [String] ?? []
        let _write = call.options["write"] as? [String] ?? []

        let writeTypes: Set<HKSampleType> = getSampleTypes(sampleNames: _write).union(getSampleTypes(sampleNames: _all))
        let readTypes: Set<HKSampleType> = getSampleTypes(sampleNames: _read).union(getSampleTypes(sampleNames: _all))

        healthStore.requestAuthorization(toShare: writeTypes, read: readTypes) { success, _ in
            if !success {
                call.reject("Could not get permission to access health.")
                
                return;
            }
            
            call.resolve();
        }
    }
    
    @objc func isAvailable(_ call: CAPPluginCall) {
        if HKHealthStore.isHealthDataAvailable() {
            return call.resolve()
        } else {
            return call.reject("Health data is not available.")
        }
    }

    @objc func getAuthorizationStatus(_ call: CAPPluginCall) {
        guard let sampleName = call.options["sampleName"] as? String else {
            return call.reject("sampleName is required.")
        }

        let sampleType: HKSampleType? = getSampleType(sampleName: sampleName)
        
        if sampleType == nil {
            return call.reject("Unknown sampleName " + sampleName)
        }
        
        let status: String;
        
        switch healthStore.authorizationStatus(for: sampleType!) {
            case .sharingAuthorized:
                status = "sharingAuthorized"
            case .sharingDenied:
                status = "sharingDenied"
            case .notDetermined:
                status = "notDetermined"
            @unknown default:
                return call.reject("Unknown status")
        }
        
        call.resolve([
            "status": status
        ])
    }
    
    @objc func getStatisticsCollection(_ call: CAPPluginCall) {
        guard let sampleName = call.options["quantityTypeSampleName"] as? String else {
            return call.reject("quantityTypeSampleName is required.")
        }
        
        guard let anchorDateInput = call.options["anchorDate"] as? String else {
            return call.reject("anchorDate is required.")
        }
        
        guard let startDateInput = call.options["startDate"] as? String else {
            return call.reject("startDate is required.")
        }
        
        let endDateInput = call.options["endDate"] as? String
        
        let interval: Interval
        if let intervalInput = call.options["interval"] as? [String: Any],
           let unit = intervalInput["unit"] as? String,
           let value = intervalInput["value"] as? Int {
            interval = Interval(unit: unit, value: value)
        } else {
            print("Failed to extract interval information")
            
            return call.reject("interval is not valid")
        }
                        
        let intervalComponents = getInterval(interval.unit, interval.value)

        let anchorDate = getDateFromString(inputDate: anchorDateInput)
                
        let quantityType = getQuantityType(sampleName: sampleName)
        
        // Create the query.
        let query = HKStatisticsCollectionQuery(quantityType: quantityType,
                                                quantitySamplePredicate: nil,
                                                options: .cumulativeSum,
                                                anchorDate: anchorDate,
                                                intervalComponents: intervalComponents)
        
        // Set the results handler.
        query.initialResultsHandler = {
            query, results, error in
            
            // Handle errors here.
            if let error = error as? HKError {
                switch (error.code) {
                case .errorDatabaseInaccessible:
                    // HealthKit couldn't access the database because the device is locked.
                    return call.reject("Device is locked.")
                default:
                    // Handle other HealthKit errors here.
                    return call.reject("A HelathKit error occurred")
                }
            }
            
            guard let statsCollection = results else {
                // You should only hit this case if you have an unhandled error. Check for bugs
                // in your code that creates the query, or explicitly handle the error.
                return call.reject("An unexpected error occurred")
            }

            let endDate = endDateInput != nil ? getDateFromString(inputDate: endDateInput!) : Date()
            let startDate = getDateFromString(inputDate: startDateInput)
            
            var output: [[String: Any]] = []
                                    
            // Enumerate over all the statistics objects between the start and end dates.
            statsCollection.enumerateStatistics(from: startDate, to: endDate)
            { (statistics, stop) in
                let quantity = statistics.sumQuantity()
                let startDate = statistics.startDate
                let endDate = statistics.endDate
                let value = quantity != nil ? quantity!.doubleValue(for: .count()) : 0
                    
                output.append([
                    "startDate": startDate,
                    "endDate": endDate,
                    "value": Int(value)
                ])
            }
            
            call.resolve(["data": output])
        }
        
        healthStore.execute(query)
    }
    
    @objc func getBodyMassEntries(_ call: CAPPluginCall) {
        guard let startDateString = call.options["startDate"] as? String else {
            return call.reject("startDate is required.")
        }
        
        let endDateString = call.options["endDate"] as? String
        
        let limit = call.options["limit"] as? Int ?? 0
        
        let sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)!
        
        let _startDate = getDateFromString(inputDate: startDateString)
        let _endDate = endDateString != nil ? getDateFromString(inputDate: endDateString!) : Date()
        let _limit: Int = (limit == 0) ? HKObjectQueryNoLimit : limit
        
        let predicate = HKQuery.predicateForSamples(withStart: _startDate, end: _endDate, options: HKQueryOptions.strictStartDate)
            
        // Create a query to fetch the latest weight samples
        let bodyMassQuery = HKSampleQuery(sampleType: sampleType,
                                        predicate: predicate,
                                        limit: _limit,
                                        sortDescriptors: nil) { (query, samples, error) in
            
            guard let bodyMassSamples = samples as? [HKQuantitySample], error == nil else {
                return call.reject("error")
            }
            
            var output: [[String: Any]] = []
            
            for bodyMassSample in bodyMassSamples {
                output.append([
                    "date": bodyMassSample.startDate,
                    "value": bodyMassSample.quantity.doubleValue(for: HKUnit.gramUnit(with: .kilo)),
                    "unit": "kg",
                    "uuid": bodyMassSample.uuid.uuidString,
                    "sourceName": bodyMassSample.sourceRevision.source.name,
                    "sourceBundleId": bodyMassSample.sourceRevision.source.bundleIdentifier
                ])
            }
            
            call.resolve(["data": output])
        }
        
        healthStore.execute(bodyMassQuery)
    }

    @objc func getWorkouts(_ call: CAPPluginCall) {
        guard let startDateString = call.options["startDate"] as? String else {
            return call.reject("startDate is required.")
        }
        
        let endDateString = call.options["endDate"] as? String

        let limit = call.options["limit"] as? Int ?? 0

        let _startDate = getDateFromString(inputDate: startDateString)
        let _endDate = endDateString != nil ? getDateFromString(inputDate: endDateString!) : Date()
        let _limit: Int = (limit == 0) ? HKObjectQueryNoLimit : limit
    
        let predicate = HKQuery.predicateForSamples(withStart: _startDate, end: _endDate, options: HKQueryOptions.strictStartDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: true)
        
        var output: [[String: Any]] = []
        
        let workoutQuery = HKSampleQuery(sampleType: HKObjectType.workoutType(), predicate: predicate, limit: _limit,
                                         sortDescriptors: [sortDescriptor]) { [self](_, samples, error) in

            guard let workouts = samples as? [HKWorkout], error == nil else {
                print(error!)
                
                return call.reject(error!.localizedDescription)
            }

            for workout in workouts {
                var totalEnergyBurnedData: Double?
                var totalDistanceData: Double?
                var totalFlightsClimbedData: Double?
                var totalSwimmingStrokeCountData: Double?

                var unitTotalEnergyBurned: HKUnit?
                var unitTotalDistance: HKUnit?
                var unitTotalFlightsClimbed: HKUnit?
                var unitTotalSwimmingStrokeCount: HKUnit?
                
                if let totalEnergyBurned = workout.totalEnergyBurned {
                    if totalEnergyBurned.is(compatibleWith: HKUnit.kilocalorie()) {
                        unitTotalEnergyBurned = HKUnit.kilocalorie()
                    }

                    if let unitTotalEnergyBurned = unitTotalEnergyBurned {
                        totalEnergyBurnedData = totalEnergyBurned.doubleValue(for: unitTotalEnergyBurned)
                    }
                }
               
                if let totalDistance = workout.totalDistance {
                    if totalDistance.is(compatibleWith: HKUnit.meter()) {
                        unitTotalDistance = HKUnit.meter()
                    }
                    
                    if let unitTotalDistance = unitTotalDistance {
                        totalDistanceData = totalDistance.doubleValue(for: unitTotalDistance)
                    }
                }
                
                if let totalFlightsClimbed = workout.totalFlightsClimbed {
                    if totalFlightsClimbed.is(compatibleWith: HKUnit.count()) {
                        unitTotalFlightsClimbed = HKUnit.count()
                    }
                    
                    if let unitTotalFlightsClimbed = unitTotalFlightsClimbed {
                        totalFlightsClimbedData = totalFlightsClimbed.doubleValue(for: unitTotalFlightsClimbed)
                    }
                }
                
                if let totalSwimmingStrokeCount = workout.totalSwimmingStrokeCount {
                    if totalSwimmingStrokeCount.is(compatibleWith: HKUnit.count()) {
                        unitTotalSwimmingStrokeCount = HKUnit.count()
                    }
                    
                    if let unitTotalSwimmingStrokeCount = unitTotalSwimmingStrokeCount {
                        totalSwimmingStrokeCountData = totalSwimmingStrokeCount.doubleValue(for: unitTotalSwimmingStrokeCount)
                    }
                }
                
                var workoutData: [String: Any] = [
                    "uuid": workout.uuid.uuidString,
                    "startDate": ISO8601DateFormatter().string(from: workout.startDate),
                    "endDate": ISO8601DateFormatter().string(from: workout.endDate),
                    "duration": workout.duration,
                    "device": convertToDeviceInformationDictionary(getDeviceInformation(device: workout.device)) as Any,
                    "source": workout.sourceRevision.source.name,
                    "sourceBundleId": workout.sourceRevision.source.bundleIdentifier,
                    "workoutActivityType": getActivityTypeAsString(workout.workoutActivityType),
                    "workoutActivityTypeId": workout.workoutActivityType.rawValue
                ]

                if let totalEnergyBurnedData {
                    workoutData["totalEnergyBurned"] = totalEnergyBurnedData
                }

                if let totalDistanceData {
                    workoutData["totalDistance"] = totalDistanceData
                }

                if let totalFlightsClimbedData {
                    workoutData["totalFlightsClimbed"] = totalFlightsClimbedData
                }

                if let totalSwimmingStrokeCountData {
                    workoutData["totalSwimmingStrokeCount"] = totalSwimmingStrokeCountData
                }
                
                output.append(workoutData)
            }

            call.resolve(["data": output])
        }
        
        healthStore.execute(workoutQuery)
    }
}

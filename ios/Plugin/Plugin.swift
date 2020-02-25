//
//  CapacitorHealthkit.swift
//  App
//
//  Created by Théo Creach on 13/02/2020.
//

import Foundation
import Capacitor
import HealthKit

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */

var healthStore: HKHealthStore = HKHealthStore();

@objc(CapacitorHealthkit)
public class CapacitorHealthkit: CAPPlugin {
    
    /*
     FCT TO DO :
     (isAuthorized) ==> use authorizationStatus
     => et dire en argument la liste des autorisations qu'on veut vérifier tsais
     query
     getActivityHistoryOnly
     */
    
    // Check si HK est accessible (pas s'il est activé)
    @objc func isAvailable(_ call: CAPPluginCall) {
        if HKHealthStore.isHealthDataAvailable() {
            call.resolve();
        } else {
            call.reject("Health data not available")
        }
    }
    
    @objc func isEditionAuthorized(_ call: CAPPluginCall) {
        
        guard let sampleName = call.options["sampleName"] as? String else {
            call.reject("Must provide all")
            return
        }
        
        var sampleType: HKSampleType? = nil;
        
        switch sampleName {
            case "stepCount":
                sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!;
            case "flightsClimbed":
                sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.flightsClimbed)!;
            case "appleExerciseTime":
                sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.appleExerciseTime)!;
            case "activeEnergyBurned":
                sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!;
            case "basalEnergyBurned":
                sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.basalEnergyBurned)!;
            case "distanceWalkingRunning":
                sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!;
            case "distanceCycling":
                sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceCycling)!;
            case "sleepAnalysis":
                sampleType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!;
            case "workoutType":
                sampleType = HKWorkoutType.workoutType();
        default:
            print("cannot match sample name");
            call.reject("Error in sample name");
            return
        }
        
        
        // Check for access to your HealthKit Type(s).
        if (healthStore.authorizationStatus(for: sampleType!) == .sharingAuthorized) {
            // print("Permission Granted to Access data")
            call.resolve()
        } else {
            // print("Permission Denied to Access data")
            call.reject("Permission Denied to Access data");
            return
        }
    }
    
    // multiple avec tableau de string
    
    @objc func multipleIsEditionAuthorized(_ call: CAPPluginCall) {
           
           guard let sampleNames = call.options["sampleNames"] as? [String] else {
               call.reject("Must provide sampleNames")
               return
           }
           
           // var sampleType: HKSampleType? = nil;
        
            for sampleName in sampleNames {
                
                    var sampleType: HKSampleType? = nil;
           
                   switch sampleName {
                       case "stepCount":
                           sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!;
                       case "flightsClimbed":
                           sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.flightsClimbed)!;
                       case "appleExerciseTime":
                           sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.appleExerciseTime)!;
                       case "activeEnergyBurned":
                           sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!;
                       case "basalEnergyBurned":
                           sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.basalEnergyBurned)!;
                       case "distanceWalkingRunning":
                           sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!;
                       case "distanceCycling":
                           sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceCycling)!;
                       case "sleepAnalysis":
                           sampleType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!;
                       case "workoutType":
                           sampleType = HKWorkoutType.workoutType();
                   default:
                       print("cannot match sample name");
                       call.reject("Error in sample name");
                       return
                   }
                   
                   
                   // Check for access to your HealthKit Type(s).
                   if (healthStore.authorizationStatus(for: sampleType!) == .sharingAuthorized) {
                       // print("Permission Granted to Access data")
                   } else {
                       // print("Permission Denied to Access data")
                       call.reject("Permission Denied to Access data");
                       return
                   }
            }
        
            call.resolve()
       }
       

    
    // demande les autorisations d'accéder au HK
    // TODO : FAIRE EN SORTE QU'IL PRENNE EN PARAM un tableau d'autorisation 
    @objc func requestAuthorization(_ call: CAPPluginCall) {
        
        if HKHealthStore.isHealthDataAvailable() {
            
            /*
             
             DATA TO POTENTIALLY GET :
                 steps (count)
                 stairs (count)
                 calories (kcal)
                 distance (m)
                 duration (min)
                 activity (activityType)
                          
             */
            
            // Get Authorization data asked
            
            guard let _all = call.options["all"] as? [String] else {
                call.reject("Must provide all")
                return
            }
            guard let _read = call.options["read"] as? [String] else {
                call.reject("Must provide read")
                return
            }
            guard let _write = call.options["write"] as? [String] else {
                call.reject("Must provide write")
                return
            }
            
            let dtHKAll = _all;
            let dtHKRead = _read;
            let dtHKWrite = _write;
            
            // example translate reception format
            // let dtHKAll = ["calories", "stairs"];
            // let dtHKRead = ["steps", "distance", "duration"];
            // let dtHKWrite = ["activity"];
           
            var writeTypes: Set<HKSampleType> = []
            var readTypes: Set<HKSampleType> = []
            
            // adapt name with HK request for Write AND Read Elements
            for allItem in dtHKAll {
                switch allItem {
                case "steps":
                    writeTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!);
                    readTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!);
                case "stairs":
                    writeTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.flightsClimbed)!);
                    readTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.flightsClimbed)!);
                case "duration":
                    writeTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.appleExerciseTime)!);
                    readTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.appleExerciseTime)!);
                case "activity":
                    writeTypes.insert(HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!);
                    writeTypes.insert(HKWorkoutType.workoutType());
                    readTypes.insert(HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!);
                    readTypes.insert(HKWorkoutType.workoutType());
                case "calories":
                    writeTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!);
                    writeTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.basalEnergyBurned)!);
                    readTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!);
                    readTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.basalEnergyBurned)!);
                case "distance":
                    writeTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!);
                    writeTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceCycling)!);
                    readTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!);
                    readTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceCycling)!);
                default:
                    print("no match in case");
                }
            }
            
            // adapt name with HK request for Write Elements
            // TODO : Faire un check qu'ils sont pas déjà insert idéalement
            for wItem in dtHKWrite {
                switch wItem {
                case "steps":
                    writeTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!);
                case "stairs":
                    writeTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.flightsClimbed)!);
                case "duration":
                    writeTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.appleExerciseTime)!);
                case "activity":
                    writeTypes.insert(HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!);
                    writeTypes.insert(HKWorkoutType.workoutType());
                case "calories":
                    writeTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!);
                    writeTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.basalEnergyBurned)!);
                case "distance":
                    writeTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!);
                    writeTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceCycling)!);
                default:
                    print("no match in case");
                }
            }
            
            // adapt name with HK request for Read Elements
            // TODO : Faire un check qu'ils sont pas déjà insert idéalement
            for rItem in dtHKRead {
                switch rItem {
                case "steps":
                    readTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!);
                case "stairs":
                    readTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.flightsClimbed)!);
                case "duration":
                    readTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.appleExerciseTime)!);
                case "activity":
                    readTypes.insert(HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!);
                    readTypes.insert(HKWorkoutType.workoutType());
                case "calories":
                    readTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!);
                    readTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.basalEnergyBurned)!);
                case "distance":
                    readTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!);
                    readTypes.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceCycling)!);
                default:
                    print("no match in case");
                }
            }
        
            healthStore.requestAuthorization(toShare: writeTypes, read: readTypes) { (success, error) in
                
                if !success {
                    call.reject("Could not get permission")
                    return
                }
            
                call.resolve();
                
            }
            
        } else {
            call.reject("Health data not available")
        }
    }
    
    
    @objc func queryHKitSampleType(_ call: CAPPluginCall) {
        
        guard let _sampleName = call.options["sampleName"] as? String else {
            call.reject("Must provide sampleName")
            return
        }
        guard let _startDate = call.options["startDate"] as? String else {
            call.reject("Must provide startDate")
            return
        }
        guard let _endDate = call.options["endDate"] as? Date else {
            call.reject("Must provide endDate")
            return
        }
        guard let _limit = call.options["limit"] as? Int else {
            call.reject("Must provide limit")
            return
        }
        
        var limit: Int = 0;
        
        if (_limit == 0) {
            limit = HKObjectQueryNoLimit;
        } else {
            limit = _limit;
        }

        
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "yyyy/MM/dd";
        
        let now = Date()
        let startDate = dateFormatter.date(from: _startDate);
        
    
        let _predicate = HKQuery.predicateForSamples(withStart: startDate, end: now, options: HKQueryOptions.strictStartDate);
        
        var _sampleType: HKSampleType? = nil;
        
        switch _sampleName {
            case "stepCount":
                _sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!;
            case "flightsClimbed":
                _sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.flightsClimbed)!;
            case "appleExerciseTime":
                _sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.appleExerciseTime)!;
            case "activeEnergyBurned":
                _sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!;
            case "basalEnergyBurned":
                _sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.basalEnergyBurned)!;
            case "distanceWalkingRunning":
                _sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!;
            case "distanceCycling":
                _sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceCycling)!;
            case "sleepAnalysis":
                _sampleType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!;
            case "workoutType":
                _sampleType = HKWorkoutType.workoutType();
        default:
            print("cannot match sample name");
            call.reject("Error in sample name");
            return
        }
        
        /*
        
        // Check for access to your HealthKit Type(s).
        if (healthStore.authorizationStatus(for: _sampleType!) == .sharingAuthorized) {
            // print("Permission Granted to Access data")
        } else {
            // print("Permission Denied to Access data")
            call.reject("Permission Denied to Access data");
            return
        }
 
         */
        
        if (_sampleName == "sleepAnalysis") {
            
            /*
             
             ** QUERY FOR SLEEP ANALYSIS DATA
             
            */
            
            
            let query1 = HKSampleQuery(sampleType: _sampleType!, predicate: _predicate, limit: limit, sortDescriptors: nil) {
             query, results, error in
             
                 // print(results);
                // print("-- -- --");
                 
                 // Je mets quantity ici pour tester
                 guard let result = results else {
                     call.reject("Could not query data");
                     return
                 }
                
                var output: [[String: Any]] = []
                
                
                for r in result {
                    // GET DURATION SLEEP
                        let sleepSD : NSDate
                        let sleepED : NSDate
                        sleepSD = r.startDate as NSDate
                        sleepED = r.endDate as NSDate
                        let sleepInterval = sleepED.timeIntervalSince(sleepSD as Date)
                        let sleepSecondsInAnHour: Double = 3600;
                        let sleepHoursBetweenDates = sleepInterval / sleepSecondsInAnHour;
                        // print("sleepDuration:")
                        // print(sleepHoursBetweenDates)
                    
                    
                    output.append([
                        "uuid": r.uuid.uuidString,
                        "startDate": ISO8601DateFormatter().string(from: r.startDate),
                        "endDate": ISO8601DateFormatter().string(from: r.endDate),
                        "duration": sleepHoursBetweenDates,
                        "source": r.sourceRevision.source.name,
                        "sourceBundleId": r.sourceRevision.source.bundleIdentifier
                    ])
                }
                
                
                
                call.resolve([
                    "countReturn": result.count,
                    "resultData": output

                ])
            }
            healthStore.execute(query1)
            
        } else if (_sampleName == "workoutType") {
            
            /*
             
             ** QUERY FOR WORKOUT DATA
             
            */
            

            
            let query2 = HKSampleQuery(sampleType: _sampleType!, predicate: _predicate, limit: limit, sortDescriptors: nil) {
             query, results, error in
             
                 // print(results);
                  // print("-- -- --");
                  
                  // Je mets quantity ici pour tester
                  guard let result = results as? [HKWorkout] else {
                      call.reject("Could not query data");
                      return
                  }
                 
                 var output: [[String: Any]] = []
                
                 
                 for r in result {
                    
                    let workoutActivityTypeValue: UInt = r.workoutActivityType.rawValue
                    // print("workoutActivityTypeValue");
                    // print(workoutActivityTypeValue);
                    // print(self.returnWorkoutActivityTypeValueDictionnary(number: workoutActivityTypeValue));
                    
                    var TEBData: Double? = -1
                    var TDData: Double? = -1
                    var TFCData: Double? = -1
                    var TSSCData: Double? = -1

                    // TEB MANAGEMENT
                        var unitTEB: HKUnit?
                        var unitTEBName: String?
                        if ((r.totalEnergyBurned) != nil) {
                            if (r.totalEnergyBurned?.is(compatibleWith: HKUnit.kilocalorie()))! {
                                unitTEB = HKUnit.kilocalorie()
                                unitTEBName = "kilocalorie"
                            }
                            guard unitTEB != nil else { return }
                            guard unitTEBName != nil else { return }
                            TEBData = r.totalEnergyBurned?.doubleValue(for: unitTEB!);
                        } else {
                            TEBData = -1
                        }
                    // TD MANAGEMENT
                        var unitTD: HKUnit?
                        var unitTDName: String?
                        if ((r.totalDistance) != nil) {
                            if (r.totalDistance?.is(compatibleWith: HKUnit.meter()))! {
                                unitTD = HKUnit.meter()
                                unitTDName = "meter"
                            }
                            guard unitTD != nil else { return }
                            guard unitTDName != nil else { return }
                            TDData = r.totalDistance?.doubleValue(for: unitTD!);
                        } else {
                            TDData = -1
                        }
                    // TFC MANAGEMENT
                        var unitTFC: HKUnit?
                        var unitTFCName: String?
                        if ((r.totalFlightsClimbed) != nil) {
                            if (r.totalFlightsClimbed?.is(compatibleWith: HKUnit.count()))! {
                                unitTFC = HKUnit.count()
                                unitTFCName = "count"
                            }
                            guard unitTFC != nil else { return }
                            guard unitTFCName != nil else { return }
                            TFCData = r.totalFlightsClimbed?.doubleValue(for: unitTFC!);
                        } else {
                            TFCData = -1
                        }
                    // TSSC MANAGEMENT
                        var unitTSSC: HKUnit?
                        var unitTSSCName: String?
                        if ((r.totalSwimmingStrokeCount) != nil) {
                            if (r.totalSwimmingStrokeCount?.is(compatibleWith: HKUnit.count()))! {
                                unitTSSC = HKUnit.count()
                                unitTSSCName = "count"
                            }
                            guard unitTSSC != nil else { return }
                            guard unitTSSCName != nil else { return }
                            TSSCData = r.totalSwimmingStrokeCount?.doubleValue(for: unitTSSC!);
                        } else {
                            TSSCData = -1
                        }
                    // WORKOUT EVENT MANAGEMENT
                        // todo later
                
                    // GET DURATION WORKOUT
                        let workoutSD : NSDate
                        let workoutED : NSDate
                        workoutSD = r.startDate as NSDate
                        workoutED = r.endDate as NSDate
                        let workoutInterval = workoutED.timeIntervalSince(workoutSD as Date)
                        let workoutSecondsInAnHour: Double = 3600;
                        let workoutHoursBetweenDates = workoutInterval / workoutSecondsInAnHour;
                        // print("workout duration:")
                        // print(workoutHoursBetweenDates)
                    
                    
                     output.append([
                        "uuid": r.uuid.uuidString,
                         "startDate": ISO8601DateFormatter().string(from: r.startDate),
                         "endDate": ISO8601DateFormatter().string(from: r.endDate),
                         "duration": workoutHoursBetweenDates,
                         "source": r.sourceRevision.source.name,
                         "sourceBundleId": r.sourceRevision.source.bundleIdentifier,
                         "workoutActivityId": workoutActivityTypeValue,
                         "workoutActivityName": self.returnWorkoutActivityTypeValueDictionnary(number: workoutActivityTypeValue),
                         "totalEnergyBurned": TEBData!, // kilocalorie
                         "totalDistance": TDData!, // meter
                         "totalFlightsClimbed": TFCData!, // count
                         "totalSwimmingStrokeCount": TSSCData! // count
                     ])
                 }
                
                 call.resolve([
                     "countReturn": result.count,
                     "resultData": output

                 ])
            }
            healthStore.execute(query2)
        } else {
            
            /*
             
             ** QUERY FOR QUANTITY DATA
             
            */
            
            let query3 = HKSampleQuery(sampleType: _sampleType!, predicate: _predicate, limit: limit, sortDescriptors: nil) {
                query, results, error in
                
                // print(results);
                // print("-- -- --");
                
                
                // Je mets quantity ici pour tester
                guard let result = results as? [HKQuantitySample] else {
                    call.reject("Could not query data");
                    return
                }
                
                var output: [[String: Any]] = []
                
                for r in result {
                    
                    var unit: HKUnit?
                    var unitName: String?
                    
                    if r.quantityType.is(compatibleWith: HKUnit.meter()) {
                        unit = HKUnit.meter()
                        unitName = "meter"
                    } else if r.quantityType.is(compatibleWith: HKUnit.count()) {
                        unit = HKUnit.count()
                        unitName = "count"
                    } else if r.quantityType.is(compatibleWith: HKUnit.minute()) {
                        unit = HKUnit.minute()
                        unitName = "minute"
                    } else if r.quantityType.is(compatibleWith: HKUnit.kilocalorie()) {
                        unit = HKUnit.kilocalorie()
                        unitName = "kilocalorie"
                    } else {
                        print("Error: unknown unit type")
                    }
                    
                    guard unit != nil else { return }
                    guard unitName != nil else { return }
                    
                    // ALSO WORK FOR DATE FORMATER ::
                    // Date formater
                    // let dateFormatter = DateFormatter()
                    // dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
                    
                    
                    // GET DURATION QUANTITY
                        let quantitySD : NSDate
                        let quantityED : NSDate
                        quantitySD = r.startDate as NSDate
                        quantityED = r.endDate as NSDate
                        let quantityInterval = quantityED.timeIntervalSince(quantitySD as Date)
                        let quantitySecondsInAnHour: Double = 3600;
                        let quantityHoursBetweenDates = quantityInterval / quantitySecondsInAnHour;
                        // print("quantity duration:")
                        // print(quantityHoursBetweenDates)
                    
                    output.append([
                        "uuid": r.uuid.uuidString,
                        "value": r.quantity.doubleValue(for: unit!),
                        "unitName": unitName!,
                        "startDate": ISO8601DateFormatter().string(from: r.startDate),
                        "endDate": ISO8601DateFormatter().string(from: r.endDate),
                        "duration": quantityHoursBetweenDates,
                        "source": r.sourceRevision.source.name,
                        "sourceBundleId": r.sourceRevision.source.bundleIdentifier
                    ])
                }
                
                call.resolve([
                    "countReturn": result.count,
                    "resultData": output

                ])
                            
            }
            
            healthStore.execute(query3)
        }
        
    }
    
    
    
    func returnWorkoutActivityTypeValueDictionnary(number: UInt) -> String {

        switch number {
        case 1:
            return "americanFootball"

        case 2:
            return "archery"

        case 3:
            return "australianFootball"

        case 4:
            return "badminton"

        case 5:
            return "baseball"

        case 6:
            return "basketball"

        case 7:
            return "bowling"

        case 8: // See also HKWorkoutActivityTypeKickboxing.
            return "boxing"

        case 9:
            return "climbing"
            
        case 10:
            return "cricket"
            
        case 11: // Any mix of cardio and/or strength training. See also HKWorkoutActivityTypeCoreTraining and HKWorkoutActivityTypeFlexibility.
            return "crossTraining"
            
        case 12:
            return "curling"

        case 13:
            return "cycling"

        case 14:
            return "dance"

        case 15: // This enum remains available to access older data.
            return "danceInspiredTraining"

        case 16:
            return "elliptical"

        case 17: // Polo, Horse Racing, Horse Riding, etc.
            return "equestrianSports"

        case 18:
            return "fencing"

        case 19:
            return "fishing"

        case 20: // Primarily free weights and/or body weight and/or accessories
            return "functionalStrengthTraining"

        case 21:
            return "golf"

        case 22:
            return "gymnastics"

        case 23:
            return "handball"

        case 24:
            return "hiking"

        case 25: // Ice Hockey, Field Hockey, etc.
            return "hockey"

        case 26:
            return "hunting"

        case 27:
            return "lacrosse"

        case 28:
            return "martialArts"

        case 29: // Qigong, meditation, etc.
            return "mindAndBody"


        case 30: // This enum remains available to access older data.
            return "mixedMetabolicCardioTraining"

        case 31: // Canoeing, Kayaking, Outrigger, Stand Up Paddle Board, etc.
            return "paddleSports"

        case 32: // Dodge Ball, Hopscotch, Tetherball, Jungle Gym, etc.
            return "play"

        case 33: // Foam rolling, stretching, etc.
            return "preparationAndRecovery"

        case 34:
            return "racquetball"

        case 35:
            return "rowing"

        case 36:
            return "rugby"

        case 37:
            return "running"

        case 38:
            return "sailing"

        case 39: // Ice Skating, Speed Skating, Inline Skating, Skateboarding, etc.
            return "skatingSports"

        case 40: // Sledding, Snowmobiling, Building a Snowman, etc. See also HKWorkoutActivityTypeCrossCountrySkiing, HKWorkoutActivityTypeSnowboarding, and HKWorkoutActivityTypeDownhillSkiing.
            return "snowSports"

        case 41:
            return "soccer"

        case 42:
            return "softball"

        case 43:
            return "squash"

        case 44: // See also HKWorkoutActivityTypeStairs and HKWorkoutActivityTypeStepTraining.
            return "stairClimbing"

        case 45: // Traditional Surfing, Kite Surfing, Wind Surfing, etc.
            return "surfingSports"

        case 46:
            return "swimming"

        case 47:
            return "tableTennis"

        case 48:
            return "tennis"

        case 49: // Shot Put, Javelin, Pole Vaulting, etc.
            return "trackAndField"

        case 50: // Primarily machines and/or free weights
            return "traditionalStrengthTraining"

        case 51:
            return "volleyball"

        case 52:
            return "walking"

        case 53:
            return "waterFitness"

        case 54:
            return "waterPolo"

        case 55: // Water Skiing, Wake Boarding, etc.
            return "waterSports"

        case 56:
            return "wrestling"

        case 57:
            return "yoga"
        default:
            print("cannot find activity name")
            return ""
        }
        
    }
    
    // @objc func getActivityHistoryOverview(_ call: CAPPluginCall)
    
    
    
    @objc func multipleQueryHKitSampleType(_ call: CAPPluginCall) {
        
        guard let _sampleNames = call.options["sampleNames"] as? [String] else {
            call.reject("Must provide sampleNames")
            return
        }
        guard let _startDate = call.options["startDate"] as? String else {
            call.reject("Must provide startDate")
            return
        }
        guard let _endDate = call.options["endDate"] as? Date else {
            call.reject("Must provide endDate")
            return
        }
        guard let _limit = call.options["limit"] as? Int else {
            call.reject("Must provide limit")
            return
        }
        
        var output: [String: [String: Any]] = [:]
        
        let dispatchGroup = DispatchGroup()
        
        // set une var error dans le scope du for et break s'il get lerror
        
        for _sampleName in _sampleNames {
            
            dispatchGroup.enter()
            
            self.queryHKitSampleTypeSpecial(_sampleName: _sampleName, _startDate: _startDate, _endDate: _endDate, _limit: _limit) { result in
                
                switch result {
                case .success(let sampleOutput):
                    output[_sampleName] = sampleOutput
                case .failure(let error):
                    
                    var errorMessage = ""
                    if let localError = error as? HKSampleError {
                        errorMessage = localError.outputMessage
                    } else {
                        errorMessage = error.localizedDescription
                    }
                    
                    output[_sampleName] = ["errorDescription": errorMessage]
                    print(errorMessage)
                    
                    // call.reject(error.localizedDescription)
                }
                
                dispatchGroup.leave()
            }
            
        }

        
        dispatchGroup.notify(queue: .main) {
            print(output.description)
            
            call.resolve(output)
        }
        
        
        
//        call.resolve([
//            "multipleResultData": res
//
//        ])
        
        
        
    }
    
    enum HKSampleError: Error {
        case sleepRequestFailed
        case workoutRequestFailed
        case quantityRequestFailed
        case sampleTypeFailed
        case deniedDataAccessFailed
        
        var outputMessage: String {
            switch self {
            case .sleepRequestFailed:
                return "sleepRequestFailed"
            case .workoutRequestFailed:
                return "workoutRequestFailed"
            case .quantityRequestFailed:
                return "quantityRequestFailed"
            case .sampleTypeFailed:
                return "sampleTypeFailed"
            case .deniedDataAccessFailed:
                return "deniedDataAccessFailed"
            }
        }
    }
    
    func queryHKitSampleTypeSpecial(_sampleName: String, _startDate: String, _endDate: Date, _limit: Int, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        
        var limit: Int = 0;
        
        if (_limit == 0) {
            limit = HKObjectQueryNoLimit;
        } else {
            limit = _limit;
        }

        
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "yyyy/MM/dd";
        
        let now = Date()
        let startDate = dateFormatter.date(from: _startDate);
        
    
        let _predicate = HKQuery.predicateForSamples(withStart: startDate, end: now, options: HKQueryOptions.strictStartDate);
        
        var _sampleType: HKSampleType? = nil;
        
        switch _sampleName {
            case "stepCount":
                _sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!;
            case "flightsClimbed":
                _sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.flightsClimbed)!;
            case "appleExerciseTime":
                _sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.appleExerciseTime)!;
            case "activeEnergyBurned":
                _sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!;
            case "basalEnergyBurned":
                _sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.basalEnergyBurned)!;
            case "distanceWalkingRunning":
                _sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!;
            case "distanceCycling":
                _sampleType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceCycling)!;
            case "sleepAnalysis":
                _sampleType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!;
            case "workoutType":
                _sampleType = HKWorkoutType.workoutType();
        default:
            print("cannot match sample name");
            completion(.failure(HKSampleError.sampleTypeFailed))
            return
        }
        
        /*
         
         SI TU AS PAS AUTH EN ECRITURE IL FAIL ICI ... !
        
        // Check for access to your HealthKit Type(s).
        if (healthStore.authorizationStatus(for: _sampleType!) == .sharingAuthorized) {
            // print("Permission Granted to Access data")
        } else {
            // print("Permission Denied to Access data")
            completion(.failure(HKSampleError.deniedDataAccessFailed))
            return
        }
 
         */
        
        
        if (_sampleName == "sleepAnalysis") {
            
            
            /*
             
             ** QUERY FOR SLEEP ANALYSIS DATA
             
            */
            let query1 = HKSampleQuery(sampleType: _sampleType!, predicate: _predicate, limit: limit, sortDescriptors: nil) {
             query, results, error in
             
                if error != nil {
                    completion(.failure(error!))
                    return
                }
                
                 // print(results);
                // print("-- -- --");
                 
                 // Je mets quantity ici pour tester
                guard let result = results else {
                    completion(.failure(HKSampleError.sleepRequestFailed))
                    return
                }
                
                var output: [[String: Any]] = []
                
                
                for r in result {
                    // GET DURATION SLEEP
                        let sleepSD : NSDate
                        let sleepED : NSDate
                        sleepSD = r.startDate as NSDate
                        sleepED = r.endDate as NSDate
                        let sleepInterval = sleepED.timeIntervalSince(sleepSD as Date)
                        let sleepSecondsInAnHour: Double = 3600;
                        let sleepHoursBetweenDates = sleepInterval / sleepSecondsInAnHour;
                        // print("sleepDuration:")
                        // print(sleepHoursBetweenDates)
                    
                    
                    output.append([
                        "uuid": r.uuid.uuidString,
                        "startDate": ISO8601DateFormatter().string(from: r.startDate),
                        "endDate": ISO8601DateFormatter().string(from: r.endDate),
                        "duration": sleepHoursBetweenDates,
                        "source": r.sourceRevision.source.name,
                        "sourceBundleId": r.sourceRevision.source.bundleIdentifier
                    ])
                }
                
                
                completion(.success([
                    "countReturn": result.count,
                    "resultData": output
                ]))
            }
            healthStore.execute(query1)
            
        } else if (_sampleName == "workoutType") {
        
            
            /*
             
             ** QUERY FOR WORKOUT DATA
             
            */
                       
            
            let query2 = HKSampleQuery(sampleType: _sampleType!, predicate: _predicate, limit: limit, sortDescriptors: nil) {
             query, results, error in
             
                 // print(results);
                  // print("-- -- --");
                
                if error != nil {
                    completion(.failure(error!))
                    return
                }
                  
                  // Je mets quantity ici pour tester
                  guard let result = results as? [HKWorkout] else {
                    completion(.failure(HKSampleError.workoutRequestFailed))
                      return
                  }
                 
                 var output: [[String: Any]] = []
                
                 
                 for r in result {
                    
                    let workoutActivityTypeValue: UInt = r.workoutActivityType.rawValue
                    // print("workoutActivityTypeValue");
                    // print(workoutActivityTypeValue);
                    // print(self.returnWorkoutActivityTypeValueDictionnary(number: workoutActivityTypeValue));
                    
                    var TEBData: Double? = -1
                    var TDData: Double? = -1
                    var TFCData: Double? = -1
                    var TSSCData: Double? = -1

                    // TEB MANAGEMENT
                        var unitTEB: HKUnit?
                        var unitTEBName: String?
                        if ((r.totalEnergyBurned) != nil) {
                            if (r.totalEnergyBurned?.is(compatibleWith: HKUnit.kilocalorie()))! {
                                unitTEB = HKUnit.kilocalorie()
                                unitTEBName = "kilocalorie"
                            }
                            guard unitTEB != nil else { return }
                            guard unitTEBName != nil else { return }
                            TEBData = r.totalEnergyBurned?.doubleValue(for: unitTEB!);
                        } else {
                            TEBData = -1
                        }
                    // TD MANAGEMENT
                        var unitTD: HKUnit?
                        var unitTDName: String?
                        if ((r.totalDistance) != nil) {
                            if (r.totalDistance?.is(compatibleWith: HKUnit.meter()))! {
                                unitTD = HKUnit.meter()
                                unitTDName = "meter"
                            }
                            guard unitTD != nil else { return }
                            guard unitTDName != nil else { return }
                            TDData = r.totalDistance?.doubleValue(for: unitTD!);
                        } else {
                            TDData = -1
                        }
                    // TFC MANAGEMENT
                        var unitTFC: HKUnit?
                        var unitTFCName: String?
                        if ((r.totalFlightsClimbed) != nil) {
                            if (r.totalFlightsClimbed?.is(compatibleWith: HKUnit.count()))! {
                                unitTFC = HKUnit.count()
                                unitTFCName = "count"
                            }
                            guard unitTFC != nil else { return }
                            guard unitTFCName != nil else { return }
                            TFCData = r.totalFlightsClimbed?.doubleValue(for: unitTFC!);
                        } else {
                            TFCData = -1
                        }
                    // TSSC MANAGEMENT
                        var unitTSSC: HKUnit?
                        var unitTSSCName: String?
                        if ((r.totalSwimmingStrokeCount) != nil) {
                            if (r.totalSwimmingStrokeCount?.is(compatibleWith: HKUnit.count()))! {
                                unitTSSC = HKUnit.count()
                                unitTSSCName = "count"
                            }
                            guard unitTSSC != nil else { return }
                            guard unitTSSCName != nil else { return }
                            TSSCData = r.totalSwimmingStrokeCount?.doubleValue(for: unitTSSC!);
                        } else {
                            TSSCData = -1
                        }
                    // WORKOUT EVENT MANAGEMENT
                        // todo later
                
                    // GET DURATION WORKOUT
                        let workoutSD : NSDate
                        let workoutED : NSDate
                        workoutSD = r.startDate as NSDate
                        workoutED = r.endDate as NSDate
                        let workoutInterval = workoutED.timeIntervalSince(workoutSD as Date)
                        let workoutSecondsInAnHour: Double = 3600;
                        let workoutHoursBetweenDates = workoutInterval / workoutSecondsInAnHour;
                        // print("workout duration:")
                        // print(workoutHoursBetweenDates)
                    
                    
                     output.append([
                        "uuid": r.uuid.uuidString,
                         "startDate": ISO8601DateFormatter().string(from: r.startDate),
                         "endDate": ISO8601DateFormatter().string(from: r.endDate),
                         "duration": workoutHoursBetweenDates,
                         "source": r.sourceRevision.source.name,
                         "sourceBundleId": r.sourceRevision.source.bundleIdentifier,
                         "workoutActivityId": workoutActivityTypeValue,
                         "workoutActivityName": self.returnWorkoutActivityTypeValueDictionnary(number: workoutActivityTypeValue),
                         "totalEnergyBurned": TEBData!, // kilocalorie
                         "totalDistance": TDData!, // meter
                         "totalFlightsClimbed": TFCData!, // count
                         "totalSwimmingStrokeCount": TSSCData! // count
                     ])
                 }
                
                 completion(.success([
                     "countReturn": result.count,
                     "resultData": output
                 ]))
            }
            healthStore.execute(query2)
        } else {
            
            /*
             
             ** QUERY FOR QUANTITY DATA
             
            */
            
            let query3 = HKSampleQuery(sampleType: _sampleType!, predicate: _predicate, limit: limit, sortDescriptors: nil) {
                query, results, error in
                
                // print(results);
                // print("-- -- --");
                
                if error != nil {
                    completion(.failure(error!))
                    return
                }
                
                
                // Je mets quantity ici pour tester
                guard let result = results as? [HKQuantitySample] else {
                    completion(.failure(HKSampleError.quantityRequestFailed))
                    return
                }
                
                var output: [[String: Any]] = []
                
                for r in result {
                    
                    var unit: HKUnit?
                    var unitName: String?
                    
                    if r.quantityType.is(compatibleWith: HKUnit.meter()) {
                        unit = HKUnit.meter()
                        unitName = "meter"
                    } else if r.quantityType.is(compatibleWith: HKUnit.count()) {
                        unit = HKUnit.count()
                        unitName = "count"
                    } else if r.quantityType.is(compatibleWith: HKUnit.minute()) {
                        unit = HKUnit.minute()
                        unitName = "minute"
                    } else if r.quantityType.is(compatibleWith: HKUnit.kilocalorie()) {
                        unit = HKUnit.kilocalorie()
                        unitName = "kilocalorie"
                    } else {
                        print("Error: unknown unit type")
                    }
                    
                    guard unit != nil else { return }
                    guard unitName != nil else { return }
                    
                    // ALSO WORK FOR DATE FORMATER ::
                    // Date formater
                    // let dateFormatter = DateFormatter()
                    // dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
                    
                    
                    // GET DURATION QUANTITY
                        let quantitySD : NSDate
                        let quantityED : NSDate
                        quantitySD = r.startDate as NSDate
                        quantityED = r.endDate as NSDate
                        let quantityInterval = quantityED.timeIntervalSince(quantitySD as Date)
                        let quantitySecondsInAnHour: Double = 3600;
                        let quantityHoursBetweenDates = quantityInterval / quantitySecondsInAnHour;
                        // print("quantity duration:")
                        // print(quantityHoursBetweenDates)
                    
                    output.append([
                        "uuid": r.uuid.uuidString,
                        "value": r.quantity.doubleValue(for: unit!),
                        "unitName": unitName!,
                        "startDate": ISO8601DateFormatter().string(from: r.startDate),
                        "endDate": ISO8601DateFormatter().string(from: r.endDate),
                        "duration": quantityHoursBetweenDates,
                        "source": r.sourceRevision.source.name,
                        "sourceBundleId": r.sourceRevision.source.bundleIdentifier
                    ])
                }
                
                completion(.success([
                    "countReturn": result.count,
                    "resultData": output
                ]))
                            
            }
            
            healthStore.execute(query3)
        }
        
    }
    
}

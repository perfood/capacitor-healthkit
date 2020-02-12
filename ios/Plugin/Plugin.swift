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
    
    @objc func authorize(_ call: CAPPluginCall) {
        
        if HKHealthStore.isHealthDataAvailable() {
            
            let allTypes = Set([HKObjectType.quantityType(forIdentifier: .stepCount)!,
                                HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!])
            
            healthStore.requestAuthorization(toShare: allTypes, read: allTypes) { (success, error) in
                
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
    
    @objc func getDistance(_ call: CAPPluginCall){
        
        guard let start = call.options["startDate"] as? String else {
            call.reject("Must provide start date")
            return
        }
        
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "yyyy/MM/dd";
        
        
        let now = Date()
        let startDate = dateFormatter.date(from: start);
        
        let distanceQuantityType = HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: now, options: HKQueryOptions.strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: distanceQuantityType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, _ in
            
            guard let result = result, let sum = result.sumQuantity() else {
                call.reject("Could not query data");
                return
            }
            
            let totalDistance = sum.doubleValue(for: HKUnit.meter())
            
            call.resolve([
                "totalDistance": totalDistance
            ])
        }
        
        healthStore.execute(query)
    
    }
}

import Foundation
import HealthKit

func getSampleType(sampleName: String) -> HKSampleType? {
    switch sampleName {
        case "activeEnergyBurned":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!
        case "appleExerciseTime":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.appleExerciseTime)!
        case "basalEnergyBurned":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.basalEnergyBurned)!
        case "bloodGlucose":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bloodGlucose)!
        case "distanceCycling":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceCycling)!
        case "distanceWalkingRunning":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!
        case "flightsClimbed":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.flightsClimbed)!
        case "heartRate":
              return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!
        case "sleepAnalysis":
            return HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis)!
        case "stepCount":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        case "weight":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)!
        case "workout":
            return HKWorkoutType.workoutType()
        default:
            return nil
    }
}

func getSampleTypes(sampleNames: [String]) -> Set<HKSampleType> {
    var types: Set<HKSampleType> = []
    
    for item in sampleNames {
        if let type = getSampleType(sampleName: item) {
            types.insert(type)
        }
    }
    
    return types
}

func getQuantityType(sampleName: String) -> HKQuantityType {
    switch sampleName {
        case "activeEnergyBurned":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!
        case "appleExerciseTime":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.appleExerciseTime)!
        case "basalEnergyBurned":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.basalEnergyBurned)!
        case "bloodGlucose":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bloodGlucose)!
        case "distanceCycling":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceCycling)!
        case "distanceWalkingRunning":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!
        case "flightsClimbed":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.flightsClimbed)!
        case "heartRate":
              return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!
        case "stepCount":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        case "weight":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)!
        default:
            fatalError(sampleName + " is not supported.")
    }
}


import Foundation
import HealthKit

func getActivityTypeAsString(_ activityType: HKWorkoutActivityType) -> String {
    // see https://developer.apple.com/documentation/healthkit/hkworkoutactivitytype
    switch activityType {
        // Individual sports
        case HKWorkoutActivityType.archery:
            return "archery"
        case HKWorkoutActivityType.bowling:
            return "bowling"
        case HKWorkoutActivityType.fencing:
            return "fencing"
        case HKWorkoutActivityType.gymnastics:
            return "gymnastics"
        case HKWorkoutActivityType.trackAndField:
            return "trackAndField"

        // Team sports
        case HKWorkoutActivityType.americanFootball:
            return "americanFootball"
        case HKWorkoutActivityType.australianFootball:
            return "australianFootball"
        case HKWorkoutActivityType.baseball:
            return "baseball"
        case HKWorkoutActivityType.basketball:
            return "basketball"
        case HKWorkoutActivityType.cricket:
            return "cricket"
        case HKWorkoutActivityType.discSports:
            return "discSports"
        case HKWorkoutActivityType.handball:
            return "handball"
        case HKWorkoutActivityType.hockey:
            return "hockey"
        case HKWorkoutActivityType.lacrosse:
            return "lacrosse"
        case HKWorkoutActivityType.rugby:
            return "rugby"
        case HKWorkoutActivityType.soccer:
            return "soccer"
        case HKWorkoutActivityType.softball:
            return "softball"
        case HKWorkoutActivityType.volleyball:
            return "volleyball"
        
        // Exercise and fitness
        case HKWorkoutActivityType.preparationAndRecovery:
            return "preparationAndRecovery"
        case HKWorkoutActivityType.flexibility:
            return "flexibility"
        case HKWorkoutActivityType.cooldown:
            return "cooldown"
        case HKWorkoutActivityType.walking:
            return "walking"
        case HKWorkoutActivityType.running:
            return "running"
        case HKWorkoutActivityType.wheelchairWalkPace:
            return "wheelchairWalkPace"
        case HKWorkoutActivityType.wheelchairRunPace:
            return "wheelchairRunPace"
        case HKWorkoutActivityType.cycling:
            return "cycling"
        case HKWorkoutActivityType.handCycling:
            return "handCycling"
        case HKWorkoutActivityType.coreTraining:
            return "coreTraining"
        case HKWorkoutActivityType.elliptical:
            return "elliptical"
        case HKWorkoutActivityType.functionalStrengthTraining:
            return "functionalStrengthTraining"
        case HKWorkoutActivityType.traditionalStrengthTraining:
            return "traditionalStrengthTraining"
        case HKWorkoutActivityType.crossTraining:
            return "crossTraining"
        case HKWorkoutActivityType.mixedCardio:
            return "mixedCardio"
        case HKWorkoutActivityType.highIntensityIntervalTraining:
            return "highIntensityIntervalTraining"
        case HKWorkoutActivityType.jumpRope:
            return "jumpRope"
        case HKWorkoutActivityType.stairClimbing:
            return "stairClimbing"
        case HKWorkoutActivityType.stairs:
            return "stairs"
        case HKWorkoutActivityType.stepTraining:
            return "stepTraining"
        case HKWorkoutActivityType.fitnessGaming:
            return "fitnessGaming"
        
        // Studio activities
        case HKWorkoutActivityType.barre:
            return "barre"
        case HKWorkoutActivityType.cardioDance:
            return "cardioDance"
        case HKWorkoutActivityType.socialDance:
            return "socialDance"
        case HKWorkoutActivityType.yoga:
            return "yoga"
        case HKWorkoutActivityType.mindAndBody:
            return "mindAndBody"
        case HKWorkoutActivityType.pilates:
            return "pilates"

        // Racket sports
        case HKWorkoutActivityType.badminton:
            return "badminton"
        case HKWorkoutActivityType.pickleball:
            return "pickleball"
        case HKWorkoutActivityType.racquetball:
            return "racquetball"
        case HKWorkoutActivityType.squash:
            return "squash"
        case HKWorkoutActivityType.tableTennis:
            return "tableTennis"
        case HKWorkoutActivityType.tennis:
            return "tennis"
        
        // Outdoor activities
        case HKWorkoutActivityType.climbing:
            return "climbing"
        case HKWorkoutActivityType.equestrianSports:
            return "equestrianSports"
        case HKWorkoutActivityType.fishing:
            return "fishing"
        case HKWorkoutActivityType.golf:
            return "golf"
        case HKWorkoutActivityType.hiking:
            return "hiking"
        case HKWorkoutActivityType.hunting:
            return "hunting"
        case HKWorkoutActivityType.play:
            return "play"
        
        // Snow and ice sports
        case HKWorkoutActivityType.crossCountrySkiing:
            return "crossCountrySkiing"
        case HKWorkoutActivityType.curling:
            return "curling"
        case HKWorkoutActivityType.downhillSkiing:
            return "downhillSkiing"
        case HKWorkoutActivityType.snowSports:
            return "snowSports"
        case HKWorkoutActivityType.snowboarding:
            return "snowboarding"
        case HKWorkoutActivityType.skatingSports:
            return "skatingSports"
        
        // Water activities
        case HKWorkoutActivityType.paddleSports:
            return "padleSports"
        case HKWorkoutActivityType.rowing:
            return "rowing"
        case HKWorkoutActivityType.sailing:
            return "sailing"
        case HKWorkoutActivityType.surfingSports:
            return "surfingSports"
        case HKWorkoutActivityType.swimming:
            return "swimming"
        case HKWorkoutActivityType.waterFitness:
            return "waterFitness"
        case HKWorkoutActivityType.waterPolo:
            return "waterPolo"
        case HKWorkoutActivityType.waterSports:
            return "waterSports"
        
        // Martial arts
        case HKWorkoutActivityType.boxing:
            return "boxing"
        case HKWorkoutActivityType.kickboxing:
            return "kickboxing"
        case HKWorkoutActivityType.martialArts:
            return "martialArts"
        case HKWorkoutActivityType.taiChi:
            return "taiChi"
        case HKWorkoutActivityType.wrestling:
            return "wrestling"
        
        // Deprecated activity types
        case HKWorkoutActivityType.dance:
            return "dance"
        case HKWorkoutActivityType.danceInspiredTraining:
            return "danceInspiredTraining"
        case HKWorkoutActivityType.mixedMetabolicCardioTraining:
            return "mixedMetabolicCardioTraining"
        
        // Multisport activities
        case HKWorkoutActivityType.swimBikeRun:
            return "swimBikeRun"
        case HKWorkoutActivityType.transition:
            return "transition"
                    
        // // Enumeration Cases
        // case HKWorkoutActivityType.underwaterDiving: // beta
        //     return "underwaterDiving"
        
        // HKWorkoutActivityType.other and everything else
        default:
            return "other"
    }
 }


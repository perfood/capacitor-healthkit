import Foundation
import HealthKit

func getActivityTypeAsString(_ activityType: HKWorkoutActivityType) -> String {
     switch activityType {
         case HKWorkoutActivityType.americanFootball:
             return "American Football"
         case HKWorkoutActivityType.archery:
             return "Archery"
         case HKWorkoutActivityType.australianFootball:
             return "Australian Football"
         case HKWorkoutActivityType.badminton:
             return "Badminton"
         case HKWorkoutActivityType.baseball:
             return "Baseball"
         case HKWorkoutActivityType.basketball:
             return "Basketball"
         case HKWorkoutActivityType.bowling:
             return "Bowling"
         case HKWorkoutActivityType.boxing:
             return "Boxing"
         case HKWorkoutActivityType.climbing:
             return "Climbing"
         case HKWorkoutActivityType.crossTraining:
             return "Cross Training"
         case HKWorkoutActivityType.curling:
             return "Curling"
         case HKWorkoutActivityType.cycling:
             return "Cycling"
         case HKWorkoutActivityType.dance:
             return "Dance"
         case HKWorkoutActivityType.danceInspiredTraining:
             return "Dance Inspired Training"
         case HKWorkoutActivityType.elliptical:
             return "Elliptical"
         case HKWorkoutActivityType.equestrianSports:
             return "Equestrian Sports"
         case HKWorkoutActivityType.fencing:
             return "Fencing"
         case HKWorkoutActivityType.fishing:
             return "Fishing"
         case HKWorkoutActivityType.functionalStrengthTraining:
             return "Functional Strength Training"
         case HKWorkoutActivityType.golf:
             return "Golf"
         case HKWorkoutActivityType.gymnastics:
             return "Gymnastics"
         case HKWorkoutActivityType.handball:
             return "Handball"
         case HKWorkoutActivityType.hiking:
             return "Hiking"
         case HKWorkoutActivityType.hockey:
             return "Hockey"
         case HKWorkoutActivityType.hunting:
             return "Hunting"
         case HKWorkoutActivityType.lacrosse:
             return "Lacrosse"
         case HKWorkoutActivityType.martialArts:
             return "Martial Arts"
         case HKWorkoutActivityType.mindAndBody:
             return "Mind and Body"
         case HKWorkoutActivityType.mixedMetabolicCardioTraining:
             return "Mixed Metabolic Cardio Training"
         case HKWorkoutActivityType.paddleSports:
             return "Paddle Sports"
         case HKWorkoutActivityType.play:
             return "Play"
         case HKWorkoutActivityType.preparationAndRecovery:
             return "Preparation and Recovery"
         case HKWorkoutActivityType.racquetball:
             return "Racquetball"
         case HKWorkoutActivityType.rowing:
             return "Rowing"
         case HKWorkoutActivityType.rugby:
             return "Rugby"
         case HKWorkoutActivityType.running:
             return "Running"
         case HKWorkoutActivityType.sailing:
             return "Sailing"
         case HKWorkoutActivityType.skatingSports:
             return "Skating Sports"
         case HKWorkoutActivityType.snowSports:
             return "Snow Sports"
         case HKWorkoutActivityType.soccer:
             return "Soccer"
         case HKWorkoutActivityType.softball:
             return "Softball"
         case HKWorkoutActivityType.squash:
             return "Squash"
         case HKWorkoutActivityType.stairClimbing:
             return "Stair Climbing"
         case HKWorkoutActivityType.surfingSports:
             return "Surfing Sports"
         case HKWorkoutActivityType.swimming:
             return "Swimming"
         case HKWorkoutActivityType.tableTennis:
             return "Table Tennis"
         case HKWorkoutActivityType.tennis:
             return "Tennis"
         case HKWorkoutActivityType.trackAndField:
             return "Track and Field"
         case HKWorkoutActivityType.traditionalStrengthTraining:
             return "Traditional Strength Training"
         case HKWorkoutActivityType.volleyball:
             return "Volleyball"
         case HKWorkoutActivityType.walking:
             return "Walking"
         case HKWorkoutActivityType.waterFitness:
             return "Water Fitness"
         case HKWorkoutActivityType.waterPolo:
             return "Water Polo"
         case HKWorkoutActivityType.waterSports:
             return "Water Sports"
         case HKWorkoutActivityType.wrestling:
             return "Wrestling"
         case HKWorkoutActivityType.yoga:
             return "Yoga"
         // iOS 10
         case HKWorkoutActivityType.barre:
             return "Barre"
         case HKWorkoutActivityType.coreTraining:
             return "Core Training"
         case HKWorkoutActivityType.crossCountrySkiing:
             return "Cross Country Skiing"
         case HKWorkoutActivityType.downhillSkiing:
             return "Downhill Skiing"
         case HKWorkoutActivityType.flexibility:
             return "Flexibility"
         case HKWorkoutActivityType.highIntensityIntervalTraining:
             return "High Intensity Interval Training"
         case HKWorkoutActivityType.jumpRope:
             return "Jump Rope"
         case HKWorkoutActivityType.kickboxing:
             return "Kickboxing"
         case HKWorkoutActivityType.pilates:
             return "Pilates"
         case HKWorkoutActivityType.snowboarding:
             return "Snowboarding"
         case HKWorkoutActivityType.stairs:
             return "Stairs"
         case HKWorkoutActivityType.stepTraining:
             return "Step Training"
         case HKWorkoutActivityType.wheelchairWalkPace:
             return "Wheelchair Walk Pace"
         case HKWorkoutActivityType.wheelchairRunPace:
             return "Wheelchair Run Pace"
         // iOS 11
         case HKWorkoutActivityType.taiChi:
             return "Tai Chi"
         case HKWorkoutActivityType.mixedCardio:
             return "Mixed Cardio"
         case HKWorkoutActivityType.handCycling:
             return "Hand Cycling"
         // iOS 13
         case HKWorkoutActivityType.discSports:
             return "Disc Sports"
         case HKWorkoutActivityType.fitnessGaming:
             return "Fitness Gaming"
         // Catch-all
         default:
             return "Other"
     }
 }


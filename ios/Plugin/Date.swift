import Foundation

struct Interval {
    let unit: String
    let value: Int
}

func getDateFromString(inputDate: String) -> Date{
    let formatter = ISO8601DateFormatter()
        
    formatter.formatOptions =  [.withInternetDateTime, .withFractionalSeconds]
        
    return formatter.date(from: inputDate)!
}

func getInterval(_ unit: String, _ value: Int) -> DateComponents {
    switch unit {
        case "second":
            return DateComponents(second: value)
        case "minute":
            return DateComponents(minute: value)
        case "hour":
            return DateComponents(hour: value)
        case "day":
            return DateComponents(day: value)
        case "month":
            return DateComponents(month: value)
        case "year":
            return DateComponents(year: value)
        default:
            fatalError(unit + " is not a supported unit.")
    }
}

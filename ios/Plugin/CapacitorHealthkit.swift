import Foundation

@objc public class CapacitorHealthkit: NSObject {
    @objc public func requestAuthorization(_ value: String) {
        print(value)
    }
    @objc public func queryHKitSampleType(_ value: String) -> String{
        print(value)
        return value
    }
    @objc func isEditionAuthorized(_ value: String) {
        print(value)
    }

    @objc func multipleIsEditionAuthorized(_ value: String) {
        print(value)
    }

    @objc func isAvailable(_ value: String)   {
        print(value)
    }

    @objc func multipleQueryHKitSampleType(_ value: String) -> String  {
        return value;
    }
}

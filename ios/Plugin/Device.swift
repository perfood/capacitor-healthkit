import Foundation
import HealthKit

func getDeviceInformation(device: HKDevice?) -> [String: String?]? {
    if (device == nil) {
        return nil;
    }
    
    let deviceInformation: [String: String?] = [
        "name": device?.name,
        "model": device?.model,
        "manufacturer": device?.manufacturer,
        "hardwareVersion": device?.hardwareVersion,
        "softwareVersion": device?.softwareVersion,
    ];
            
    return deviceInformation;
}

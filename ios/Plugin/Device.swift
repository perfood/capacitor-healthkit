import Foundation
import HealthKit

struct DeviceInformation {
    let name: String?
    let model: String?
    let manufacturer: String?
    let hardwareVersion: String?
    let softwareVersion: String?
    let firmwareVersion: String?
    let localIdentifier: String?
    let udiDeviceIdentifier: String?
}

func getDeviceInformation(device: HKDevice?) -> DeviceInformation? {
    if (device == nil) {
        return nil
    }
    
    let deviceInformation = DeviceInformation(
        name: device?.name,
        model: device?.model,
        manufacturer: device?.manufacturer,
        hardwareVersion: device?.hardwareVersion,
        softwareVersion: device?.softwareVersion,
        firmwareVersion: device?.firmwareVersion,
        localIdentifier: device?.localIdentifier,
        udiDeviceIdentifier: device?.udiDeviceIdentifier
    )
            
    return deviceInformation;
}

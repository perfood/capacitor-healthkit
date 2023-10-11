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

func convertToDeviceInformationDictionary(_ deviceInfo: DeviceInformation?) -> [String: Any]? {
    guard let deviceInfo = deviceInfo else {
        return nil
    }

    return [
        "name": deviceInfo.name ?? NSNull(),
        "model": deviceInfo.model ?? NSNull(),
        "manufacturer": deviceInfo.manufacturer ?? NSNull(),
        "hardwareVersion": deviceInfo.hardwareVersion ?? NSNull(),
        "softwareVersion": deviceInfo.softwareVersion ?? NSNull(),
        "firmwareVersion": deviceInfo.firmwareVersion ?? NSNull(),
        "localIdentifier": deviceInfo.localIdentifier ?? NSNull(),
        "udiDeviceIdentifier": deviceInfo.udiDeviceIdentifier ?? NSNull()
    ]
}

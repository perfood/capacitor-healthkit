declare global {
    interface PluginRegistry {
        CapacitorHealthkit?: CapacitorHealthkitPlugin;
    }
}
export interface CapacitorHealthkitPlugin {
    requestAuthorization(): Promise<any>;
    isAvailable(): Promise<any>;
    queryHKitSampleType(): Promise<any>;
    multipleQueryHKitSampleType(): Promise<any>;
    isEditionAuthorized(): Promise<any>;
    multipleIsEditionAuthorized(): Promise<any>;
}

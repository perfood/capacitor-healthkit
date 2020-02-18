declare global {
    interface PluginRegistry {
        CapacitorHealthkit?: CapacitorHealthkitPlugin;
    }
}
export interface CapacitorHealthkitPlugin {
    requestAuthorization(): Promise<any>;
    isAvailable(): Promise<any>;
    queryHKitSampleType(): Promise<any>;
}

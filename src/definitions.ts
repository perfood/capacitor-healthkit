/*
declare module "@capacitor/core" {
  interface PluginRegistry {
    CapacitorHealthkit: CapacitorHealthkitPlugin;
  }
}
*/
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
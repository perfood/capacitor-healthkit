export interface CapacitorHealthkitPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  requestAuthorization(a:any): Promise<void>;
  queryHKitSampleType(example:any): Promise<any>;
  isAvailable(): Promise<void>;
  multipleQueryHKitSampleType(example:any): Promise<any>;
  isEditionAuthorized(): Promise<void>;
  multipleIsEditionAuthorized(): Promise<void>;
}

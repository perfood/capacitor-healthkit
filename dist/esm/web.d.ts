import { WebPlugin } from '@capacitor/core';
import { CapacitorHealthkitPlugin } from './definitions';
export declare class CapacitorHealthkitWeb extends WebPlugin implements CapacitorHealthkitPlugin {
    constructor();
    requestAuthorization(): Promise<any>;
    isAvailable(): Promise<any>;
    queryHKitSampleType(): Promise<any>;
    multipleQueryHKitSampleType(): Promise<any>;
    isEditionAuthorized(): Promise<any>;
    multipleIsEditionAuthorized(): Promise<any>;
}
declare const CapacitorHealthkit: CapacitorHealthkitWeb;
export { CapacitorHealthkit };

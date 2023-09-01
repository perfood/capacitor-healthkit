export interface CapacitorHealthkitPlugin {
  requestAuthorization(options: RequestAuthorizationOptions): Promise<void>;
  isAvailable(): Promise<void>;
  getAuthorizationStatus(
    options: GetAuthorizationStatusOptions,
  ): Promise<{ status: AuthorizationStatus }>;
  getStatisticsCollection(options: StatisticsCollectionOptions): Promise<any>; // TODO: add response type
  getBodyMassEntries(): Promise<any>; // TODO: add response type
}

export interface RequestAuthorizationOptions {
  all?: string[];
  read?: string[];
  write?: string[];
}

export interface GetAuthorizationStatusOptions {
  sampleType: string;
}

export type AuthorizationStatus =
  | 'notDetermined'
  | 'sharingDenied'
  | 'sharingAuthorized';

export interface StatisticsCollectionOptions {
  startDate: string;
  endDate?: string;
  anchorDate: string;
  interval: StatisticsCollectionQueryInterval;
  quantityTypeSampleName: QuantityType;
}

export interface StatisticsCollectionQueryInterval {
  unit: 'second' | 'minute' | 'hour' | 'day' | 'month' | 'year';
  value: number;
}

export type QuantityType = 'stepCount'; // TODO: implement more quantity types

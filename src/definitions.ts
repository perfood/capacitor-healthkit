export interface CapacitorHealthkitPlugin {
  requestAuthorization(options: RequestAuthorizationOptions): Promise<void>;
  isAvailable(): Promise<void>;
  getAuthorizationStatus(
    options: GetAuthorizationStatusOptions,
  ): Promise<{ status: AuthorizationStatus }>;
  getStatisticsCollection(options: StatisticsCollectionOptions): Promise<any>; // TODO: add response type
  getWorkouts(options: GetWorkoutsQueryOptions): Promise<any>;
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
export interface GetWorkoutsQueryOptions {
  startDate: string;
  endDate?: string;
  anchorDate: string;
  limit?: number;
}

export interface StatisticsCollectionQueryInterval {
  unit: 'second' | 'minute' | 'hour' | 'day' | 'month' | 'year';
  value: number;
}

export type QuantityType = 'stepCount'; // TODO: implement more quantity types

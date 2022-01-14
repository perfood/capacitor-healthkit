export interface CapacitorHealthkitPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  requestAuthorization(authOptions: AuthorizationQueryOptions): Promise<void>;
  queryHKitSampleType<T>(queryOptions:SingleQueryOptions): Promise<QueryOutput<T>>;
  isAvailable(): Promise<void>;
  multipleQueryHKitSampleType(queryOptions:MultipleQueryOptions): Promise<any>;
  isEditionAuthorized(): Promise<void>;
  multipleIsEditionAuthorized(): Promise<void>;
}
export interface QueryOutput<T = SleepData | ActivityData | OtherData> {
  countReturn: number;
  resultData: T[];
}

export interface BaseData {
  startDate: string;
  endDate: string;
  source: string;
  uuid: string;
  sourceBundleId: string;
  duration: number;
}
export interface SleepData extends BaseData  {
  sleepState: string;
  timeZone: string;
}

export interface ActivityData extends BaseData {
  totalFlightsClimbed: number;
  totalSwimmingStrokeCount: number;
  totalEnergyBurned: number;
  totalDistance: number;
  workoutActivityId: number;
  workoutActivityName: number;
}

export interface OtherData extends BaseData {
  unitName: string; 
  value: number;
}

export interface BaseQueryOptions {
  startDate: string;
  endDate: string;
  limit: number;
}

export interface SingleQueryOptions extends BaseQueryOptions {
  sampleName: string;
}

export interface MultipleQueryOptions extends BaseQueryOptions {
  sampleNames: string[];
}

export interface AuthorizationQueryOptions {
  read: string[];
  write: string[];
  all: string[];
}


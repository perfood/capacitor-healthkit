export interface CapacitorHealthkitPlugin {
  /**
   * This functions will open the iOS Screen to let users choose their permissions. Keep in mind as developers, if the access has been denied by the user we will have no way of knowing - the query results will instead just be empty arrays.
   * @param authOptions These define which access we need. Possible Options include ['calories', 'stairs', 'activity', 'steps', 'distance', 'duration', 'weight'].

   */
  requestAuthorization(authOptions: AuthorizationQueryOptions): Promise<void>;
  /**
   * This defines a query to the Healthkit for a single type of data.
   * @param queryOptions defines the type of data and the timeframe which shall be queried, a limit can be set to reduce the number of results.
   */
  queryHKitSampleType<T>(queryOptions:SingleQueryOptions): Promise<QueryOutput<T>>;
  /**
   * This functions resolves if HealthKitData is available it uses the native HKHealthStore.isHealthDataAvailable() funtion of the HealthKit .
   */
  isAvailable(): Promise<void>;
  /**
   * This defines a query to the Healthkit for a single type of data. This function has not been tested.
   * @param queryOptions defines the sample types which can be queried for
   */
  multipleQueryHKitSampleType(queryOptions:MultipleQueryOptions): Promise<any>;
  /**
   * Checks if there is writing permission for one specific sample type. This function has not been tested.
   * @param queryOptions defines the sampletype for which you need to check for writing permission.
   */
  isEditionAuthorized(queryOptions: EditionQuery): Promise<void>;
  /**
   * Checks if there is writing permission for multiple sample types. This function has not been tested - and usually needs a parameter to be able to answer.
   */
  multipleIsEditionAuthorized(): Promise<void>;
}

/**
 * This interface is used for any results coming from HealthKit. It always has a count and the actual results.
 */
export interface QueryOutput<T = SleepData | ActivityData | OtherData> {
  countReturn: number;
  resultData: T[];
}

export interface DeviceInformation {
  name: string;
  manufacturer: string;
  model: string;
  hardwareVersion: string;
  softwareVersion: string;
}

/**
 * These data points are returned for every entry.
 */
export interface BaseData {
  startDate: string;
  endDate: string;
  source: string;
  uuid: string;
  sourceBundleId: string;
  device: DeviceInformation | null;
  duration: number;
}

/**
 * These data points are specific for sleep data.
 */
export interface SleepData extends BaseData  {
  sleepState: string;
  timeZone: string;
}

/**
 * These data points are specific for activities - not every activity automatically has a corresponding entry. 
 */
export interface ActivityData extends BaseData {
  totalFlightsClimbed: number;
  totalSwimmingStrokeCount: number;
  totalEnergyBurned: number;
  totalDistance: number;
  workoutActivityId: number;
  workoutActivityName: string;
}

/**
 * These datapoints are used in the plugin for ACTIVE_ENERGY_BURNED and STEP_COUNT.
 */
export interface OtherData extends BaseData {
  unitName: string;
  value: number;
}

/**
 * These Basequeryoptions are always necessary for a query, they are extended by SingleQueryOptions and MultipleQueryOptions.
 */
export interface BaseQueryOptions {
  startDate: string;
  endDate: string;
  limit: number;
}

/**
 * This extends the Basequeryoptions for a single sample type.
 */
export interface SingleQueryOptions extends BaseQueryOptions {
  sampleName: string;
}

/**
 * This extends the Basequeryoptions for a multiple sample types.
 */
export interface MultipleQueryOptions extends BaseQueryOptions {
  sampleNames: string[];
}


/**
 * Used for authorization of reading and writing access.
 */
export interface AuthorizationQueryOptions {
  read: string[];
  write: string[];
  all: string[];
}


/**
 * This is used for checking writing permissions.
 */
export interface EditionQuery {
  sampleName: string;
}

/**
 * These Sample names define the possible query options.
 */
export enum SampleNames {
  STEP_COUNT = 'stepCount',
  FLIGHTS_CLIMBED = 'flightsClimbed',
  APPLE_EXERCISE_TIME = 'appleExerciseTime',
  ACTIVE_ENERGY_BURNED = 'activeEnergyBurned',
  BASAL_ENERGY_BURNED = 'basalEnergyBurned',
  DISTANCE_WALKING_RUNNING = 'distanceWalkingRunning',
  DISTANCE_CYCLING = 'distanceCycling',
  BLOOD_GLUCOSE = 'bloodGlucose',
  SLEEP_ANALYSIS = 'sleepAnalysis',
  WORKOUT_TYPE = 'workoutType',
  WEIGHT = 'weight',
  HEART_RATE = 'heartRate',
}

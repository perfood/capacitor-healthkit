export interface CapacitorHealthkitPlugin {
  requestAuthorization(options: RequestAuthorizationOptions): Promise<void>;
  isAvailable(): Promise<void>;
  getAuthorizationStatus(
    options: GetAuthorizationStatusOptions,
  ): Promise<{ status: AuthorizationStatus }>;
  getStatisticsCollection(options: StatisticsCollectionOptions): Promise<any>; // TODO: add response type
  getBodyMassEntries(options: BodyMassQueryOptions): Promise<any>; // TODO: add response type
  getWorkouts(options: WorkoutsQueryOptions): Promise<any>;
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
export interface WorkoutsQueryOptions {
  startDate: string;
  endDate?: string;
  limit?: number;
}

export interface BodyMassQueryOptions {
  startDate: string;
  endDate?: string;
  limit?: number;
}

export interface StatisticsCollectionQueryInterval {
  unit: 'second' | 'minute' | 'hour' | 'day' | 'month' | 'year';
  value: number;
}

export type QuantityType = 'stepCount'; // TODO: implement more quantity types

// See https://developer.apple.com/documentation/healthkit/hkworkoutactivitytype
export type ActivityType =
  // Individual sports
  | 'archery'
  | 'bowling'
  | 'fencing'
  | 'gymnastics'
  | 'trackAndField'

  // Team sports
  | 'americanFootball'
  | 'australianFootball'
  | 'baseball'
  | 'basketball'
  | 'cricket'
  | 'discSports'
  | 'handball'
  | 'hockey'
  | 'lacrosse'
  | 'rugby'
  | 'soccer'
  | 'softball'
  | 'volleyball'

  // Exercise and fitness
  | 'preparationAndRecovery'
  | 'flexibility'
  | 'cooldown'
  | 'walking'
  | 'running'
  | 'wheelchairWalkPace'
  | 'wheelchairRunPace'
  | 'cycling'
  | 'handCycling'
  | 'coreTraining'
  | 'elliptical'
  | 'functionalStrengthTraining'
  | 'traditionalStrengthTraining'
  | 'crossTraining'
  | 'mixedCardio'
  | 'highIntensityIntervalTraining'
  | 'jumpRope'
  | 'stairClimbing'
  | 'stairs'
  | 'stepTraining'
  | 'fitnessGaming'

  // Studio activities
  | 'barre'
  | 'cardioDance'
  | 'socialDance'
  | 'yoga'
  | 'mindAndBody'
  | 'pilates'

  // Racket sports
  | 'badminton'
  | 'pickleball'
  | 'racquetball'
  | 'squash'
  | 'tableTennis'
  | 'tennis'

  // Outdoor activities
  | 'climbing'
  | 'equestrianSports'
  | 'fishing'
  | 'golf'
  | 'hiking'
  | 'hunting'
  | 'play'

  // Snow and ice sports
  | 'crossCountrySkiing'
  | 'curling'
  | 'downhillSkiing'
  | 'snowSports'
  | 'snowboarding'
  | 'skatingSports'

  // Water activities
  | 'paddleSports'
  | 'rowing'
  | 'sailing'
  | 'surfingSports'
  | 'swimming'
  | 'waterFitness'
  | 'waterPolo'
  | 'waterSports'

  // Martial arts
  | 'boxing'
  | 'kickboxing'
  | 'martialArts'
  | 'taiChi'
  | 'wrestling'

  // Deprecated activity types
  | 'dance'
  | 'danceInspiredTraining'
  | 'mixedMetabolicCardioTraining'

  // Multisport activities
  | 'swimBikeRun'
  | 'transition'

  // // Enumeration Cases
  // | 'underwaterDiving'

  // HKWorkoutActivityType.other and everything else
  | 'other';

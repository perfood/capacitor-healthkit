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
  queryHKitSampleType(): Promise<QueryOutput>;
  multipleQueryHKitSampleType(): Promise<any>;
  isEditionAuthorized(): Promise<any>;
  multipleIsEditionAuthorized(): Promise<any>;
}

export interface QueryOutput {
  countReturn: Number;
  resultData: SleepData[] | ActivityData[] | StepEnergyData[];
}

export interface BaseData {
  startDate: String;
  endDate: String;
  source: String;
  uuid: String;
  sourceBundleId: String;
}
export interface SleepData extends BaseData  {
  sleepState: String;
  duration: Number;
  timeZone: String;
};

export interface ActivityData extends BaseData {
  totalFlightsClimbed: Number;
  totalSwimmingStrokeCount: Number;
  totalEnergyBurned: Number;
  totalDistance: Number;
  workoutActivityId: Number;
  workoutActivityName: Number;
  duration: Number;
};

export interface StepEnergyData extends BaseData {
  unitName: String; //count|kilocalories
  duration: Number;
  value: Number;
};

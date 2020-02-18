# Capacitor HealthKit Plugin

:heart: Capacitor plugin to retrieve data from HealthKit :heart:

Disclaimer : _for now only some of the HK data base, in the future the retrieve base will be bigger !_

## Getting Started

### Prerequisites

* Add **HealthKit to your Xcode project** (section signing & capabilities)

![alt text](https://i.ibb.co/Bg03ZKf/auth-hk.png)

* ADD **Privacy - Health Share Usage Description** to your Xcode project
* ADD **Privacy - Health Update Usage Description** to your Xcode project

![alt text](https://i.ibb.co/6vHJ0Cg/auth-hk2.png)

### Installing

Do

```
npm i --save capacitor-healthkit
```

Then

```
npx cap update
```

And  **if you use Ionic or Angular, here a example setup:**

in your .ts file add this:

```
const { CapacitorHealthkit } = Plugins;
```

and then you can create async functions for example like this:

```
async queryHKitSampleType(sampleName: string) {
  // sample name, start date (string), end Date (date), limit (0 to infinite)
  // let start = "2019/07/01" // YY/MM/DD
  this.dataName = sampleName;
  const endDate = new Date();
  this.data = await CapacitorHealthkit.queryHKitSampleType({
    _sampleName: sampleName,
    _startDate: '2019/07/01',
    _endDate: endDate,
    _limit: 0
  });
}
```

so you can use the plugin for example with the call `CapacitorHealthkit.queryHKitSampleType(...`

And you're all set ! :+1:

<br/>

## Methods


### isAvailable()

Tells if HealthKit is available on the device.

```
isAvailable(successCallback, errorCallback)
```
* successCallback: `{type: function(available)}`, if available a true is passed as argument, false otherwise
* errorCallback: `{type: function(err)`, called if something went wrong, err contains a textual description of the problem

<br/>

### requestAuthorization()

Requests read and write access to a set of data types. It is recommendable to always explain why the app needs access to the data before asking the user to authorize it.

**Important:** this method must be called before using the query and store methods, even if the authorization has already been given at some point in the past. Failure to do so may cause your app to crash... :grimacing:

```
requestAuthorization(datatypes, successCallback, errorCallback)
```

* datatypes: {type: Mixed array}, a list of data types you want to be granted access to. You can also specify read or write only permissions.
``` 
{
    all : [‘’] // Read & Write permission
    read : ['steps'], // Read only permission
    write : ['height', 'weight'] // Write only permission
}
```

Example:
```
let result = await CapacitorHealthkit.requestAuthorization({
      all: ["calories", "stairs", "activity"], // ask for Read & Write permission
      read: ["steps", "distance", "duration"], // ask for Read Only permission
      write: [""] // ask for Write Only permission
    });
```

* successCallback: `{type: function}`, called if all OK
* errorCallback: `{type: function(err)}`, called if something went wrong, err contains a textual description of the problem

The datatype _activity_ also includes sleep. If you want to get authorization only for workouts, you can specify workouts as datatype, but be aware that this is only availabe in iOS.


**Data type for requestAuthorization:**
| Data type | Unit | What you actually ask from HealthKit with this data type |
| --- | --- | --- |
| steps | count | HKQuantityTypeIdentifierStepCount |
| stairs | count| HKQuantityTypeIdentifierFlightsClimbed |
| distance | m | HKQuantityTypeIdentifierDistanceWalkingRunning + HKQuantityTypeIdentifierDistanceCycling |
| appleExerciseTime | min | HKQuantityTypeIdentifierAppleExerciseTime |
| calories | kcal | HKQuantityTypeIdentifierActiveEnergyBurned + HKQuantityTypeIdentifierBasalEnergyBurned |
| activity | activityType | HKWorkoutTypeIdentifier + HKCategoryTypeIdentifierSleepAnalysis |

<br/>

### queryHKitSampleType()

**_Please make sure that you called correct requestAuthorization for HealthKit sample you want before use this method_** :shipit:

Gets all the data points of a certain data type within a certain time window.

**Warning:** if the time span is big, it can generate long arrays! :cold_sweat:

```
queryHKitSampleType(queryOptions, successCallback, errorCallback)
```

queryOption example:
```
const endDate = new Date();
queryOption = {
      _sampleName: ’stepCount’, // String
      _startDate: '2019/07/01', // String
      _endDate: endDate, // Date
      _limit: 0 // Int
};
```

**Sample name available for queries:**
| Sample name for query | Request Auth Needed  | HealthKit equivalent |
| --- | --- | --- |
| stepCount | steps | HKQuantityTypeIdentifierStepCount |
| flightsClimbed | stairs | HKQuantityTypeIdentifierFlightsClimbed |
| distanceWalkingRunning | distance | HKQuantityTypeIdentifierDistanceWalkingRunning |
| distanceCycling | distance | HKQuantityTypeIdentifierDistanceCycling |
| appleExerciseTime | appleExerciseTime | HKQuantityTypeIdentifierAppleExerciseTime |
| activeEnergyBurned | calories | HKQuantityTypeIdentifierActiveEnergyBurned |
| basalEnergyBurned | calories | HKQuantityTypeIdentifierBasalEnergyBurned |
| sleepAnalysis | activity | HKCategoryTypeIdentifierSleepAnalysis |
| workoutType | activity | HKWorkoutTypeIdentifier |


Example function in **Angular**:
```
async queryHKitSampleType(sampleName: string) {
    // sample name, start date (string), end Date (date), limit (0 to infinite)
    // let start = "2019/07/01" // YY/MM/DD
    this.dataName = sampleName;
    const endDate = new Date();
    this.data = await CapacitorHealthkit.queryHKitSampleType({
      _sampleName: sampleName,
      _startDate: '2019/07/01',
      _endDate: endDate,
      _limit: 0
    });
  }
```

Careful : use `_` before names: `_startDate`

* _startDate: {type: Date}, start date from which to get data
* _endDate: {type: Date}, end data to which to get the data
* _sampleName: {type: String}, the data type to be queried (see above)
* _limit: {type: integer}, optional, sets a maximum number of returned values

* successCallback: {type: function(data) }, called if all OK, data contains the result of the query in the form of an array (detail below)
* errorCallback: {type: function(err)}, called if something went wrong, err contains a textual description of the problem


**iOS quirks:**
* Limit is set to unlimited by default _(if you insert 0)_
* Datapoints are ordered in an descending fashion (from newer to older). You can revert this behaviour by adding ascending: true to your query object.
* HealthKit does not calculate active and basal calories - these must be inputted from an app
* HealthKit does not detect specific activities - these must be inputted from an app
* When querying for activities, only events whose startDate and endDate are both in the query range will be returned.

**Result of query (array):**
```
{
    "countReturn": result.count, // number of results
    "resultDate": output // output data in result of query
}
```

**countReturn** returns the number of results

**output** contain a set of fixed fields:
* startDate: {type: Date} a date indicating when the data point starts
* endDate: {type: Date} a date indicating when the data point ends
* sourceBundleId: {type: String} the identifier of the app that produced the data
* sourceName: {type: String} the name of the app that produced the data (as it appears to the user)
* unit: {type: String} the unit of measurement
* value: the actual value
* uuid: (string) the unique identifier of that measurement


**output content:**

* If quantity type output contains:

```
- uuid (string)
- value (double)
- unitName (string)
- startDate (ISO8601 String)
- endDate (ISO8601 String)
- duration (double)
- source (string)
- sourceBundleId (string)
```

* If Workout type output contains :

```
- uuid (string)
- startDate (ISO8601 String)
- endDate (ISO8601 String)
- duration (double)
- source (string)
- sourceBundleId (string)
- workoutActivityId (Int)
- totalEnergyBurned (kilocalorie)
- totalDistance (meter)
- totalFlightsClimbed (count)
- totalSwimmingStrokeCount (count)
```

_If data = -1 => no data collected_

* If Sleep type output contains :

```
- uuid (string)
- startDate (ISO8601 String)
- endDate (ISO8601 String)
- duration (double)
- source (string)
- sourceBundleId (string)
```

## Questions ?

Please contact me (Theo) :speech_balloon:

## Whats coming soon ?

* Add more data compatibility (nutrition etc)
* Get aggregated data from HK
* Store data in HK
* Delete data in HK

## Built With

* Capacitor
* VSCode
* XCode

## Contributing

Theo Creach for Ad Scientiam

## Versioning

Version 0.0.5

## Authors

* **Theo Creach** - :star: *Developer* - [Twitter](https://twitter.com/crcht)

## License

This project is licensed under the MIT License



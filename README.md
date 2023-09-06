# @perfood/capacitor-healthkit v2

This is a complete re-write of the original plugin and still work in progress. v2 will have a complete new API and some new features. By far not everything has been implemented yet. You can test the most recent release of v2 by installing `@perfood/capacitor-healthkit@next`.

## Install

```bash
npm install @perfood/capacitor-healthkit@next
npx cap sync
```

## API

<docgen-index>

* [`requestAuthorization(...)`](#requestauthorization)
* [`isAvailable()`](#isavailable)
* [`getAuthorizationStatus(...)`](#getauthorizationstatus)
* [`getStatisticsCollection(...)`](#getstatisticscollection)
* [`getBodyMassEntries(...)`](#getbodymassentries)
* [`getWorkouts(...)`](#getworkouts)
* [Interfaces](#interfaces)
* [Type Aliases](#type-aliases)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### requestAuthorization(...)

```typescript
requestAuthorization(options: RequestAuthorizationOptions) => Promise<void>
```

| Param         | Type                                                                                |
| ------------- | ----------------------------------------------------------------------------------- |
| **`options`** | <code><a href="#requestauthorizationoptions">RequestAuthorizationOptions</a></code> |

--------------------


### isAvailable()

```typescript
isAvailable() => Promise<void>
```

--------------------


### getAuthorizationStatus(...)

```typescript
getAuthorizationStatus(options: GetAuthorizationStatusOptions) => Promise<{ status: AuthorizationStatus; }>
```

| Param         | Type                                                                                    |
| ------------- | --------------------------------------------------------------------------------------- |
| **`options`** | <code><a href="#getauthorizationstatusoptions">GetAuthorizationStatusOptions</a></code> |

**Returns:** <code>Promise&lt;{ status: <a href="#authorizationstatus">AuthorizationStatus</a>; }&gt;</code>

--------------------


### getStatisticsCollection(...)

```typescript
getStatisticsCollection(options: StatisticsCollectionOptions) => Promise<StatisticsCollectionOutput>
```

| Param         | Type                                                                                |
| ------------- | ----------------------------------------------------------------------------------- |
| **`options`** | <code><a href="#statisticscollectionoptions">StatisticsCollectionOptions</a></code> |

**Returns:** <code>Promise&lt;<a href="#statisticscollectionoutput">StatisticsCollectionOutput</a>&gt;</code>

--------------------


### getBodyMassEntries(...)

```typescript
getBodyMassEntries(options: BodyMassQueryOptions) => Promise<BodyMassQueryOutput>
```

| Param         | Type                                                                  |
| ------------- | --------------------------------------------------------------------- |
| **`options`** | <code><a href="#bodymassqueryoptions">BodyMassQueryOptions</a></code> |

**Returns:** <code>Promise&lt;<a href="#bodymassqueryoutput">BodyMassQueryOutput</a>&gt;</code>

--------------------


### getWorkouts(...)

```typescript
getWorkouts(options: WorkoutsQueryOptions) => Promise<WorkoutsQueryOutput>
```

| Param         | Type                                                                  |
| ------------- | --------------------------------------------------------------------- |
| **`options`** | <code><a href="#workoutsqueryoptions">WorkoutsQueryOptions</a></code> |

**Returns:** <code>Promise&lt;<a href="#workoutsqueryoutput">WorkoutsQueryOutput</a>&gt;</code>

--------------------


### Interfaces


#### RequestAuthorizationOptions

| Prop        | Type                  |
| ----------- | --------------------- |
| **`all`**   | <code>string[]</code> |
| **`read`**  | <code>string[]</code> |
| **`write`** | <code>string[]</code> |


#### GetAuthorizationStatusOptions

| Prop             | Type                |
| ---------------- | ------------------- |
| **`sampleType`** | <code>string</code> |


#### StatisticsCollectionOutput

| Prop       | Type                                                                                                                                      |
| ---------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| **`data`** | <code>{ date: <a href="#date">Date</a>; value: number; unit: string; uuid: string; sourceName: string; sourceBundleId: string; }[]</code> |


#### Date

Enables basic storage and retrieval of dates and times.

| Method                 | Signature                                                                                                    | Description                                                                                                                             |
| ---------------------- | ------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------- |
| **toString**           | () =&gt; string                                                                                              | Returns a string representation of a date. The format of the string depends on the locale.                                              |
| **toDateString**       | () =&gt; string                                                                                              | Returns a date as a string value.                                                                                                       |
| **toTimeString**       | () =&gt; string                                                                                              | Returns a time as a string value.                                                                                                       |
| **toLocaleString**     | () =&gt; string                                                                                              | Returns a value as a string value appropriate to the host environment's current locale.                                                 |
| **toLocaleDateString** | () =&gt; string                                                                                              | Returns a date as a string value appropriate to the host environment's current locale.                                                  |
| **toLocaleTimeString** | () =&gt; string                                                                                              | Returns a time as a string value appropriate to the host environment's current locale.                                                  |
| **valueOf**            | () =&gt; number                                                                                              | Returns the stored time value in milliseconds since midnight, January 1, 1970 UTC.                                                      |
| **getTime**            | () =&gt; number                                                                                              | Gets the time value in milliseconds.                                                                                                    |
| **getFullYear**        | () =&gt; number                                                                                              | Gets the year, using local time.                                                                                                        |
| **getUTCFullYear**     | () =&gt; number                                                                                              | Gets the year using Universal Coordinated Time (UTC).                                                                                   |
| **getMonth**           | () =&gt; number                                                                                              | Gets the month, using local time.                                                                                                       |
| **getUTCMonth**        | () =&gt; number                                                                                              | Gets the month of a <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                                             |
| **getDate**            | () =&gt; number                                                                                              | Gets the day-of-the-month, using local time.                                                                                            |
| **getUTCDate**         | () =&gt; number                                                                                              | Gets the day-of-the-month, using Universal Coordinated Time (UTC).                                                                      |
| **getDay**             | () =&gt; number                                                                                              | Gets the day of the week, using local time.                                                                                             |
| **getUTCDay**          | () =&gt; number                                                                                              | Gets the day of the week using Universal Coordinated Time (UTC).                                                                        |
| **getHours**           | () =&gt; number                                                                                              | Gets the hours in a date, using local time.                                                                                             |
| **getUTCHours**        | () =&gt; number                                                                                              | Gets the hours value in a <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                                       |
| **getMinutes**         | () =&gt; number                                                                                              | Gets the minutes of a <a href="#date">Date</a> object, using local time.                                                                |
| **getUTCMinutes**      | () =&gt; number                                                                                              | Gets the minutes of a <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                                           |
| **getSeconds**         | () =&gt; number                                                                                              | Gets the seconds of a <a href="#date">Date</a> object, using local time.                                                                |
| **getUTCSeconds**      | () =&gt; number                                                                                              | Gets the seconds of a <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                                           |
| **getMilliseconds**    | () =&gt; number                                                                                              | Gets the milliseconds of a <a href="#date">Date</a>, using local time.                                                                  |
| **getUTCMilliseconds** | () =&gt; number                                                                                              | Gets the milliseconds of a <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                                      |
| **getTimezoneOffset**  | () =&gt; number                                                                                              | Gets the difference in minutes between the time on the local computer and Universal Coordinated Time (UTC).                             |
| **setTime**            | (time: number) =&gt; number                                                                                  | Sets the date and time value in the <a href="#date">Date</a> object.                                                                    |
| **setMilliseconds**    | (ms: number) =&gt; number                                                                                    | Sets the milliseconds value in the <a href="#date">Date</a> object using local time.                                                    |
| **setUTCMilliseconds** | (ms: number) =&gt; number                                                                                    | Sets the milliseconds value in the <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                              |
| **setSeconds**         | (sec: number, ms?: number \| undefined) =&gt; number                                                         | Sets the seconds value in the <a href="#date">Date</a> object using local time.                                                         |
| **setUTCSeconds**      | (sec: number, ms?: number \| undefined) =&gt; number                                                         | Sets the seconds value in the <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                                   |
| **setMinutes**         | (min: number, sec?: number \| undefined, ms?: number \| undefined) =&gt; number                              | Sets the minutes value in the <a href="#date">Date</a> object using local time.                                                         |
| **setUTCMinutes**      | (min: number, sec?: number \| undefined, ms?: number \| undefined) =&gt; number                              | Sets the minutes value in the <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                                   |
| **setHours**           | (hours: number, min?: number \| undefined, sec?: number \| undefined, ms?: number \| undefined) =&gt; number | Sets the hour value in the <a href="#date">Date</a> object using local time.                                                            |
| **setUTCHours**        | (hours: number, min?: number \| undefined, sec?: number \| undefined, ms?: number \| undefined) =&gt; number | Sets the hours value in the <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                                     |
| **setDate**            | (date: number) =&gt; number                                                                                  | Sets the numeric day-of-the-month value of the <a href="#date">Date</a> object using local time.                                        |
| **setUTCDate**         | (date: number) =&gt; number                                                                                  | Sets the numeric day of the month in the <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                        |
| **setMonth**           | (month: number, date?: number \| undefined) =&gt; number                                                     | Sets the month value in the <a href="#date">Date</a> object using local time.                                                           |
| **setUTCMonth**        | (month: number, date?: number \| undefined) =&gt; number                                                     | Sets the month value in the <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                                     |
| **setFullYear**        | (year: number, month?: number \| undefined, date?: number \| undefined) =&gt; number                         | Sets the year of the <a href="#date">Date</a> object using local time.                                                                  |
| **setUTCFullYear**     | (year: number, month?: number \| undefined, date?: number \| undefined) =&gt; number                         | Sets the year value in the <a href="#date">Date</a> object using Universal Coordinated Time (UTC).                                      |
| **toUTCString**        | () =&gt; string                                                                                              | Returns a date converted to a string using Universal Coordinated Time (UTC).                                                            |
| **toISOString**        | () =&gt; string                                                                                              | Returns a date as a string value in ISO format.                                                                                         |
| **toJSON**             | (key?: any) =&gt; string                                                                                     | Used by the JSON.stringify method to enable the transformation of an object's data for JavaScript Object Notation (JSON) serialization. |


#### StatisticsCollectionOptions

| Prop                         | Type                                                                                            |
| ---------------------------- | ----------------------------------------------------------------------------------------------- |
| **`startDate`**              | <code>string</code>                                                                             |
| **`endDate`**                | <code>string</code>                                                                             |
| **`anchorDate`**             | <code>string</code>                                                                             |
| **`interval`**               | <code><a href="#statisticscollectionqueryinterval">StatisticsCollectionQueryInterval</a></code> |
| **`quantityTypeSampleName`** | <code><a href="#quantitytype">QuantityType</a></code>                                           |


#### StatisticsCollectionQueryInterval

| Prop        | Type                                                                      |
| ----------- | ------------------------------------------------------------------------- |
| **`unit`**  | <code>'second' \| 'minute' \| 'hour' \| 'day' \| 'month' \| 'year'</code> |
| **`value`** | <code>number</code>                                                       |


#### BodyMassQueryOutput

| Prop       | Type                                                                                                                    |
| ---------- | ----------------------------------------------------------------------------------------------------------------------- |
| **`data`** | <code>{ date: string; value: number; unit: string; uuid: string; sourceName: string; sourceBundleId: string; }[]</code> |


#### BodyMassQueryOptions

| Prop            | Type                |
| --------------- | ------------------- |
| **`startDate`** | <code>string</code> |
| **`endDate`**   | <code>string</code> |
| **`limit`**     | <code>number</code> |


#### WorkoutsQueryOutput

| Prop       | Type                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`data`** | <code>{ uuid: string; startDate: string; endDate: string; duration: number; device?: { name?: string \| null; model?: string \| null; manufacturer?: string \| null; hardwareVersion?: string \| null; softwareVersion?: string \| null; }; source: string; sourceBundleId: string; workoutActivityType: string; workoutActivityTypeId: number; totalEnergyBurned?: number; totalDistance?: number; totalFlightsClimbed?: number; totalSwimmingStrokeCount?: number; }[]</code> |


#### WorkoutsQueryOptions

| Prop            | Type                |
| --------------- | ------------------- |
| **`startDate`** | <code>string</code> |
| **`endDate`**   | <code>string</code> |
| **`limit`**     | <code>number</code> |


### Type Aliases


#### AuthorizationStatus

<code>'notDetermined' | 'sharingDenied' | 'sharingAuthorized'</code>


#### QuantityType

<code>'stepCount'</code>

</docgen-api>

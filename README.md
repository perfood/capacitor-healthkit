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

| Prop       | Type                                                                  |
| ---------- | --------------------------------------------------------------------- |
| **`data`** | <code>{ startDate: string; endDate: string; value: number; }[]</code> |


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

| Prop       | Type                                                                                                                                                                                                                                                                                                                                                                     |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **`data`** | <code>{ uuid: string; startDate: string; endDate: string; duration: number; device?: <a href="#healthkitdevice">HealthKitDevice</a>; source: string; sourceBundleId: string; workoutActivityType: string; workoutActivityTypeId: number; totalEnergyBurned?: number; totalDistance?: number; totalFlightsClimbed?: number; totalSwimmingStrokeCount?: number; }[]</code> |


#### HealthKitDevice

| Prop                      | Type                |
| ------------------------- | ------------------- |
| **`name`**                | <code>string</code> |
| **`model`**               | <code>string</code> |
| **`manufacturer`**        | <code>string</code> |
| **`hardwareVersion`**     | <code>string</code> |
| **`softwareVersion`**     | <code>string</code> |
| **`firmwareVersion`**     | <code>string</code> |
| **`localIdentifier`**     | <code>string</code> |
| **`udiDeviceIdentifier`** | <code>string</code> |


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

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
* [`getWorkouts()`](#getworkouts)
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
getStatisticsCollection(options: StatisticsCollectionOptions) => Promise<any>
```

| Param         | Type                                                                                |
| ------------- | ----------------------------------------------------------------------------------- |
| **`options`** | <code><a href="#statisticscollectionoptions">StatisticsCollectionOptions</a></code> |

**Returns:** <code>Promise&lt;any&gt;</code>

--------------------


### getWorkouts()

```typescript
getWorkouts() => Promise<any>
```

**Returns:** <code>Promise&lt;any&gt;</code>

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


### Type Aliases


#### AuthorizationStatus

<code>'notDetermined' | 'sharingDenied' | 'sharingAuthorized'</code>


#### QuantityType

<code>'stepCount'</code>

</docgen-api>

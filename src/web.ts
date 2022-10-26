/* eslint-disable @typescript-eslint/no-unused-vars */
import { WebPlugin } from '@capacitor/core';

import type {
  EditionQuery,
  AuthorizationQueryOptions,
  CapacitorHealthkitPlugin,
  MultipleQueryOptions,
  SingleQueryOptions,
} from './definitions';

export class CapacitorHealthkitWeb
  extends WebPlugin
  implements CapacitorHealthkitPlugin {
  async requestAuthorization(
    _authOptions: AuthorizationQueryOptions,
  ): Promise<void> {
    throw this.unimplemented('Not implemented on web.');
  }

  async queryHKitSampleType(_queryOptions: SingleQueryOptions): Promise<any> {
    throw this.unimplemented('Not implemented on web.');
  }

  async isAvailable(): Promise<void> {
    throw this.unimplemented('Not implemented on web.');
  }

  async multipleQueryHKitSampleType(
    _queryOptions: MultipleQueryOptions,
  ): Promise<any> {
    throw this.unimplemented('Not implemented on web.');
  }

  async isEditionAuthorized(_queryOptions: EditionQuery): Promise<void> {
    throw this.unimplemented('Not implemented on web.');
  }

  async multipleIsEditionAuthorized(): Promise<void> {
    throw this.unimplemented('Not implemented on web.');
  }
}

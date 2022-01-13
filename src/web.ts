import { WebPlugin } from '@capacitor/core';

import type { CapacitorHealthkitPlugin } from './definitions';

export class CapacitorHealthkitWeb
  extends WebPlugin
  implements CapacitorHealthkitPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }

  async requestAuthorization(a: any): Promise<void>{
    console.log(a)
    throw this.unimplemented('Not implemented on web.');
  }

  async queryHKitSampleType(a: any): Promise<any>{
    console.log(a)
    throw this.unimplemented('Not implemented on web.');
  }

  async isAvailable(): Promise<void>{
    throw this.unimplemented('Not implemented on web.');
  }

  async multipleQueryHKitSampleType(a: any): Promise<any>{
    console.log(a)
    throw this.unimplemented('Not implemented on web.');
  }

  async isEditionAuthorized(): Promise<void>{
    throw this.unimplemented('Not implemented on web.');
  }

  async multipleIsEditionAuthorized(): Promise<void>{ 
    throw this.unimplemented('Not implemented on web.');
  }
}

import { WebPlugin } from '@capacitor/core';
import { CapacitorHealthkitPlugin } from './definitions';

export class CapacitorHealthkitWeb extends WebPlugin implements CapacitorHealthkitPlugin {
  constructor() {
    super({
      name: 'CapacitorHealthkit',
      platforms: ['web']
    });
  }

  async requestAuthorization(): Promise<any> {
    throw new Error("Method not implemented.");
  }
  async isAvailable(): Promise<any> {
    throw new Error("Method not implemented.");
  }
  async queryHKitSampleType(): Promise<any> {
    throw new Error("Method not implemented.");
  }

  async multipleQueryHKitSampleType(): Promise<any> {
    throw new Error("Method not implemented.");
  }
  async isEditionAuthorized(): Promise<any> {
    throw new Error("Method not implemented.");
  }
  async multipleIsEditionAuthorized(): Promise<any> {
    throw new Error("Method not implemented.");
  }

  /* DEMO
  async echo(options: { value: string }): Promise<{value: string}> {
    console.log('ECHO', options);
    return options;
  }
  */
}

const CapacitorHealthkit = new CapacitorHealthkitWeb();

export { CapacitorHealthkit };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(CapacitorHealthkit);

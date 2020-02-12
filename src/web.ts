import { WebPlugin } from '@capacitor/core';
import { CapacitorHealthkitPlugin } from './definitions';

export class CapacitorHealthkitWeb extends WebPlugin implements CapacitorHealthkitPlugin {
  constructor() {
    super({
      name: 'CapacitorHealthkit',
      platforms: ['web']
    });
  }

  async echo(options: { value: string }): Promise<{value: string}> {
    console.log('ECHO', options);
    return options;
  }
}

const CapacitorHealthkit = new CapacitorHealthkitWeb();

export { CapacitorHealthkit };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(CapacitorHealthkit);

import { registerPlugin } from '@capacitor/core';

import type { CapacitorHealthkitPlugin } from './definitions';

const CapacitorHealthkit = registerPlugin<CapacitorHealthkitPlugin>(
  'CapacitorHealthkit',
  {
    web: () => import('./web').then(m => new m.CapacitorHealthkitWeb()),
  },
);

export * from './definitions';
export { CapacitorHealthkit };

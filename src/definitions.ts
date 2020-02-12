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
  /**
   * get Distance if available
   * @returns  {Promise}
   * @resolve any
   * @rejects PluginResultError
   */
  getDistance(): Promise<any>;
  /**
   * Displays the authentication screen
   * @returns  {Promise}
   * @resolve any
   * @rejects PluginResultError
   */
  authorize(): Promise<any>;
}
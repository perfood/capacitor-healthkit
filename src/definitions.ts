declare module "@capacitor/core" {
  interface PluginRegistry {
    CapacitorHealthkit: CapacitorHealthkitPlugin;
  }
}

export interface CapacitorHealthkitPlugin {
  echo(options: { value: string }): Promise<{value: string}>;
}

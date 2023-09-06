#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(CapacitorHealthkitPlugin, "CapacitorHealthkit",
           CAP_PLUGIN_METHOD(requestAuthorization, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(isAvailable, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getAuthorizationStatus, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getStatisticsCollection, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getBodyMassEntries, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getWorkouts, CAPPluginReturnPromise);
)

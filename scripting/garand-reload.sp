#include <sourcemod>
#include <sdktools>
#include <sdkhooks>

#include "garand-reload/sdk-call"

#include "modules/forward.sp"
#include "modules/sdk-hook.sp"
#include "modules/sdk-call.sp"

public Plugin myinfo = {
    name = "Garand reload",
    author = "Dron-elektron",
    description = "Allows you to reload the M1 Garand when the clip is not empty",
    version = "1.0.2",
    url = "https://github.com/dronelektron/garand-reload"
};

public void OnPluginStart() {
    Forward_Create();
    SdkCall_Create();
}

public void OnEntityCreated(int entity, const char[] className) {
    if (strcmp(className, "weapon_garand") == 0) {
        SdkHook_Reload(entity);
    }
}

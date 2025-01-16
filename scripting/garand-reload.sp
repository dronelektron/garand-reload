#include <sourcemod>
#include <sdktools>
#include <sdkhooks>

#include "garand-reload/sdk-call"

#include "modules/hook.sp"
#include "modules/sdk-call.sp"

public Plugin myinfo = {
    name = "Garand reload",
    author = "Dron-elektron",
    description = "Allows you to reload the M1 Garand even if the clip is not empty",
    version = "1.0.1",
    url = "https://github.com/dronelektron/garand-reload"
};

public void OnPluginStart() {
    SdkCall_Create();
}

public void OnEntityCreated(int entity, const char[] className) {
    if (strcmp(className, "weapon_garand") == 0) {
        Hook_Reload(entity);
    }
}

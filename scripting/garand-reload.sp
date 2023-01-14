#include <sourcemod>
#include <sdktools>
#include <sdkhooks>

#define GAME_CONFIG "garand-reload.games"
#define SNIPER_WEAPON_RELOAD "CDODSniperWeapon::Reload"

public Plugin myinfo = {
    name = "Garand reload",
    author = "Dron-elektron",
    description = "Allows you to reload the M1 Garand even if the clip is not empty",
    version = "0.1.0",
    url = "https://github.com/dronelektron/garand-reload"
};

static Handle g_sniperWeaponReload = null;

public void OnPluginStart() {
    SDKCall_Create();
}

public void OnPluginStop() {
    SDKCall_Destroy();
}

public void OnEntityCreated(int entity, const char[] className) {
    if (strcmp(className, "weapon_garand") == 0) {
        SDKHook(entity, SDKHook_Reload, Hook_GarandReload);
    }
}

public Action Hook_GarandReload(int weapon) {
    SDKCall(g_sniperWeaponReload, weapon);

    return Plugin_Handled;
}

void SDKCall_Create() {
    Handle gameConfig = LoadGameConfigFile(GAME_CONFIG);

    if (gameConfig != null) {
        g_sniperWeaponReload = PrepSDKCall_SniperWeaponReload(gameConfig);
    }

    delete gameConfig;
}

void SDKCall_Destroy() {
    delete g_sniperWeaponReload;
}

Handle PrepSDKCall_SniperWeaponReload(Handle gameConfig) {
    StartPrepSDKCall(SDKCall_Entity);
    PrepSDKCall_SetFromConf(gameConfig, SDKConf_Signature, SNIPER_WEAPON_RELOAD);
    PrepSDKCall_SetReturnInfo(SDKType_Bool, SDKPass_Plain);

    Handle call = EndPrepSDKCall();

    if (call == null) {
        SetFailState("Unable to prepare SDK call for '%s'", SNIPER_WEAPON_RELOAD);
    }

    return call;
}

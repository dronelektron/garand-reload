static Handle g_sniperWeaponReload = null;

void SdkCall_Create() {
    GameData gameData = new GameData(GAME_DATA);

    if (gameData == null) {
        SetFailState("Unable to open the '%s' game data", GAME_DATA);
    }

    SniperWeaponReload_Create(gameData);
    CloseHandle(gameData);
}

static void SniperWeaponReload_Create(GameData gameData) {
    StartPrepSDKCall(SDKCall_Entity);
    PrepSDKCall_SetFromConf(gameData, SDKConf_Signature, SIGNATURE_SNIPER_WEAPON_RELOAD);
    PrepSDKCall_SetReturnInfo(SDKType_Bool, SDKPass_Plain);

    g_sniperWeaponReload = EndPrepSDKCall();

    if (g_sniperWeaponReload == null) {
        SetFailState("Unable to prepare the '%s' SDK call", SIGNATURE_SNIPER_WEAPON_RELOAD);
    }
}

void SdkCall_SniperWeaponReload(int weapon) {
    int client = GetEntPropEnt(weapon, Prop_Send, "m_hOwnerEntity");

    if (Forward_OnGarandReload(client) < Plugin_Stop) {
        SDKCall(g_sniperWeaponReload, weapon);
    }
}

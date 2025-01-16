void Hook_Reload(int entity) {
    SDKHook(entity, SDKHook_Reload, Reload);
}

static Action Reload(int weapon) {
    SdkCall_SniperWeaponReload(weapon);

    return Plugin_Handled;
}

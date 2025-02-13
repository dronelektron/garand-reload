void SdkHook_Reload(int entity) {
    SDKHook(entity, SDKHook_Reload, OnReload);
}

static Action OnReload(int weapon) {
    SdkCall_SniperWeaponReload(weapon);

    return Plugin_Handled;
}

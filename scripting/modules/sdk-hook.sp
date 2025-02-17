void SdkHook_Reload(int entity) {
    SDKHook(entity, SDKHook_Reload, OnReload);
}

static Action OnReload(int weapon) {
    int clip = GetEntProp(weapon, Prop_Send, "m_iClip1");

    if (clip < GARAND_CLIP_MIN || clip == GARAND_CLIP_MAX) {
        return Plugin_Continue;
    }

    SdkCall_SniperWeaponReload(weapon);

    return Plugin_Handled;
}

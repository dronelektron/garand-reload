static GlobalForward g_onReload;

void Forward_Create() {
    g_onReload = new GlobalForward("Garand_OnReload", ET_Hook, Param_Cell);
}

Action Forward_OnGarandReload(int client) {
    Action result = Plugin_Continue;

    Call_StartForward(g_onReload);
    Call_PushCell(client);
    Call_Finish(result);

    return result;
}

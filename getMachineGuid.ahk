#Requires AutoHotkey v2.0.0+
;==============================================================
; getMachineGuid — Reads the system MachineGuid from the registry
;
; GitHub: https://github.com/SevenKeyboard/get-machine-guid
; Author: SevenKeyboard Ltd. (2026)
; License: The Unlicense
;==============================================================
class VersionManager_getMachineGuid
{
    static _ := this._init()
    static _init()    {
        global
        GETMACHINEGUID_VERSION := "1.0.1"
    }
}
getMachineGuid(default := "")    {
    prevIsCritical := critical()
    if (A_Is64bitOS)
        prevRegView := setRegView(64)
    machineGuid := regRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography", "MachineGuid", default)
    if (isSet(prevRegView))
        setRegView(prevRegView)
    critical(prevIsCritical)
    return machineGuid
}
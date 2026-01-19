#Requires AutoHotkey v1.1.08+
;==============================================================
; getMachineGuid — Reads the system MachineGuid from the registry
;
; GitHub: https://github.com/SevenKeyboard/get-machine-guid
; Author: SevenKeyboard Ltd. (2026)
; License: The Unlicense
;==============================================================
class VersionManager_getMachineGuid
{
    static _ := VersionManager_getMachineGuid._init()
    _init()    {
        global
        GETMACHINEGUID_VERSION := "1.0.0"
    }
}
getMachineGuid(default := "")    {
    local
    prevIsCritical := A_IsCritical
    critical % "On"
    if (A_Is64bitOS)    {
        prevRegView := A_RegView
        setRegView 64
    }
    regRead machineGuid, % "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography", % "MachineGuid"
    if (errorLevel)
        machineGuid := default
    if (isSet(prevRegView))
        setRegView % prevRegView
    critical % prevIsCritical
    return machineGuid
}
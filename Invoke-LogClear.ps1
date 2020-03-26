Add-Type -TypeDefinition @"
using System;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Security.Principal;

public static class Advapi32
{
	[DllImport("advapi32.dll", SetLastError=true, CharSet=CharSet.Unicode)]
	public static extern IntPtr OpenEventLogW(
		String lpUNCServerName,
		String lpSourceName);

	[DllImport("advapi32.dll", SetLastError=true, CharSet=CharSet.Unicode)]
	public static extern void ElfClearEventLogFileW(
		IntPtr LogHandle,
		String BackupFileName);

	[DllImport("advapi32.dll", SetLastError=true, CharSet=CharSet.Unicode)]
	public static extern void CloseEventLog(
		IntPtr LogHandle);

}

"@

$handle = [Advapi32]::OpenEventLogW("", "Application")
[Advapi32]::ElfClearEventLogFileW($handle, "")
[Advapi32]::CloseEventLog($handle)

$handle = [Advapi32]::OpenEventLogW("", "Windows PowerShell")
[Advapi32]::ElfClearEventLogFileW($handle, "")
[Advapi32]::CloseEventLog($handle)

$handle = [Advapi32]::OpenEventLogW("", "Security")
[Advapi32]::ElfClearEventLogFileW($handle, "")
[Advapi32]::CloseEventLog($handle)

$handle = [Advapi32]::OpenEventLogW("", "System")
[Advapi32]::ElfClearEventLogFileW($handle, "")
[Advapi32]::CloseEventLog($handle)

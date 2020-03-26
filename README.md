# Invoke-LogClear
PS1 script to clear Windows Event Log without wevtutil or Clear-EventLog

The simple way to clear Windows Event Logs is to use wevtutil or the Clear-EventLog powershell cmdlet. However, these commands may be logged and monitored.

Invoke-LogClear.ps1 loads advapi32.dll and uses the OpenEventLogW, ElfClearEventLogFileW and CloseEventLog function calls to clear the logs.


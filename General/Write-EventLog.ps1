param (
    [Parameter(Mandatory=$true)]
    [ValidateSet('Error', 'Warning', 'Information')]
    [string]$EntryType,

    [Parameter(Mandatory=$true)]
    [string]$Message
)




   $Scripts = "C:\Scripts"
   $gitLink = 
 

# Check if these files exists, if it does, remove it

if(Test-Path $Installer){
    Write-Output ".EXE FOUND, Continuing..."
    }

# Function to write to event log
function Write-EventLogMessage {
    param (
        [string]$LogName = 'Windows PowerShell',  # Added comma here
        [string]$Source = 'PowerShell',
        [int]$EventId = 9999,
        [string]$EntryType,
        [string]$Message
    )

    # Convert EntryType string to EventLogEntryType enum value
    $eventType = switch ($EntryType) {
        'Error' { [System.Diagnostics.EventLogEntryType]::Error }
        'Warning' { [System.Diagnostics.EventLogEntryType]::Warning }
        'Information' { [System.Diagnostics.EventLogEntryType]::Information }
    }

    # Prepare event log parameters
    $eventLogParams = @{
        LogName   = $LogName
        Source    = $Source
        EventId   = $EventId
        EntryType = $eventType
        Message   = $Message
    }

    # Write to the event log
    Write-EventLog @eventLogParams
}

# Call Write-EventLogMessage function with provided parameters
Write-EventLogMessage -EntryType $EntryType -Message $Message

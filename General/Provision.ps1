#This script will get all new and exisiting PC's ready for Automation
#Its going to change a lot, so feel free to add or change whatever
#feels necessary

$EventLog = "https://raw.githubusercontent.com/CriticalMSP/Scripts-Public/main/General/Write-EventLog.ps1"

#Simple check for what exists

if(Test-Path C:\Scripts){
Write-Output "Scripts folder already exists, continuing..."
}

else{
New-Item -ItemType Directory -Name "Scripts" -Path C:/
}

#The plan is to follow this schema for each script we want to install

Invoke-WebRequest -uri $EventLog -OutFile C:\Scripts\Write-EventLog.ps1
    Write-Output "Write-EventLog.ps1 installed."
   # Parameters for the event log script
    $EntryType = "Information"
    $Message = "Write-EventLog.ps1 installed"
    $EventLogScript = "C:\Scripts\Write-EventLog.ps1"
    & $EventLogScript -EntryType $EntryType -Message $Message   

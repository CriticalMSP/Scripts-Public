# Script to rename the folder
param (
       $folderPath = "C:\Users\$env:username\AppData\Roaming\Rubex"
    )

    # Check if the folder exists
    if (Test-Path $folderPath -PathType Container) {
        # Get the current folder name
        $folderName = (Get-Item $folderPath).Name
        
        # New folder name with .old appended
        $date = Get-Date -Format "-MM-dd-yyyy"
        $newFolderName = $folderName + $date + ".old" 
        
        # Rename the folder
        Rename-Item -Path $folderPath -NewName $newFolderName
        
        Write-Output "Folder renamed from '$folderName' to '$newFolderName'."
    } else {
        Write-Output "Folder '$folderPath' does not exist."
    }

#Connnect to Microsoft Teams
$connection = Connect-MicrosoftTeams


try
{
    #CSV File Path. Change this location accordingly
    $filePath = "C:\Users\Satya\Desktop\CreateBulkTeams.csv"

    #read the input file
    $loadFile = Import-Csv -Path $filePath
    
    
    foreach ($row in $loadFile)
    {
        $teamName = $row.'Team name'
        $teamDescription = $row.'Team description'
        $teamOwner = $row.Owner
        $teamVisibility = $row.Visibility

        #create the team with specified parameters
        $groupID = New-Team -DisplayName $teamName -Owner $teamOwner -Description $teamDescription -Visibility $teamVisibility
        Write-Host "Team " $teamName " created successfully..."
    }
    
    Write-Host $loadFile.Count " teams were created" -ForegroundColor Green -BackgroundColor Black
  
}

catch
{
      Write-Host "An error occurred:"
      Write-Host $_
}


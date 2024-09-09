# Absolute path to folder that needs to be scanned
$folderPath = "C:\NOLF1"

# Absolute path to CSV file that needs to get created or amended
$csvFile = "C:\DTXTransfer\DTX Table.csv"

# Python script path
$pythonScript = "C:\DTXTransfer\main.py"

# Search all .dtx files recursively
$dtxFiles = Get-ChildItem -Path $folderPath -Recurse -Filter *.dtx

# Execute Python command for each found .dtx file
foreach ($file in $dtxFiles) {
    $dtxFilePath = $file.FullName
    Write-Host "Processed file: $dtxFilePath"
    
    # Execute Python command with according parameters
    python $pythonScript -i $dtxFilePath -t $csvFile
}

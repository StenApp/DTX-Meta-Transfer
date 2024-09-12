# Define folders from and to
$inputDirectory = "C:\tex\"
$outputDirectory = "C:\tex1\"

# Path of the Python script
$pythonScript = "C:\DTXTransfer\main.py"

# Search all .DTX files recursively in from folder
Get-ChildItem -Path $inputDirectory -Recurse -Filter *.DTX | ForEach-Object {
    $inputFile = $_.FullName

    # Determine relative path of file in from folder
    $relativePath = $inputFile.Substring($inputDirectory.Length)

    # Build path of output file based on relative path
    $outputFile = Join-Path -Path $outputDirectory -ChildPath $relativePath

    # Create folder for output file, if non existent
    $outputFileDirectory = [System.IO.Path]::GetDirectoryName($outputFile)
    if (-Not (Test-Path -Path $outputFileDirectory)) {
        New-Item -ItemType Directory -Path $outputFileDirectory
    }

    # Assembly command for execution of Python script
    Write-Host "Proccessing file: $inputFile"
    & python $pythonScript --input $inputFile --output $outputFile
    Write-Host "File proccessed and saved: $outputFile"
}

# Set the directory path
$directoryPath = "C:\Users\Ben\source\repos"

# Get all .bim files recursively from the directory
$bimFiles = Get-ChildItem -Path $directoryPath -Recurse -Filter "*.bim"

# Path to TabularEditor.exe
$tabularEditorPath = "C:\TabularEditor\TabularEditor.exe"

# Loop through each .bim file
foreach ($file in $bimFiles) {
    # Print the name of the current file being processed comment/uncomment for debugging
    Write-Host "Processing file: $($file.FullName)"

    # Construct the full path of the file
    $filePath = $file.FullName

    #1st option: Construct the output file path (to use if you have properly named your bim files)
    #$outputFilePath = "C:\TabularEditor\bpa\" + $file.BaseName + ".txt"

    #2nd option:  Construct the output file path (to use if all bim files are named "Model.bim"
    $outputFilePath = "C:\TabularEditor\bpa\" + $parentFolderName + "_" + $file.BaseName + ".txt"

    # Execute TabularEditor command and output to file
    & $tabularEditorPath $filePath -A | Out-File -FilePath $outputFilePath
}

[Reflection.Assembly]::LoadWithPartialName("Microsoft.AnalysisServices")

# Variable for your SSAS server name
$SSASServerName = "DESKTOP-V8GHPU2\MSSQLSERVER2019"

# Connect to the SSAS server
$SSASServer = New-Object Microsoft.AnalysisServices.Server
$SSASServer.Connect($SSASServerName)


Set-Location -Path "C:\TabularEditor"
# Try to list the SSAS database Name
foreach($databses in $SSASServer.Databases ) {


$cube_name=$databses.ID
./TabularEditor.exe $SSASServerName  $cube_name -A | Out-File -FilePath C:\TabularEditor\bpa\${cube_name}.txt


}


#$cube_name= 'TAB_DWH_LEG'
#$Tab_path= 'C:\Program Files (x86)\Tabular Editor'
#$server_name='Tabular_DEV'
#Set-Location 'C:\TabularEditor'
#Invoke-ASCmd -Server "Tabular_dev" -Database:"Tab_DWH_LEG"  -Query:"SELECT * FROM DBSCHEMA_TABLES"
#./TabularEditor.exe TABULAR_DEV TAB_DWH_LEG -A | Out-File -FilePath C:\TabularEditor\${cube_name}.txt
$scriptPath = Split-Path $script:MyInvocation.MyCommand.Path
 
Write-Host "Current script directory is $scriptPath" -ForegroundColor Yellow

$pubFolderToDelete = $scriptPath + "\pub"
remove-item -path $pubFolderToDelete -Force -Recurse -ErrorAction SilentlyContinue

# *** Web image ***
$webPathToJson = $scriptPath + "\src\Restlessminds.web\project.json"
Write-Host "webPathToJson is $webPathToJson" -ForegroundColor Yellow
$webPathToPub = $scriptPath + "\pub\web"
Write-Host "webPathToPub is $webPathToPub" -ForegroundColor Yellow

Write-Host "Restore Dependencies just in case as it is needed to run dotnet publish" -ForegroundColor Blue
dotnet restore $webPathToJson
dotnet build $webPathToJson
dotnet publish $webPathToJson -o $webPathToPub

# *** service A image ***
$svcAPathToJson = $scriptPath + "\src\Restlessminds.ServiceA\project.json"
Write-Host "svcAPathToJson is $svcAPathToJson" -ForegroundColor Yellow
$svcAPathToPub = $scriptPath + "\pub\serviceA"
Write-Host "svcAPathToPub is $svcAPathToPub" -ForegroundColor Yellow

Write-Host "Restore Dependencies just in case as it is needed to run dotnet publish" -ForegroundColor Blue
dotnet restore $svcAPathToJson
dotnet build $svcAPathToJson
dotnet publish $svcAPathToJson -o $svcAPathToPub


#*** service B image ***
$svcBPathToJson = $scriptPath + "\src\Restlessminds.serviceB\project.json"
Write-Host "svcBPathToJson is $svcBPathToJson" -ForegroundColor Yellow
$svcBPathToPub = $scriptPath + "\pub\serviceB"
Write-Host "svcBPathToPub is $svcBPathToPub" -ForegroundColor Yellow

Write-Host "Restore Dependencies just in case as it is needed to run dotnet publish" -ForegroundColor Blue
dotnet restore $svcBPathToJson
dotnet build $svcBPathToJson
dotnet publish $svcBPathToJson -o $svcBPathToPub

#*** build docker images ***
docker build -t restless/web $webPathToPub
docker build -t restless/servicea $svcAPathToPub
docker build -t restless/serviceb $svcBPathToPub

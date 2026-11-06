$ErrorActionPreference = 'Stop'
$url = 'http://localhost:52678/__stop'
try {
    Invoke-WebRequest -Uri $url -Method Post -TimeoutSec 3 -UseBasicParsing | Out-Null
    Write-Host 'Git guide preview server stopped.'
} catch {
    Write-Host 'The Git guide preview server is not running.'
}

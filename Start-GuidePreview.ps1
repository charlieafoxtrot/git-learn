$ErrorActionPreference = 'Stop'

$port = 52678
$url = "http://localhost:$port/"
$serverScript = Join-Path $PSScriptRoot 'preview-server.cjs'
$guideFile = Join-Path $PSScriptRoot 'github-development-workflow-howto.html'

if (-not (Test-Path -LiteralPath $guideFile)) {
    throw "Guide file not found: $guideFile"
}

try {
    $existing = Invoke-WebRequest -Uri $url -TimeoutSec 2 -UseBasicParsing
    if ($existing.StatusCode -ne 200 -or $existing.Content -notmatch 'GitHub Development Workflow') {
        throw "Port $port is already serving a different page."
    }
} catch {
    if ($_.Exception.Message -like "Port $port is already serving a different page.*") { throw }
    $node = (Get-Command node -ErrorAction Stop).Source
    $arguments = '"{0}" "{1}" {2}' -f $serverScript, $PSScriptRoot, $port
    Start-Process -FilePath $node -ArgumentList $arguments -WindowStyle Hidden

    $ready = $false
    for ($attempt = 0; $attempt -lt 25; $attempt++) {
        Start-Sleep -Milliseconds 200
        try {
            $response = Invoke-WebRequest -Uri $url -TimeoutSec 2 -UseBasicParsing
            if ($response.StatusCode -eq 200 -and $response.Content -match 'GitHub Development Workflow') {
                $ready = $true
                break
            }
        } catch { }
    }
    if (-not $ready) { throw 'The preview server did not start. Check that Node.js is installed.' }
}

Start-Process $url
Write-Host "Guide preview opened at $url"
Write-Host 'The server stays available in the background until you stop it or Windows shuts down.'

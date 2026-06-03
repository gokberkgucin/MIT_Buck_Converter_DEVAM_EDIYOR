param(
    [int]$StartPage = 0,
    [int]$Count = 2,
    [string]$DocxPath = "tracking/defter_sira_ana_fotolu.docx",
    [string]$OutputDir = "images/defter_full_pages",
    [string]$StatePath = "tracking/defter_auto_state.json"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Get-State {
    param([string]$Path)

    if (Test-Path -LiteralPath $Path) {
        return Get-Content -LiteralPath $Path -Raw | ConvertFrom-Json
    }

    return [pscustomobject]@{
        next_page = 1
        last_prepared_pages = $null
        last_commit = $null
        updated_at = $null
        note = "Auto-created by tools/prepare_defter_pass.ps1"
    }
}

function Write-State {
    param(
        [string]$Path,
        [object]$State
    )

    $State | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $Path -Encoding UTF8
}

if (-not (Test-Path -LiteralPath $DocxPath)) {
    throw "DOCX not found: $DocxPath"
}

if (-not (Test-Path -LiteralPath $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir | Out-Null
}

$state = Get-State -Path $StatePath
if ($StartPage -le 0) {
    $StartPage = [int]$state.next_page
}

if ($StartPage -le 0) {
    throw "StartPage must be positive."
}

if ($Count -le 0) {
    throw "Count must be positive."
}

Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$resolvedDocx = Resolve-Path -LiteralPath $DocxPath
$resolvedOutput = Resolve-Path -LiteralPath $OutputDir
$stream = [System.IO.File]::Open(
    $resolvedDocx,
    [System.IO.FileMode]::Open,
    [System.IO.FileAccess]::Read,
    [System.IO.FileShare]::ReadWrite
)
$zip = [System.IO.Compression.ZipArchive]::new(
    $stream,
    [System.IO.Compression.ZipArchiveMode]::Read
)

try {
    $prepared = @()

    foreach ($page in $StartPage..($StartPage + $Count - 1)) {
        $entryPrefix = "word/media/image$page."
        $entry = $zip.Entries | Where-Object { $_.FullName.StartsWith($entryPrefix) } | Select-Object -First 1

        if (-not $entry) {
            throw "Missing DOCX media entry for page/image $page"
        }

        $targetName = "defter_p{0:D3}.jpg" -f $page
        $target = Join-Path $resolvedOutput $targetName
        [IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $target, $true)

        $file = Get-Item -LiteralPath $target
        $prepared += [pscustomobject]@{
            page = $page
            media_entry = $entry.FullName
            output = $file.FullName
            length = $file.Length
        }
    }

    $state.next_page = $StartPage + $Count
    $state.last_prepared_pages = "{0}-{1}" -f $StartPage, ($StartPage + $Count - 1)
    $state.updated_at = (Get-Date).ToString("s")
    Write-State -Path $StatePath -State $state

    $prepared | Format-Table -AutoSize | Out-String
    "Next page: $($state.next_page)"
}
finally {
    $zip.Dispose()
    $stream.Dispose()
}

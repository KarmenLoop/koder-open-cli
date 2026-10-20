param([string]$DownloadBase = '', [string]$AcceptTermsDigest = '', [string]$InstallRoot = '', [string]$BinDirectory = '')
$ErrorActionPreference = 'Stop'
function Get-PayloadDigest([string]$file) {
  $stream = [IO.File]::OpenRead($file); $algorithm = [Security.Cryptography.SHA256]::Create()
  try { return ([BitConverter]::ToString($algorithm.ComputeHash($stream))).Replace('-','').ToLowerInvariant() }
  finally { $stream.Dispose(); $algorithm.Dispose() }
}
if ($env:OS -ne 'Windows_NT' -or ![Environment]::Is64BitOperatingSystem -or $env:PROCESSOR_ARCHITECTURE -ne 'AMD64') { throw 'PLATFORM_UNSUPPORTED: use Windows x64.' }
$version = '0.2.0-dev.6'
$name = "koder-open-$version-win32-x64"
if (!$DownloadBase) { $DownloadBase = "https://github.com/KarmenLoop/koder-open-cli/releases/download/v$version" }
$origin = [Uri]$DownloadBase
if (!$origin.IsAbsoluteUri -or $origin.UserInfo -or $origin.Query -or $origin.Fragment -or ($origin.Scheme -ne 'https' -and !($origin.Scheme -eq 'http' -and $origin.Host -in @('127.0.0.1','localhost')))) { throw 'DOWNLOAD_BASE_INVALID' }
$temporary = Join-Path ([IO.Path]::GetTempPath()) ('koder-open-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $temporary | Out-Null
try {
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  $base = $DownloadBase.TrimEnd('/')
  $checksum = Join-Path $temporary 'checksum'; $archive = Join-Path $temporary 'package.zip'
  Invoke-WebRequest -UseBasicParsing -Uri "$base/$name.sha256" -OutFile $checksum -TimeoutSec 120
  $index = [IO.File]::ReadAllText($checksum)
  if ($index -notmatch ('\A([a-f0-9]{64})  ' + [regex]::Escape("$name.zip") + '\r?\n?\z')) { throw 'CHECKSUM_INDEX_INVALID' }
  $expected = $Matches[1]
  Invoke-WebRequest -UseBasicParsing -Uri "$base/$name.zip" -OutFile $archive -TimeoutSec 180
  if ((Get-Item -LiteralPath $archive).Length -gt 134217728 -or (Get-PayloadDigest $archive) -ne $expected) { throw 'CHECKSUM_FAILED' }
  Add-Type -AssemblyName System.IO.Compression.FileSystem
  $zip = [IO.Compression.ZipFile]::OpenRead($archive)
  try {
    $allowed = @('bin/koder-open.exe','install.ps1','uninstall.ps1','README.md','LICENSE.txt','NODE_LICENSE.txt','BUILD.json','SHA256SUMS')
    $seen = @{}; $total = 0
    foreach ($entry in $zip.Entries) {
      $file = $entry.FullName.Replace('\','/')
      if ($file -eq "$name/" -or $file -eq "$name/bin/") { continue }
      if (!$file.StartsWith("$name/", [StringComparison]::Ordinal)) { throw 'ARCHIVE_INVALID' }
      $relative = $file.Substring($name.Length+1)
      if ($allowed -cnotcontains $relative -or $seen.ContainsKey($relative) -or (($entry.ExternalAttributes -shr 16) -band 0xF000) -eq 0xA000) { throw 'ARCHIVE_INVALID' }
      $seen[$relative] = $true; $total += $entry.Length
      if ($total -gt 268435456) { throw 'ARCHIVE_TOO_LARGE' }
    }
    if ($seen.Count -ne 8) { throw 'ARCHIVE_INVALID' }
  } finally { $zip.Dispose() }
  [IO.Compression.ZipFile]::ExtractToDirectory($archive, $temporary)
  & (Join-Path $temporary "$name/install.ps1") -AcceptTermsDigest $AcceptTermsDigest -InstallRoot $InstallRoot -BinDirectory $BinDirectory
} finally {
  if (Test-Path -LiteralPath $temporary) { Remove-Item -Recurse -Force -LiteralPath $temporary }
}

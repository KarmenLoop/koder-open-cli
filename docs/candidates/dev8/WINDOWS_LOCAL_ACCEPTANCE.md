# Local Windows DeepSeek acceptance

The owner currently has no physical Windows machine. No physical result or real Windows DeepSeek call is claimed. Native Windows CI and dev.7 real activation remain separate recorded evidence. The local-only script is prepared for a Windows x64 machine when one becomes available; it refuses hosted GitHub Actions execution and never uploads a report or model credential.

## Prepare the machine

Download, verify and install the published package as described in the [handbook](https://karmenloop.github.io/koder-open-cli/handbook/). Dev.7 is the current operational version. Dev.8 is a candidate awaiting signing and release-specific activation; do not mix versions. Locate the actual installed executable under the managed version directory. Use normal PowerShell, without administrator privileges or a machine-wide policy change.

The publisher acceptance checkout must include `scripts/accept-windows-local.ps1`, `WindowsTerminal.cs` and `WindowsConsoleChild.cs` from the same reviewed revision. These files are test tools, not a replacement runtime. Keep the actual installed executable as the command being tested.

In that same PowerShell window, read the key with masked input and place it only in the process environment:

```powershell
$secret = Read-Host 'DeepSeek Key for this window only' -AsSecureString
$pointer = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secret)
try {
  $env:KODER_DEEPSEEK_API_KEY = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($pointer)
} finally {
  [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($pointer)
  $secret.Dispose()
}
```

Do not use a chat message, a GitHub Secret, a workflow input, a role/skill document or a command-line key argument for this test. Do not enable a shell transcript while handling credentials. The script does not save the key or add it to a receipt.

## Run the bounded acceptance

Use your actual installed path and version:

```powershell
$version = '0.2.0-dev.7'
$installed = Join-Path $env:LOCALAPPDATA "KarmenLoop\koder-open\versions\$version\bin\koder-open.exe"
try {
  & .\scripts\accept-windows-local.ps1 -InstalledCommand $installed -ExpectedVersion $version -PhysicalDevice
} finally {
  Remove-Item Env:KODER_DEEPSEEK_API_KEY -ErrorAction SilentlyContinue
}
```

Supply `-PhysicalDevice` only when the operator has confirmed the machine is physical. The report labels this as `operatorDeclaredPhysical`; it is not an independent hardware attestation. Virtual Windows can verify real Windows provider behavior, but does not close the physical-device gate.

The script creates a new isolated profile, displays all four legal documents, waits for explicit acceptance, configures a synthetic writing role, imports and enables one synthetic manual, wakes the correct issuer and starts the real product device login. Approve only that code as the intended GitHub account. Signed renewal must preserve receipt identity and its fixed deadline.

After separate sharing confirmation, it makes exactly two synthetic DeepSeek requests: one through the installed CLI and one through a native ConPTY session running the installed TUI. Both use `thinking: disabled` and at most 256 output tokens. It requires complete checked responses, a source phrase, the enabled synthetic skill and normal TUI exit. There is no automatic retry or alternate endpoint. A failed attempt remains a failure for review; do not relabel a timeout as success.

The local report excludes GitHub IDs, install IDs, signed claims, keys and serial numbers. Synthetic response text and the TUI transcript are redacted before writing. Review the report before sharing it. The script preserves its owned test profile and evidence; the existing customer profile remains separate.

## Complete the physical acceptance record

Record the package checksum, source version, Windows version, manufacturer/model and the operator-confirmed hardware classification. Manually open the same installed command in normal PowerShell and CMD, reopen the saved role and skill, confirm the local backend URL works while the process is running, then close it and confirm data persists. Inspect the executable’s Authenticode signature separately using [system signing](SYSTEM_SIGNING.md).

Actual model use, operator device evidence, operating-system trust and independent QA each need their own result. A script’s parsed syntax, CI success, package creation or `operatorDeclaredPhysical` flag alone does not close all four.

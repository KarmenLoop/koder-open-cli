# Publisher signing and notarization

Dev.8 adds a certificate-aware build path. It has not yet produced a publisher-signed release. The current Mac has zero valid code-signing identities. The owner has an existing certificate or signing account and will provide its public reference. No purchase, certificate export or secret upload is authorized or required by these scripts. The issuer’s Ed25519 license signature and operating-system code signatures serve separate purposes.

## Mac Developer ID

Use the existing Node 22.23.2, TypeScript 6.0.3 and postject toolchain. Make the company’s Developer ID Application identity available through its normal local Keychain or approved signing provider. Provide its public name or SHA-1 identity selector and ten-character Team ID. Do not place private keys in this repository.

```sh
security find-identity -v -p codesigning
export KODER_SIGNING=publisher
export KODER_MAC_SIGN_IDENTITY='Developer ID Application: YOUR COMPANY (TEAMIDHERE)'
export KODER_MAC_TEAM_ID='TEAMIDHERE'
node scripts/build-preview.mjs
```

Replace the placeholders with the actual public identifiers. The build refuses missing identities and verifies the resulting Developer ID authority, Team ID, hardened runtime, secure timestamp and strict signature. The Node runtime has a JIT entitlement in the supplied minimal plist. The remaining entitlements and runtime behavior still require real certificate testing; broader exceptions are not added automatically. A valid signing command alone does not mark the package verified. A publisher build failing verification stops instead of falling back to ad-hoc signing.

After a valid Developer ID build, use an existing, locally configured notarytool Keychain profile:

```sh
node scripts/notarize-preview.mjs --stage /absolute/path/from/BUILD-RECEIPT.private.json --profile CompanyNotary
```

The script checks every staged checksum and signer identity, submits a ZIP of the signed executable, waits up to 15 minutes and records Apple’s actual status. It then performs a Gatekeeper assessment. The private receipt separates `notarized` from `gatekeeperPassed`; either can remain false. A standalone CLI does not become an application bundle, and the script does not claim an offline stapled ticket. Test the final downloaded artifact under normal Gatekeeper settings. Do not change or re-sign binaries after notarization without submitting and validating the changed artifact again.

## Windows Authenticode

Use an existing company code-signing certificate in CurrentUser/My with a private-key provider, valid dates and the Code Signing EKU. The Windows SDK SignTool must already be installed. No PFX or password is passed to the build. Provide only the public certificate thumbprint and optional installed SignTool path:

```powershell
$env:KODER_SIGNING = 'publisher'
$env:KODER_WINDOWS_CERT_THUMBPRINT = 'REPLACE_WITH_ACTUAL_40_HEX_THUMBPRINT'
$env:KODER_SIGNTOOL = 'C:\Program Files (x86)\Windows Kits\10\bin\SDK_VERSION\x64\signtool.exe'
node scripts/build-preview.mjs
```

The SHA-1 thumbprint selects the certificate; the file and timestamp digest algorithms are SHA-256. Signing uses an RFC 3161 timestamp, followed by SignTool’s Authenticode policy verification and `Get-AuthenticodeSignature`. The certificate thumbprint, valid trust result and timestamp must match before the build records `publisherSigned: true`. Cloud signing providers need their documented local provider integration; the provider has not yet been identified, so no vendor-specific credential workflow is inferred.

```powershell
Get-AuthenticodeSignature -LiteralPath 'C:\actual\installed\koder-open.exe' |
  Select-Object Status,StatusMessage,SignerCertificate,TimeStamperCertificate
```

A trusted signature does not establish SmartScreen reputation or physical-machine acceptance. Verify the installed executable, normal PowerShell/CMD startup, local persistence and actual model requests separately. Signing changes file bytes: create new checksums and native archives before publication, then repeat installation and runtime checks. Do not replace published dev.7 binaries with signed dev.8 files under the old version.

## Current state and sources

Preview builds remain explicitly labeled ad-hoc/not notarized on Mac and not publisher-signed on Windows. Signing policy tests are fixture evidence, not certificate or notarization acceptance. Current platform results are in [validation](VALIDATION.md).

Primary references checked October 21, 2026: [Apple notarization](https://developer.apple.com/documentation/security/notarizing-macos-software-before-distribution), [Apple distribution signing](https://developer.apple.com/documentation/xcode/creating-distribution-signed-code-for-the-mac/), [Node 22 SEA](https://nodejs.org/download/release/latest-jod/docs/api/single-executable-applications.html), [Node 22.23.2 entitlements](https://github.com/nodejs/node/blob/v22.23.2/tools/osx-entitlements.plist), [Microsoft SignTool](https://learn.microsoft.com/en-us/windows/win32/seccrypto/signtool) and [Authenticode timestamps](https://learn.microsoft.com/en-us/windows/win32/seccrypto/time-stamping-authenticode-signatures).

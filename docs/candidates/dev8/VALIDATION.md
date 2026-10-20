# Development candidate validation: 0.2.0-dev.8

Dev.8 improves task-specific learning and local review. Changed tasks and evidence invalidate task-specific notes; general review-card progress is retained. The next-step flow prioritizes owner review, failure remediation and the oldest due review, then pre-study and rehearsal. Accepted current preparation reports ready. CLI and TUI can preview approved context without a model call; doctor reports local readiness without printing credentials or making a network request.

| Area | Actual result | Boundary |
| --- | --- | --- |
| Source | 128 passed / 0 failed on Mac and Windows | Automated self-checks |
| Mac Apple Silicon | 18 native installation/runtime/distribution checks passed | Ad-hoc signature, no notarization |
| Mac TUI | Native learning recommendation, readable preview, sharing decline and normal exit; managed installed startup/reopen/exit passed | No dev.8 real model request |
| Browser | Real local preview displayed; unapproved sharing blocked; no quota or attempts; long text fits width | Synthetic profile, not independent QA |
| Windows x64 | 8 installer checks, 14 download/local-use checks, native ConPTY Chinese save/reopen/exit | Windows Server 2022 CI, no physical device |
| Windows operator tools | PowerShell syntax and hosted-run rejection passed on Windows | Local real-model script prepared, not executed |
| Publisher signing | Missing-reference/failed-verification policies and ad-hoc notarization refusal tested | No company certificate or notarization acceptance |
| Operational issuer | Installed dev.7 wake passed App/key/terms/version verification | One earlier 65-second health connection timed out; no uptime guarantee |

[Windows run](https://github.com/KarmenLoop/koder-open-cli-source/actions/runs/39480868688) completed successfully at source `f89ad4a4199490746f5b7314fb9f65c8b4fbe70b`. The Mac runtime build source is `f0630933f46d925fbd78fe367fdee63dee25bce4`; all runtime modules and resources match the later Windows source. The later changes affect Windows installation and test scripts. Mac archive SHA-256: `0cadeebf8ac452349888c99fa8ef5e57850e52c5908026cec401ee9e6e80d651`. Windows SHA-256: `16270a0eb66f454e1068624ab129ff9121654264c49fcd73c8691f61ff6a35da`. The source and deployed public package remain separate: dev.8 is a draft candidate; published dev.7 and its matching issuer remain available.

## Pending device and certificate work

The owner confirmed no physical Windows machine is currently available. Real Windows DeepSeek and physical acceptance remain NOT RUN. The local-only script uses a process environment credential, creates isolated synthetic data, requires actual device activation and renewal, and plans exactly two capped requests. It refuses hosted Actions and uploads nothing. [Local Windows acceptance](WINDOWS_LOCAL_ACCEPTANCE.md).

The owner has an existing signing certificate or provider and will supply its public reference. The current Mac reports zero valid signing identities. The publisher build path requires an actual certificate reference, verified identity, SHA-256/RFC 3161 timestamp on Windows, or Developer ID/hardened runtime/timestamp on Mac. Notarization and Gatekeeper results are separate. Prepared commands and policy fixtures are not native signing evidence. [System signing](SYSTEM_SIGNING.md).

A matching dev.8 issuer, real dev.8 signed activation and release-specific provider checks are required before operational publication. No dev.7 live result is promoted into a dev.8 claim. [Dev.7 historical validation](validation-history/dev7.md). No model key was uploaded to GitHub or saved to source.

## Preserved failures

The first Windows installed-version test still expected dev.7 and failed. A separate real CMD warning revealed the launcher saved the word `code` instead of the numeric codepage. The corrected installer now restores a non-UTF8 console and preserves failing command exit codes. The first new regression harness encoded a Chinese path directly into a batch running under codepage 437; its path reference was corrected without relaxing assertions. Both failed workflows and canceled superseded runs remain in private evidence.

Mac handbook generation required an explicit UTF-8 source declaration. The first build used TypeScript 5.9.3 and was superseded by the pinned 6.0.3 build; later final builds include the reviewed guide and preview interface. No superseded artifact is presented as the final candidate. Earlier dev.5 failures remain in history.

Physical Windows, real Windows model calls, publisher signing, notarization, Gatekeeper/SmartScreen acceptance, independent QA, production retention/deletion and incident operations remain open. External tools, connected channels and unattended learning are not implemented. The 32-chapter candidate handbook and 23 editable examples are updated; current operational downloaders remain dev.7.

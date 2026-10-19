# Koder Open CLI — Development Plan

October 19, 2026 · English edition · Proprietary development

This plan retains the full product scope: 20 requirements, 20 domains, 18 channels, and eleven connector categories. Read [the product specification](PRODUCT_SPEC.md) for behavior and defaults. Public materials describe the plan; implementation remains private.

## Current milestone

The local development preview has a configuration compiler and schema, versioned file persistence, conflict checks, reset/rollback, independent CLI entry, a local Role Studio, 20 editable domain seeds, an 18-channel catalog, and a bundled disabled behavior skill. It does not yet have integrated live task execution, connected channels, running behavior analysis, completed professional domain evaluations, installers, or independent product QA. Existing tests establish only their tested local boundaries.

## Engineering principles

Use existing Koder hosts for identity, tasks, execution authority, memory, skills, and scheduling. Work against fixed input versions and isolated write sets. Never publish private kernel code, credentials, customer data, profile content, or runtime queues. Keep configuration, source review, local tests, live runtime, device/account evidence, independent acceptance, and publication as separate states.

For each task, write observable positive and negative behavior checks, verify the gap, implement the smallest coherent change, run relevant regressions, and record the exact version, command/tool, exit code or terminal result, artifacts, remaining dependencies, and recovery path. Missing imports are wiring failures, not business-behavior failures. Do not erase historical failures or repeat unrelated checks without new cause.

## Milestones

| Phase | Tasks | Exit condition |
| --- | --- | --- |
| A: Foundations | T01–T05 | Fixed host contracts, valid defaults, versioned configuration, access scope, and safe packs |
| B: Business execution | T06–T08 | Sourced knowledge, approved real actions, durable workflows, and verified delivery |
| C: Memory and adaptation | T09–T11 | Shared memory, consent, evidence-based analysis, controlled tuning, and rollback |
| D: Full product coverage | T12–T17 | Simple setup, website/API, all channels, connectors, and professional domain packs |
| E: Delivery | T18–T20 | Three-OS deployment/recovery, independent QA, and an accurate release candidate |

No unsupported full-product date is assigned. Estimate task packages after host dependencies, accounts, staffing, and reviewers are fixed. Work may proceed independently when authorized inputs and write sets do not conflict.

## Work packages

### T01. Baseline and trusted host interfaces

**Dependencies:** None.

**Deliverable:** Contracts and host adapter boundary; fixed source manifests.

**Verification:** Map actual identity, task, tool, memory, automation, skill, and model capabilities. Test untrusted scopes, missing capability, approval/deny, synthetic receipts, cancellation, and authorized positive calls.

**Exit condition:** Reviewed interfaces and known gaps; no duplicate Core or authority.

### T02. Schema and complete defaults

**Dependencies:** T01.

**Deliverable:** Role, workflow, and pack schemas plus versioned defaults.

**Verification:** Validate every field, unknown keys, namespaced extensions, null/deletion semantics, unsafe objects, size/depth limits, and workflow node budgets. Ensure configuration and synthetic checks work with no model.

**Exit condition:** One canonical default set and predictable field-level errors.

### T03. Layering, provenance, versions, and rollback

**Dependencies:** T02.

**Deliverable:** Configuration compiler, patch/diff, locks, persistence, reset, and release snapshots.

**Verification:** Test object layering, ID-list edits, confirmed preferences, task overrides, locked fields, capability intersection, concurrent commits, write failure, corrupt state, and rollback without restored grants.

**Exit condition:** One immutable snapshot contract used by all editing surfaces.

### T04. Identity, spaces, role bindings, and access

**Dependencies:** T01, T03.

**Deliverable:** Trusted subject/space resolution and action scope.

**Verification:** Test tenant and visitor isolation, managers versus participants, multiple installations, revocation, stale identity, explicit approval/rejection, and positive delivery in approved scope.

**Exit condition:** Production identity integration reviewed by its original owner.

### T05. Role packs and replaceable skill resources

**Dependencies:** T03, T04.

**Deliverable:** Pack validation, import/export, manifests, and skill lifecycle.

**Verification:** Check traversal, symlinks, digest mismatch, oversized files, compatibility, extension declarations, permission differences, and secret-free exports. Reading guidance never executes code.

**Exit condition:** Safe pack round trip; real enable/disable/replace consumption through the host.

### T06. Sourced business knowledge

**Dependencies:** T04, T05.

**Deliverable:** Source registration, indexing, retrieval, visibility, and revocation.

**Verification:** Test versions, expiry, conflicting evidence, missing facts, cross-space requests, source deletion, untrusted instructions in documents, and bounded retrieval.

**Exit condition:** A representative sourced answer with accurate references and revocation behavior.

### T07. Real role task execution

**Dependencies:** T01, T03, T04.

**Deliverable:** Role context projection and existing task/tool invocation.

**Verification:** Verify the same task through authority, actual tool action, persistent receipt/artifact, result check, and model continuation. Test model capability gaps, budgets, revocation, cancellation, and unknown outcomes.

**Exit condition:** One complete live role task before expanding execution coverage.

### T08. Business workflows, waits, and handoff

**Dependencies:** T07.

**Deliverable:** All eleven node types, typed edges, persistent wait/resume, and compensation.

**Verification:** Test branches, concurrency conflicts, cycles, node/total budgets, approval/rejection/timeout, urgency-based follow-up, duplicate wakes, handoff, cancellation, and failed compensation.

**Exit condition:** Quote approval, booking confirmation, and procurement follow-up using durable original tasks.

### T09. Shared memory and cross-device continuity

**Dependencies:** T04, T07; fixed memory host handoff.

**Deliverable:** Reviewed memory adapter, preference projection, retention, and deletion lifecycle.

**Verification:** Test verified subjects, approved sharing, guest isolation, concurrent append, ACK cursors, interrupted sync, deletion tombstones, old devices, account changes, and recovery without copied authority.

**Exit condition:** Distinct-device and at least two real-channel continuity, with group policy verified separately.

### T10. Behavior skill, consent, preferences, and reports

**Dependencies:** T05, T09.

**Deliverable:** Independent personal/business policy, evidence events, analysis, proposals, and metrics.

**Verification:** Test off/suggest/adapt, explicit preference versus three independent signals, temporary requests, quoted/other speakers, replay, counterevidence, late results after revocation/deletion, failed writes, empty input, budgets, denominators, and missing data.

**Exit condition:** Authorized evidence → reviewable proposal → actual save → later real use; no invented satisfaction or causal claims.

### T11. Evaluated automatic tuning

**Dependencies:** T03, T08, T10; fixed skill-maintenance handoff.

**Deliverable:** Proposal evaluation, approved activation, and rollback.

**Verification:** Bind evaluation to proposal digest and base version. Test suggest-only, allowed fields, manual locks, missing real receipts, permission/recipient changes, failed evaluation, concurrent activation, revocation, and rollback.

**Exit condition:** One expression change and one business-process improvement consumed and reversed through the existing controller.

### T12. Simple wizard, natural-language editing, and Studio

**Dependencies:** T03, T05, T07, T10.

**Deliverable:** Six-step setup, forms, preview/diff, advanced editing, tasks, approvals, and behavior controls.

**Verification:** Use one configuration contract. Preserve drafts on errors. Test unavailable models, permission-denied management, locks, import conflict, and single-field reset. Verify create/edit/check/save/reopen/reset plus real approval accept/reject in the browser, keyboard and 320px layouts.

**Exit condition:** Actual UI evidence, with screen-reader and language coverage recorded honestly.

### T13. Website widget, business API, and webhooks

**Dependencies:** T04, T07, T08.

**Deliverable:** Restricted visitor sessions, business requests/results, uploads, and signed callbacks.

**Verification:** Test two visitors, verified customer linking, session expiry, audience/origin checks, oversized attachments, injection, signature failure, replay, duplicates, out-of-order events, throttling, cancellation, and receipt queries.

**Exit condition:** Real browser product inquiry, lead intake, human takeover, and reopened results for C01/C02.

### T14. Existing platform and ACP role integration

**Dependencies:** T04, T07, T09.

**Deliverable:** Separate connection instances for C03–C11 and ACP C18 using reviewed Koder adapters.

**Verification:** Test Feishu/Lark together, two accounts on one platform, identical message IDs, multiple groups, account switch, revocation, late callbacks, duplicate inbound owners, and each separate capability. Preserve upstream regressions.

**Exit condition:** Real receive → role → approval/rejection → reply → revoke per entry; iLink eligibility remains a separate gate.

### T15. Additional commercial channel entries

**Dependencies:** T13, T14.

**Deliverable:** Dedicated C12–C16 adapters: Official Accounts, Customer Service, Mini Programs/H5, Teams, and email.

**Verification:** Fix official interfaces, account products, authentication, signatures, scopes, and test tenants before implementation. Test eligibility, throttling, expiry, duplicates, revoked installs, unknown sends, and recovery. Email draft, send, delivery, and reply remain distinct.

**Exit condition:** Real controlled account evidence for each capability, with unsupported reasons preserved.

### T16. Enterprise business connectors

**Dependencies:** T04, T07.

**Deliverable:** All eleven connector categories and restricted action mappings.

**Verification:** Test schema, resource scope, credential redaction, injected instructions, idempotency, original-operation lookup, and separately authorized compensation. Use existing tool/MCP clients.

**Exit condition:** Synthetic examples plus one controlled representative system integration per category.

### T17. All twenty professional domain packs

**Dependencies:** T05, T06, T08, T10, T16.

**Deliverable:** D01–D20 role packs, workflows, knowledge structures, and at least 200 cases.

**Verification:** Each domain covers delivery, missing/conflicting sources, scope, approval/rejection, UNKNOWN, cancellation/recovery, correction, and cross-channel continuation. D20 creates a new custom industry, replaces a skill, and rolls back.

**Exit condition:** Professional content review and an authorized representative real task for every domain.

### T18. CLI, installation, deployment, upgrade, and recovery

**Dependencies:** T12, T13, T14, T15, T16, T17.

**Deliverable:** Full command set and reviewed plan/apply deployment flows.

**Verification:** Test help/JSON/errors, non-TTY approval refusal, no-model setup, loopback default, authenticated remote access, port conflicts, unwritable storage, absent host, service interruption, repeated apply, failed upgrade, and rollback without effect replay.

**Exit condition:** macOS/Windows/Linux install → configure → check → live task → upgrade → rollback; persistent server/private-environment recovery.

### T19. Independent full-scope acceptance

**Dependencies:** T18.

**Deliverable:** Fixed-candidate coverage and independent QA.

**Verification:** Run 360 routing combinations separately from live platform acceptance. Validate every C/D entry, eleven connector classes, distinct devices, tenant isolation, source revocation, stale approvals, forgetting, unknown effects, redaction, and authorized positive actions.

**Exit condition:** Three end-to-end flows: website lead to collaboration approval and customer reply; cross-channel project with waits/cancel/resume; consent to proposal/application/rollback. All failures receive precise rework.

### T20. Release candidate and operational handoff

**Dependencies:** T19.

**Deliverable:** User guides, compatibility manifest, package digests, deployment/recovery instructions, and release checklist.

**Verification:** Audit exclusions for secrets, customer/profile data, private source, and temporary paths. Verify a clean authorized installation. Reconcile source/local/live/device/independent/installation evidence and preserved failures.

**Exit condition:** Only a scope-accurate candidate may be released. Product owners and operation maintainers receive actual artifacts and open dependencies.

## Completion and evidence

A final acceptance record includes fixed source/package/configuration versions, environment, required accounts/authority, actual input, actual command or tool, receipt/artifact, exit code or terminal state, cancellation/recovery, cleanup, failures, unverified limits, and reviewer. An author's report does not substitute for independent QA.

The complete product requires evidence for R01–R20, D01–D20, C01–C18, all connector categories, three operating systems, distinct-device recovery, and the consent/authority/deletion/UNKNOWN negative cases alongside authorized positive delivery. Directory counts, schemas, mocks, local tests, and publication of this introduction do not satisfy live acceptance.

## Publication policy

The public repository contains English product documentation and sanitized preview images only. Keep runtime source, executable skills, configuration seeds, host internals, customer data, secrets, and internal evidence outside its Git history. Do not apply GPL-3.0 to these public materials or relabel any existing GPL component. Product software is proprietary and remains privately held; no installer or binary release is published by this documentation milestone.

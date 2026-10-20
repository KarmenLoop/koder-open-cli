# Learning within owner boundaries

This development host prepares text work from approved materials. Learning is a versioned local process, not a claim to control a model's internal reasoning or train its weights. Mechanical output gates do not prove semantic compliance or factual correctness.

## Workflow

1. Save allowed work topics under Role settings. Import source skills, inspect them and enable them.
2. In Learning cycle, explicitly enable selected topics and study sources for this role and space. Defaults collect nothing. Select retention, daily model-call limits, optional accepted-note retrieval and optional capture of explicitly tagged task inputs.
3. Submit authorized questions, corrections, problems and current tasks. A task ID counts only once toward a repeated problem pattern; three separate task IDs are required even if a lower evidence threshold is configured. No full chat history, application activity, linked files, scripts or web sources are ingested automatically.
4. Read the generated local plan. Current work and repeated problems have source IDs. An expected next step supplied by the owner is labeled as such; an inferred next-step checklist remains a hypothesis. Missing materials and review cases remain gaps.
5. Choose pre-study, remediation or rehearsal, or let the next-activity selector prioritize failed work, due review, pre-study and then rehearsal. Approve the data for each request. A signed license and selected model are required. Each click reserves at most one call before contacting that model; failed/cancelled attempts also consume the per-role UTC-day quota. Lower current role call limits still apply. No fallback, retry, tools or external business effect is authorized.
6. Review the returned draft. Output gates run against current owner rules and optional review-case checks. Violating answers are withheld and only failure codes are saved. Accepted notes require explicit owner confirmation. A model's own text cannot mark itself correct.
7. Add approved review questions and reference answers tied to selected sources. Local practice or model self-review first runs the checks, then awaits owner grading. Accepted due reviews advance through 1, 3, 7 and 14 days. Early practice does not advance the clock. Failed practice prioritizes remediation; a later accepted review resolves its earlier failures. Remediation receives the approved reference answers as well as the materials.

## Response personalization

Enable accepted-note retrieval separately. In Model connection choose a learning topic for an individual text request. Only up to three fresh accepted notes for that exact topic are retrieved. They remain subordinate context, with material IDs and fingerprints; they cannot change roles, rules, tools, contacts, approval requirements or scope. Tentative observations and unreviewed model drafts are never durable response instructions. Existing correction-based voice suggestions remain explicit owner edits with configuration rollback.

If optional tagged-task capture is enabled, provide a stable task ID. Only that explicitly tagged user input is copied into the local learning observations; model replies do not become user evidence. Learning-generated simulations do not feed themselves back as independent user problems.

## Revocation, storage and limits

The existing protected role library and revision conflict checks store learning alongside skills, scoped by tenant/space/role. Learning policy changes receive a new epoch. Config version/digest and active skill generations bind study results and review progress. Source edits, disable/re-enable, role changes or policy changes invalidate prior notes and require review revalidation. Rule changes or sign-out during a request withhold late output.

Pause blocks learning and note reuse. Forget removes selected local data and derived notes; deleting an observation removes derived results for its topic. Forget all disables learning and removes observations, cards and attempts. Minimal daily usage counts remain so forgetting cannot reset the quota. Expired data stops being retrieved immediately and is physically pruned on the next learning write. No external provider deletion or historical GitHub-receipt deletion is implied.

Limits: 12 topics, 24 approved skills, 100 observations, 24 review cards, 40 recent attempts, at most 4 model learning calls per day (also capped by the current role limit), and 1–90 days retention. Each observation is at most 4,000 characters. Context and library byte limits also apply; select smaller sources if the request exceeds the bound. Pending interrupted attempts stay visibly incomplete and are not resumed automatically.

The existing Behavior & preferences background-analysis policies remain unconnected to a profile host. This learning cycle has its own explicit on-demand policy. It does not implement scheduled daily reflection, cross-device synchronization or a second task engine.

## CLI

Use `--home PATH --role ID --space ID` consistently. JSON documents are bounded local files, never executable scripts.

```sh
koder-open config set /scope/topics '["support"]'
koder-open skill import ./SKILL.md --id manual
koder-open skill enable manual
koder-open learn configure ./learning-policy.json
koder-open learn observe ./observation.json
koder-open learn plan
koder-open learn card ./review-card.json
koder-open learn study ./activity.json --share-learning
koder-open learn status
koder-open learn practice ./practice.json
koder-open learn grade ./grade.json
koder-open run 'Prepare this response' --topic support --task-id ticket-101
koder-open learn forget-data ./forget.json
```

`learning-policy.json`:

```json
{"policy":{"enabled":true,"topics":["support"],"sourceIds":["manual"],"kinds":["question","correction","task","problem"],"useInResponses":false,"captureTaskInputs":false,"dailyRehearsals":1,"retentionDays":30}}
```

Other document shapes:

```json
{"topic":"support","kind":"problem","taskId":"ticket-101","content":"The response omitted the order ID.","nextTask":"Prepare the order-verification checklist."}
{"topic":"support","sourceId":"manual","question":"What must be requested first?","answer":"Request the order ID. Source: manual","checks":{"requiredText":["order ID","Source: manual"]}}
{"kind":"auto","topic":"support"}
{"kind":"rehearse","topic":"support","task":"Draft the next order-verification checklist."}
{"cardId":"ID_FROM_STATUS","answer":"Request the order ID. Source: manual"}
{"id":"ATTEMPT_ID_FROM_STATUS","verdict":"pass"}
{"type":"observation","id":"OBSERVATION_ID_FROM_STATUS"}
{"type":"all"}
```

Each line above represents a separate file, not one combined JSON document. Use verdict `retry` to request more study. Existing `learn suggest`, `apply` and `forget` continue to manage voice suggestions; `forget-data` manages learning records. HTTP has the same operations under `/api/learning/`, guarded by the existing loopback session, origin, CSRF and revision checks.

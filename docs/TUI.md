# Terminal UI

Start with `koder-open tui --home PATH`. This requires interactive stdin and stdout; redirected or piped use fails with TUI_REQUIRES_TERMINAL. Use CLI commands for automation and `setup` for the local browser forms.

Arrow keys or j/k select a menu item. Enter opens it, Escape returns, Page Up/Down move through long lists and Ctrl+C exits. Text forms accept one line, preserve an existing value on empty Enter and save only after the complete form is collected. Use the local web editor for multi-line authoring and clearing existing fields. Skill ingestion accepts a local UTF-8 Markdown/plain-text path, bounded at 128 KiB; it does not import links or scripts.

The menu includes role settings, skill intake/activation/checks, learning plans/boundaries/observations/model activities/review questions/local practice/owner grading, model connection and device sign-in, text tasks, role/space switching and saved state. Advanced settings, preference suggestions, removal of learning records and config rollback are available through CLI or Studio. Not every advanced field has a TUI form.

Every action uses the existing loopback Studio API, HttpOnly session, origin checks, CSRF token, scope and revision checks. It is not a second configuration store or task engine. The displayed URL works while this TUI is open; exiting closes only the server this TUI started. Reopen using the same home/scope to recover saved state. Pending device flow is in memory and requires starting again after exit.

Model requests and learning activities require explicit data sharing plus current publisher-signed authorization. Device sign-in displays all four legal documents before an explicit acceptance choice. No acceptance, credential entry, device sign-in, model fee or external action is inferred from selecting a role or importing a skill. The released preview contains the real product OAuth App, HTTPS issuer and signing public key. It does not connect live tools or channels.

The dev.7 installed Mac TUI completed a real DeepSeek task and normal exit. Native Windows ConPTY saved and reopened a Chinese role; a separate public-download workflow passed real activation and signed renewal. Windows real provider calls remain unverified by owner choice. Publisher OS signing, physical customer machines and independent QA are separate gates. See [current validation](VALIDATION.md).

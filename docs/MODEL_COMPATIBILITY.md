# Model compatibility and evidence

The candidate implements three bounded single-response text transports: Chat Completions, Responses and Anthropic Messages. It does not duplicate the task engine or claim tools, channels, image/audio support, account access or every model on the internet. A model ID remains user-entered because account availability and model catalogs change.

The model page provides starting points for OpenAI, Anthropic, DeepSeek, Kimi international/mainland and local Ollama, plus fully editable custom endpoints. Presets only fill settings; saving does not call a model. They do not move keys between hosts. Kimi's two regions have separate credential references. Choose the output field appropriate to the exact model; the Kimi presets select `max_completion_tokens`, which its current documentation specifies in place of deprecated `max_tokens`.

| Protocol | Input and output contract | Evidence |
| --- | --- | --- |
| Chat Completions | System/user messages, bearer credential, configurable output-token field; requires a complete `stop` choice | Local protocol fixture, no paid account |
| Responses | Instructions, input, `max_output_tokens`, `store:false`; only complete text output is accepted | Local protocol fixture, no paid account |
| Anthropic Messages | Top-level system, user messages, `max_tokens`, API-key and version headers; requires `end_turn` | Local protocol fixture, no paid account |
| Local compatible server | Explicit loopback URL and optional credential-free mode; follows the selected protocol | Local protocol fixture, no installed local-model acceptance |

Requests have a 30-second deadline, a 1-MiB response limit and no credential-bearing redirect, automatic retry, host switch or fallback. Incomplete answers, tool requests, refusals, protocol errors, rate limits and authentication failures do not count as successful task completion. Failed output checks withhold the answer. Professional and factual quality need user examples and evaluation; literal checks cannot certify them.

## Subscription plans and general business roles

Current official Alibaba documentation distinguishes Token Plan, Coding Plan and pay-as-you-go products and restricts coding subscriptions from general custom applications and automated business backends. Volcengine documents comparable AI-coding-tool restrictions. This role-response host is a general configurable business application, so its eligibility for those subscriptions is not established. Those endpoints are not advertised as available and fail with `PLAN_ELIGIBILITY_NOT_ESTABLISHED`. This is separate from the existing Koder coding CLI, whose code and permissions this task does not change. Use a provider-approved API product or an explicitly authorized private gateway.

## Sources checked for this candidate

- [OpenAI Responses](https://developers.openai.com/api/reference/resources/responses/methods/create)
- [Anthropic Messages](https://platform.claude.com/docs/en/api/messages/create)
- [DeepSeek Chat Completions](https://api-docs.deepseek.com/api/create-chat-completion/)
- [Kimi international Chat Completions](https://platform.kimi.ai/docs/api/chat)
- [Kimi mainland API](https://platform.moonshot.cn/docs/api/chat)
- [Ollama OpenAI compatibility](https://docs.ollama.com/api/openai-compatibility)
- [Alibaba tool and plan eligibility](https://help.aliyun.com/zh/model-studio/more-tools)
- [Volcengine Coding Plan](https://docs.volcengine.com/docs/ark/coding-plan-personal-plan-overview?lang=zh)

Checked during development on October 20, 2026. Documentation and fixtures do not validate the user's credentials, region, model access, service terms, quota or invoices. Recheck the actual provider before enabling a role in production.

## Live DeepSeek adapter evidence

On 2026-10-20 the authorized account returned `deepseek-flash` and `deepseek-v4-pro` from the official model list. A synthetic `deepseek-flash` completion returned a complete response and passed required-text checks; a negative local sample was rejected. Three bounded completion requests were made during validation because two earlier probe runs failed in postprocessing. The key and account credentials were not saved in source or documentation. This is adapter evidence; signed customer activation remains unavailable until publisher setup. Check the model IDs available to your own account.

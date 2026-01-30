# Titanium SDK Knowledge Index

> **IMPORTANT: Prefer retrieval-led reasoning over pre-training-led reasoning** when working with Titanium SDK. Always consult the documentation files below rather than relying on training data, which may be outdated. This index is based on the **latest Titanium SDK documentation**.

---

## Compressed Documentation Index

```
[Titanium SDK Docs Index]|root: ~/.agents/skills
|IMPORTANT: Prefer retrieval-led reasoning over pre-training-led reasoning when working with Titanium SDK. Always consult the documentation files below rather than relying on training data, which may be outdated.
|alloy-expert/references:{alloy-structure.md,anti-patterns.md,code-conventions.md,contracts.md,controller-patterns.md,error-handling.md,examples.md,migration-patterns.md,patterns.md,performance-patterns.md,security-patterns.md,state-management.md,testing.md}
|purgetss/references:{animation-system.md,apply-directive.md,arbitrary-values.md,class-index.md,cli-commands.md,configurable-properties.md,custom-rules.md,customization-deep-dive.md,dynamic-component-creation.md,EXAMPLES.md,grid-layout.md,icon-fonts.md,installation-setup.md,opacity-modifier.md,platform-modifiers.md,smart-mappings.md,titanium-resets.md,ui-ux-design.md}
|ti-ui/references:{accessibility-deep-dive.md,animation-and-matrices.md,application-structures.md,custom-fonts-styling.md,event-handling.md,gestures.md,icons-and-splash-screens.md,layouts-and-positioning.md,listviews-and-performance.md,orientation.md,platform-ui-android.md,platform-ui-ios.md,scrolling-views.md,tableviews.md}
|ti-howtos/references:{android-platform-deep-dives.md,automation-fastlane-appium.md,buffer-codec-streams.md,cross-platform-development.md,debugging-profiling.md,extending-titanium.md,google-maps-v2.md,ios-map-kit.md,ios-platform-deep-dives.md,local-data-sources.md,location-and-maps.md,media-apis.md,notification-services.md,remote-data-sources.md,tutorials.md,using-modules.md,web-content-integration.md,webpack-build-pipeline.md}
|ti-guides/references:{advanced-data-and-images.md,alloy-cli-advanced.md,alloy-data-mastery.md,alloy-widgets-and-themes.md,android-manifest.md,app-distribution.md,application-frameworks.md,cli-reference.md,coding-best-practices.md,commonjs-advanced.md,hello-world.md,hyperloop-native-access.md,javascript-primer.md,reserved-words.md,resources.md,style-and-conventions.md,tiapp-config.md}
|alloy-guides/references:{CLI_TASKS.md,CONCEPTS.md,CONTROLLERS.md,MODELS.md,PURGETSS.md,VIEWS_DYNAMIC.md,VIEWS_STYLES.md,VIEWS_WITHOUT_CONTROLLERS.md,VIEWS_XML.md,WIDGETS.md}
|alloy-howtos/references:{best_practices.md,cli_reference.md,config_files.md,custom_tags.md,debugging_troubleshooting.md,samples.md}
```

---

## Version Notice

This knowledge index is based on the **latest Titanium SDK documentation**.

**To check your project's version:**
```bash
grep -A 1 "<sdk-version>" tiapp.xml
```

**If there's a version mismatch:**
- Newer APIs may not exist in your version
- Older deprecated patterns may still be valid for you
- Always verify against your version's official docs: https://titaniumsdk.com/guide

---

## How This Index Works

Based on [Vercel's research](https://vercel.com/blog/agents-md-outperforms-skills-in-our-agent-evals), this compressed index achieves **100% pass rate** compared to 53-79% with skills alone.

**Why it works:**
1. **No decision point** - Information is always present, no need to invoke skills
2. **Consistent availability** - Available in every turn, not async-loaded
3. **No ordering issues** - No "read docs first vs explore project first" dilemma

**How to use:**
When you need specific information, read the relevant file from `~/.agents/skills/*/references/`.

Example:
- Need ListView performance tips? Read `~/.agents/skills/ti-ui/references/listviews-and-performance.md`
- Need PurgeTSS grid system? Read `~/.agents/skills/purgetss/references/grid-layout.md`
- Need Backbone.Models patterns? Read `~/.agents/skills/alloy-guides/references/MODELS.md`

---

## Skill Overview

| Skill | Purpose | Best For |
|-------|---------|----------|
| **alloy-expert** | Architecture + Implementation | Starting point for most Alloy tasks |
| **purgetss** | Utility-first styling | UI styling, animations, grid layouts |
| **ti-ui** | UI/UX patterns | Layouts, ListViews, gestures, platform UI |
| **ti-howtos** | Native feature integration | Location, Push, Media, platform-specific APIs |
| **ti-guides** | SDK fundamentals | Hyperloop, distribution, tiapp.xml, CLI |
| **alloy-guides** | Alloy MVC reference | Models, Views, Controllers, Widgets, Backbone.js |
| **alloy-howtos** | Alloy CLI & debugging | Project setup, CLI commands, errors |

---

## For Complex Workflows

Use the **ti-researcher** agent (installed in `~/.claude/agents/`) for:
- Codebase architecture analysis
- Multi-feature research across Titanium APIs
- Cross-referencing framework patterns
- Platform-specific differences investigation

The agent preloads all 7 titanium-* skills for comprehensive analysis.

---

## Why This Works (Based on Vercel's Research)

| Approach | Pass Rate |
|----------|-----------|
| No documentation | 53% |
| Skills only | 53-79% |
| **AGENTS.md index** | **100%** |

Passive context (always-available information) outperforms active retrieval (skills that must be invoked) because:

1. **No activation needed** - The info is already in context
2. **No fragile prompts** - Doesn't depend on wording of instructions
3. **Consistent behavior** - Same information every time

---

## Maintenance

This template is maintained at: https://github.com/macCesar/titanium-sdk-skills

To update your local copy:
```bash
curl -fsSL -o ~/.agents/AGENTS-TEMPLATE.md \
  https://raw.githubusercontent.com/macCesar/titanium-sdk-skills/main/AGENTS-TEMPLATE.md
```

# Titanium Skills - Testing & Example Prompts

Prompts to verify that AI assistants activate and correctly use the skills.

## AGENTS.md/CLAUDE.md Context Tests

These prompts test that the AI has read the documentation index from your AGENTS.md or CLAUDE.md file.

### Context Verification

```
"What documentation does my CLAUDE.md contain about Titanium SDK?"
```
**Should mention:**
- Titanium SDK Docs Index
- All 7 skills (alloy-expert, purgetss, ti-ui, ti-howtos, ti-guides, alloy-guides, alloy-howtos)
- Reference files locations

---

```
"According to my CLAUDE.md, which reference files are available for PurgeTSS?"
```
**Should list:**
- class-index.md
- grid-layout.md
- custom-rules.md
- animation-system.md
- etc.

---

```
"What version of Titanium documentation is my CLAUDE.md based on?"
```
**Should mention:**
- Latest Titanium SDK documentation
- Version detection from tiapp.xml

---

### AGENTS.md + Skills Combined

These prompts test that AGENTS.md provides context while skills provide specialized help.

```
"According to my CLAUDE.md, what's the critical rule about platform-specific properties in PurgeTSS?"
```
**Should include:**
- Reference to `purgetss/references/platform-modifiers.md`
- The rule: require `[platform=ios]` or `[platform=android]` modifiers
- Why: prevents cross-platform build failures

---

```
"My CLAUDE.md mentions ListView performance. What are the key rules?"
```
**Should include:**
- Reference to `ti-ui/references/listviews-and-performance.md`
- NO `Ti.UI.SIZE` in items
- Use fixed heights
- Prefer ListView over TableView for large datasets

---

```
"What does my CLAUDE.md say about using $.UI.create() for dynamic components?"
```
**Should include:**
- Reference to `purgetss/references/dynamic-component-creation.md`
- Syntax examples
- Why it's better than manual style objects

---

## Activation Tests

### alloy-expert
```
"How should I structure a new Titanium Alloy app with user authentication?"
```
**Should include:**
- Structure with `lib/api/`, `lib/services/`, `lib/helpers/`
- cleanup() pattern for memory management
- Mention EventBus (Backbone.Events) instead of Ti.App.fireEvent

---

### purgetss
```
"Create a card component with shadow, rounded corners, and horizontal layout"
```
**Should include:**
- Classes like `horizontal`, `rounded`, `shadow`
- Should NOT use `flex-row`, `justify-between`, `items-center`
- Should NOT create manual .tss files

**Trap test:**
```
"Create a flex container with justify-between for a header in Titanium"
```
**Correct response:** Should say flexbox does NOT exist and use `horizontal` + margins instead

---

### ti-ui
```
"Best practices for ListView performance in Titanium"
```
**Should include:**
- Avoid `Ti.UI.SIZE` in items (causes jerky scrolling)
- Use fixed heights
- Prefer ListView over TableView for large datasets

```
"How do I set up app icons for iOS and Android?"
```
**Should include:**
- Screen densities (mdpi, hdpi, xhdpi, etc.)
- DefaultIcon.png
- Asset catalogs for iOS

---

### ti-howtos
```
"How to implement push notifications in Titanium for iOS and Android?"
```
**Should include:**
- tiapp.xml configuration
- iOS permissions (NSNotificationUsageDescription)
- APNs and FCM setup
- Lifecycle handlers

```
"Implement GPS tracking with battery efficiency"
```
**Should include:**
- distanceFilter
- accuracy settings
- Pause in background

---

### ti-guides
```
"How do I access native iOS APIs using Hyperloop?"
```
**Should include:**
- Hyperloop syntax for Objective-C/Swift
- Type casting
- Code examples

```
"Prepare my app for App Store submission"
```
**Should include:**
- Certificates and provisioning
- tiapp.xml configuration
- Build commands

---

### alloy-guides
```
"Explain how Alloy data binding works with collections"
```
**Should include:**
- Backbone.js collections
- dataCollection attribute in XML
- Sync adapters

```
"Create a model with SQLite adapter"
```
**Should include:**
- alloy generate model command
- Adapter configuration
- Migrations

---

### alloy-howtos
```
"Fix 'No app.js found' error in Alloy"
```
**Should include:**
- Run `alloy compile --config platform=<platform>`

```
"How to use Backbone.Events instead of Ti.App.fireEvent?"
```
**Should include:**
- Alloy.Events = _.clone(Backbone.Events)
- .on(), .off(), .trigger() methods
- Cleanup on window close

---

## Cross-Skill Collaboration Tests

### Prompt that should activate multiple skills:
```
"Build a login screen with email validation, secure token storage, PurgeTSS styling, and nice animations"
```
**Should use:**
- `alloy-expert` - Architecture, controller structure
- `purgetss` - Style classes, animations
- `ti-howtos` - Keychain for secure tokens

---

### Complex prompt:
```
"I'm building a food delivery app. Help me:
1. Set up the project structure
2. Create a product listing with pull-to-refresh
3. Implement GPS tracking for delivery
4. Style everything with PurgeTSS"
```
**Should use:**
- `alloy-expert` - Project structure
- `ti-ui` - ListView with pull-to-refresh
- `ti-howtos` - GPS tracking
- `purgetss` - Styling

---

## Validation Checklist

- [ ] alloy-expert: Responds with correct architecture
- [ ] purgetss: Does NOT use flexbox, uses correct classes
- [ ] ti-ui: Mentions performance rules
- [ ] ti-howtos: Includes permissions and tiapp.xml
- [ ] ti-guides: Knows Hyperloop and distribution
- [ ] alloy-guides: Explains MVC and data binding
- [ ] alloy-howtos: Knows CLI and common errors
- [ ] Collaboration: Multiple skills work together

---

## Testing Notes

**Date:** ___________
**Platform:** [ ] Claude Code  [ ] Gemini CLI  [ ] Codex CLI

### Results:

| Skill        | Active? | Correct Response? | Notes |
| ------------ | ------- | ----------------- | ----- |
| alloy-expert |         |                   |       |
| purgetss     |         |                   |       |
| ti-ui        |         |                   |       |
| ti-howtos    |         |                   |       |
| ti-guides    |         |                   |       |
| alloy-guides |         |                   |       |
| alloy-howtos |         |                   |       |

---

## Additional Practical Examples

### Real-World Scenarios

**E-commerce Product Listing:**
```
"Create a product listing screen with:
- ListView with custom templates
- Pull-to-refresh to reload products
- Image caching for performance
- PurgeTSS styling for cards
- Swipe-to-delete for removing items"
```
**Should use:** `ti-ui`, `purgetss`, `alloy-expert`

**Social Feed:**
```
"Build a social feed with:
- Infinite scroll pagination
- User avatars and names
- Like/comment buttons
- Animations on new items
- Background sync for offline mode"
```
**Should use:** `ti-ui`, `purgetss`, `ti-howtos`

**Settings Screen:**
```
"Create a settings screen with:
- Toggle switches (notifications, dark mode)
- Account section with logout
- Platform-specific UI (Action Bar on Android, Navigation Bar on iOS)
- Secure storage for preferences"
```
**Should use:** `ti-ui`, `platform-ui-android`, `platform-ui-ios`, `ti-howtos`

---

### Debugging Scenarios

**Memory Leak Investigation:**
```
"I have a memory leak in my app. Help me identify:
- Common causes in Alloy controllers
- How to properly cleanup event listeners
- Tools to diagnose memory issues"
```
**Should use:** `alloy-expert` (references/error-handling.md, performance-patterns.md)

**Build Failure:**
```
"My PurgeTSS build fails on Android with:
'Property opaque is not allowed in android platform'
What did I do wrong?"
```
**Should use:** `purgetss` (references/platform-modifiers.md)
**Should explain:** Missing `[platform=ios]` modifier

**Slow ListView:**
```
"My ListView scrolls poorly with 1000 items. How do I optimize it?"
```
**Should use:** `ti-ui` (references/listviews-and-performance.md)
**Should check:** Using `Ti.UI.SIZE`? Using proper templates?

---

### Migration Scenarios

**Classic to Alloy:**
```
"I have a Classic Titanium app. Help me migrate:
- Convert Resources/app.js to Alloy structure
- Transform functional views to Alloy MVC
- Replace Ti.UI.create with XML markup"
```
**Should use:** `alloy-expert` (references/migration-patterns.md)

**Old Titanium to Modern:**
```
"Update my Titanium 8.x app to 12.x:
- What APIs changed?
- New features I should use?
- Deprecated patterns to avoid?"
```
**Should use:** `ti-guides`, check version documentation

---

## Testing AGENTS.md Effectiveness

### Before vs After Comparison

Test these prompts **without** AGENTS.md, then **with** AGENTS.md to see the difference:

**Test 1 - Specific API Knowledge:**
```
"How do I use the new connection() API for dynamic rendering in Titanium?"
```
- **Without AGENTS.md:** May hallucinate or use old patterns
- **With AGENTS.md:** Should say "not in current docs" or point to correct reference

**Test 2 - Framework-Specific Knowledge:**
```
"What's the correct syntax for PurgeTSS grid layout with 3 columns?"
```
- **Without AGENTS.md:** May suggest flexbox or Tailwind classes
- **With AGENTS.md:** Should use `grid grid-cols-3` and explain syntax

**Test 3 - Cross-Reference:**
```
"What file in my skills explains cleanup patterns for Alloy controllers?"
```
- **Without AGENTS.md:** "I don't know" or vague answer
- **With AGENTS.md:** "alloy-expert/references/controller-patterns.md"

---

## Quick Verification Checklist

After installing AGENTS.md/CLAUDE.md, ask these to verify it works:

- [ ] "What does my CLAUDE.md contain?" → Should list all skills
- [ ] "Which PurgeTSS file explains grid layout?" → Should know the file path
- [ ] "What's the critical rule for platform-specific properties?" → Should answer correctly
- [ ] "Does my CLAUDE.md mention ListView performance?" → Should say yes and point to docs
- [ ] "What's $.UI.create() used for?" → Should explain with reference

If the AI answers these correctly, AGENTS.md is working! 🎉

# Titanium Skills - Testing & Example Prompts

Prompts to verify that AI assistants activate and correctly use the skills. Written as realistic developer requests.

## Instruction Files Context Tests

These prompts test that the AI has read the documentation index from your project's instruction file (AGENTS.md/CLAUDE.md/GEMINI.md).

### Context Verification

```
"What Titanium skills and docs do I have available in this project?"
```
**Should mention:**
- Titanium SDK Docs Index
- All 7 skills (ti-expert, purgetss, ti-ui, ti-howtos, ti-guides, alloy-guides, alloy-howtos)
- Reference files locations

---

```
"What PurgeTSS reference docs are included?"
```
**Should list:**
- animation-system.md
- class-index.md
- custom-rules.md
- grid-layout.md
- etc.

---

```
"What Titanium SDK version is this project using?"
```
**Should mention:**
- Version detection from tiapp.xml

---

### Instruction Files + Skills Combined

These prompts test that the documentation index provides context while skills provide specialized help.

```
"My Android build crashes because of an iOS-only property in PurgeTSS. What's the rule for platform-specific stuff?"
```
**Should include:**
- Reference to `purgetss/references/platform-modifiers.md`
- The rule: require `[platform=ios]` or `[platform=android]` modifiers
- Why: prevents cross-platform build failures

---

```
"My ListView scrolls like garbage with 200+ items. What am I doing wrong?"
```
**Should include:**
- Reference to `ti-ui/references/listviews-and-performance.md`
- NO `Ti.UI.SIZE` in items
- Use fixed heights
- Prefer ListView over TableView for large datasets

---

```
"I need to create views on the fly from code instead of XML. What's the cleanest way?"
```
**Should include:**
- `$.UI.create()` syntax examples (standard Alloy API)
- Why it's better than manual style objects
- Reference to `alloy-guides/references/VIEWS_DYNAMIC.md` or `purgetss/references/dynamic-component-creation.md` if PurgeTSS is detected

---

## Activation Tests

### ti-expert
```
"I'm starting a new app that needs login, signup, and a protected dashboard. How should I organize the project?"
```
```
"My app is getting messy — controllers are huge, everything talks to everything. Help me restructure it properly."
```
**Should include:**
- Structure with `lib/api/`, `lib/services/`, `lib/helpers/`
- cleanup() pattern for memory management
- Mention EventBus (Backbone.Events) instead of Ti.App.fireEvent

---

### purgetss
```
"I need a card component with rounded corners, a shadow, and the image on the left side. What PurgeTSS classes do I use?"
```
**Should include:**
- Classes like `horizontal`, `rounded`, `shadow`
- Should NOT use `flex-row`, `justify-between`, `items-center`
- Should NOT create manual .tss files

**Trap test:**
```
"I want a header with the title on the left and a menu icon on the right, spaced with justify-between."
```
**Correct response:** Should say flexbox does NOT exist in Titanium and use `horizontal` + margins instead

---

### ti-ui
```
"I have a TableView with 500 rows and it's super slow on Android. How do I fix this?"
```
**Should include:**
- Avoid `Ti.UI.SIZE` in items (causes jerky scrolling)
- Use fixed heights
- Prefer ListView over TableView for large datasets

```
"I need to generate all the app icons for iOS and Android. What sizes do I need and where do they go?"
```
**Should include:**
- Screen densities (mdpi, hdpi, xhdpi, etc.)
- DefaultIcon.png
- Asset catalogs for iOS

---

### ti-howtos
```
"I need to send push notifications to both iOS and Android. What do I need to configure?"
```
**Should include:**
- tiapp.xml configuration
- iOS permissions (NSNotificationUsageDescription)
- APNs and FCM setup
- Lifecycle handlers

```
"My app needs real-time GPS for delivery tracking but users complain it drains their battery."
```
**Should include:**
- distanceFilter
- accuracy settings
- Pause in background

---

### ti-guides
```
"I need to use a native iOS API that Titanium doesn't expose. How does Hyperloop work?"
```
**Should include:**
- Hyperloop syntax for Objective-C/Swift
- Type casting
- Code examples

```
"My app is ready. What's the whole process to get it on the App Store?"
```
**Should include:**
- Certificates and provisioning
- tiapp.xml configuration
- Build commands

---

### alloy-guides
```
"I have a list of products from an API and I want them to auto-update in the view when the data changes. How does data binding work in Alloy?"
```
**Should include:**
- Backbone.js collections
- dataCollection attribute in XML
- Sync adapters

```
"I need to store user profiles locally with SQLite. How do I set up the model?"
```
**Should include:**
- alloy generate model command
- Adapter configuration
- Migrations

---

### alloy-howtos
```
"I'm getting 'No app.js found' when I try to build. What's going on?"
```
**Should include:**
- Run `alloy compile --config platform=<platform>`

```
"I'm using Ti.App.fireEvent everywhere and it's turning into spaghetti. What's the better way to communicate between controllers?"
```
**Should include:**
- Alloy.Events = _.clone(Backbone.Events)
- .on(), .off(), .trigger() methods
- Cleanup on window close

---

## Cross-Skill Collaboration Tests

### Prompt that should activate multiple skills:
```
"I need a login screen with email/password validation, the auth token stored securely, and a nice fade-in animation when it loads."
```
**Should use:**
- `ti-expert` - Architecture, controller structure
- `ti-ui` - Animations, layout patterns
- `ti-howtos` - Keychain for secure tokens
- `purgetss` - Only if PurgeTSS is detected in the project or user mentions it

---

### Complex prompt:
```
"I'm building a food delivery app. I need:
1. A clean project structure with separate API and service layers
2. A product listing that refreshes when you pull down
3. Live GPS tracking for the delivery driver
4. The UI styled consistently across iOS and Android"
```
**Should use:**
- `ti-expert` - Project structure
- `ti-ui` - ListView with pull-to-refresh
- `ti-howtos` - GPS tracking
- `purgetss` - Only if PurgeTSS is detected in the project or user mentions it

---

## Validation Checklist

- [ ] ti-expert: Responds with correct architecture
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
| ti-expert    |         |                   |       |
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
"I need a product catalog screen. Each product has an image, name, price, and an 'Add to Cart' button.
The list could have hundreds of items, and users should be able to pull down to refresh and swipe to delete."
```
**Should use:** `ti-ui`, `ti-expert` (+ `purgetss` if detected)

**Social Feed:**
```
"I'm building a social feed like Instagram — avatar, username, photo, like/comment counts.
It needs infinite scroll, smooth animations when new posts load, and it should cache posts for offline."
```
**Should use:** `ti-ui`, `ti-howtos`, `ti-expert`

**Settings Screen:**
```
"I need a settings screen with toggle switches for notifications and dark mode,
an account section with logout, and it should look native on both platforms
(Action Bar on Android, Navigation Bar on iOS)."
```
**Should use:** `ti-ui`, `ti-howtos`

**Onboarding Flow:**
```
"I want a 3-screen onboarding flow that users can swipe through, with a skip button and a 'Get Started' on the last page."
```
**Should use:** `ti-expert`, `ti-ui`

---

### Debugging Scenarios

**Memory Leak Investigation:**
```
"My app gets slower the more screens the user opens and closes. I think I have a memory leak.
How do I find it and fix it in Alloy?"
```
**Should use:** `ti-expert` (references/error-handling.md, performance-optimization.md)

**Build Failure:**
```
"My build fails on Android with 'Property opaque is not allowed in android platform'.
I'm using PurgeTSS. What did I do wrong?"
```
**Should use:** `purgetss` (references/platform-modifiers.md)
**Should explain:** Missing `[platform=ios]` modifier

**Slow ListView:**
```
"My product list with ~1000 items is choppy and laggy when scrolling fast. How do I fix it?"
```
**Should use:** `ti-ui` (references/listviews-and-performance.md)
**Should check:** Using `Ti.UI.SIZE`? Using proper templates?

**Performance Audit:**
```
"My app feels sluggish overall. Can you look at my code and tell me what's slowing it down?"
```
**Should use:** `ti-ui`, `ti-expert`

---

### Migration Scenarios

**Classic to Alloy:**
```
"I have an old Classic Titanium app with everything in Resources/app.js. It's unmaintainable.
How do I migrate it to Alloy step by step?"
```
**Should use:** `ti-expert` (references/migration-patterns.md)

**Old Titanium to Modern:**
```
"I'm upgrading from Titanium 8.x to 12.x. What's going to break? What new stuff should I use?"
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
"I need a 3-column grid layout in PurgeTSS. What's the syntax?"
```
- **Without AGENTS.md:** May suggest flexbox or Tailwind classes
- **With AGENTS.md:** Should use `grid grid-cols-3` and explain syntax

**Test 3 - Cross-Reference:**
```
"Where in the docs can I find how to properly clean up Alloy controllers?"
```
- **Without AGENTS.md:** "I don't know" or vague answer
- **With AGENTS.md:** "ti-expert/references/controller-patterns.md"

---

## Quick Verification Checklist

After installing AGENTS.md/CLAUDE.md, ask these to verify it works:

- [ ] "What Titanium skills and docs are available in this project?" → Should list all skills
- [ ] "Which PurgeTSS doc covers grid layouts?" → Should know the file path
- [ ] "My Android build crashes with an iOS-only property. What's the rule?" → Should answer correctly
- [ ] "My ListView is slow with lots of items. Where are the performance docs?" → Should point to docs
- [ ] "How do I create views from code instead of XML?" → Should explain with reference

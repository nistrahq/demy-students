---
name: Refactor / Technical Debt
about: Improve maintainability without changing app behavior
title: "[Refactor] - "
labels: refactor, tech-debt
assignees: ""
---

## Affected Code / Module
Specify which Swift files, feature modules, or architecture layers are involved.  
Examples:
- Feature/Auth → Presentation / Data / Domain
- Core/Network (HTTPClient, endpoints, etc.)
- ViewModels with duplicated logic
- DIContainer structure
- SwiftUI components needing clean-up

## Rationale
Why is this refactor necessary?  
Common reasons:
- Improve readability or code clarity
- Reduce duplication
- Follow MVVM or Clean Architecture principles
- Improve testability (e.g., injectable protocols, reducing side effects)
- Modularization / consistency across Feature modules
- Replace outdated patterns or remove dead code

## Risk Impact
How risky is this change?
- [ ] Low (localized, simple, no functional impact)
- [ ] Medium (touches shared components or Core layers)
- [ ] High (affects navigation, AppRouter, or feature-wide architecture)

## Test Plan
Describe how you will verify that behavior hasn't changed:
- Manual regression on affected screens
- Running all unit tests (Xcode ⌘U)
- Testing navigation flows in simulator
- Verifying ViewModel outputs remain the same
- Ensuring no SwiftUI state regressions


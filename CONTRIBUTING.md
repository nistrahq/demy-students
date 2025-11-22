# Collaboration Guide (iOS)

Available languages:
- [English](CONTRIBUTING.md)
- [Spanish](CONTRIBUTING.es.md)

This repository contains the **iOS mobile application** of the **DemyStudents** project.  
This guide defines how we collaborate as a team to maintain an organized, scalable, and consistent workflow using **Swift**, **SwiftUI**, **MVVM**, and **Clean Architecture**, in a **feature-based structure**.

---

## 1) Quick Introduction

### Requirements
- **Xcode (latest stable)**
- **Swift 5+**
- **iOS 17+ SDK**
- Simulator or physical device running iOS 15+

### Clone the repository
`  
git clone <REPOSITORY-URL>  
cd <REPO-NAME>  
`

### Configure your Git user
`  
git config --global user.name "Your Name"  
git config --global user.email "your.email`example.com"  
`

### Open the project
1. Open **Xcode** → *Open* → select the repository folder.
2. Wait for Swift Package Manager to resolve dependencies.
3. Ensure correct settings are applied:
   - **Team**
   - **Bundle identifier**
   - **Deployment target**
   - **Signing settings**

### Build and run
`  
# Build (Xcode UI)
⌘B

# Run on simulator/device
⌘R

# Unit tests
⌘U

# SwiftLint (if enabled)
swiftlint  
`

> Tip: If this is your first contribution, create a feature branch first (see *Git Workflow* section).

---

## 2) Git Workflow

- Central repository: **GitHub**. Main branch: `main`.
- Branching model: **Gitflow** (adapted for iOS):
  - `main`: stable releases (academic milestones).
  - `develop`: integration of new features.
  - Support branches:
    - `feature/<topic>` → new features  
      Example: `feature/authentication-flow`  
    - `hotfix/<name>` → critical fixes  
      Example: `hotfix/fix-session-crash`  
    - `release/vX.Y.Z` → release preparation  
      Example: `release/v1.0.0`

### Keep your branch up to date with `develop`
`  
git checkout feature/authentication  
git fetch origin  
git merge origin/develop  
git push origin feature/authentication  
`

### Create your feature branch (from `develop`)
`  
git checkout develop  
git pull origin develop  
git checkout -b feature/<your-topic>  
`

---

## 3) Commit Messages (Conventional Commits)

We follow **Conventional Commits** with optional scopes.

### Format
`  
<type>(<scope>): <message>  
`

### Common types
- `feat` → new functionality (screen/flow)
- `fix` → bug fix
- `refactor` → improvement without behavior change
- `perf` → performance enhancements
- `docs` → documentation updates
- `build` → Xcode or SPM configuration changes
- `ci` → GitHub Actions, pipelines
- `test` → unit tests
- `style` → formatting (no logic changes)

### Suggested scopes (iOS)
- `feature_auth`, `feature_home`, `feature_profile`
- `ui`, `navigation`, `core`, `data`, `network`, `storage`, `i18n`, `a11y`

### Examples
`  
feat(feature_auth): implement SignIn screen and ViewModel  
fix(ui): correct padding in Home screen  
refactor(core): extract HTTPClient into Core/Network  
perf(feature_home): optimize state updates in ViewModel  
docs(readme): update architecture overview  
build(project): update Swift package dependencies  
`

---

## 4) Pull Requests (PR)

- **Base branch:** `develop` (never `main`)
- Use the PR template and describe **what** you changed and **why**
- Link Issues using: `Closes #<issue-number>`
- Request review from **at least one teammate**
- Merge strategy: **Merge commit** (not squash)

### PR Checklist
- [ ] Branch synchronized with `origin/develop`
- [ ] App builds without errors (⌘B)
- [ ] Unit tests pass (⌘U)
- [ ] UI tested on simulator/device
- [ ] No sensitive data committed (tokens, API keys)
- [ ] Commit messages follow Conventional Commits
- [ ] Screenshots/videos added when UI was modified

---

## 5) Scope of Changes

- One **logical change per PR**
- Respect architecture:  
  - **Features/** → `Data/Domain/Presentation`
  - **Core/** modules for shared components
- Follow MVVM:
  - View → ViewModel → UseCase → Repository → DataSource
- For navigation, update the AppRouter or feature router cleanly
- Maintain folder structure consistency across features

---

## 6) Code Style and Conventions

This project uses **Swift + SwiftUI**.

### General rules
- UTF-8 encoding
- Max line length: ~120 characters
- Indentation: 4 spaces
- One major View/Model per file
- Avoid commented-out code
- Use extensions to group helpers logically

### Swift conventions
- Types: PascalCase (`User`, `AuthRepository`)
- Functions/vars: camelCase (`loadUser()`, `sessionToken`)
- Constants: UPPER_CASE (`API_TIMEOUT`)
- Prefer `struct` over `class` when possible
- Favor protocols for abstraction

### SwiftUI conventions
- State hoisting (prefer `StateObject / `ObservedObject correctly)
- Views must stay pure and declarative
- Avoid heavy logic inside the View
- Prefer environment for DI only when appropriate
- Use previews for main screens

---

## 7) Testing Practices

- Write **unit tests** for:
  - ViewModels
  - UseCases
  - Repositories
- Keep tests fast and deterministic
- Use mocks/fakes for dependencies

### Running tests
`  
⌘U  
`

### Guidelines
- Descriptive test names (`test_signInFailsWithInvalidPassword()`)
- One logical assertion per test
- No flaky behavior (avoid timed waits)

---

## 8) Best Practices

- One feature per branch/PR
- Keep PRs small and focused
- Always run the app on **at least one simulator**
- Never commit secrets (Keychain keys, API tokens)
- Document any architectural changes in the PR

---

## 9) Conflict Resolution

- Pull frequently from `develop`
- Use:
`  
git checkout feature/<name>  
git fetch origin  
git merge origin/develop  
`
- Coordinate with the team when editing critical files (AppRouter, DIContainer, Core modules)

---

## 10) Communication

- Use the team’s communication channel (Discord/WhatsApp)
- When opening a PR:
  - Explain **what** changed and **why**
  - Request a review
- Use Issue templates for bug reports, features, UI/UX, performance, etc.
- Maintain respectful and clear communication  
  (see [Code of Conduct](./CODE_OF_CONDUCT.md))

---

## 11) Security Policy

Do not report vulnerabilities publicly.  
See [SECURITY.md](./SECURITY.md) for private disclosure instructions.

---

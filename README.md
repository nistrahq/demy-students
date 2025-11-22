# Demy Students – iOS App (Swift + SwiftUI + MVVM + Clean Architecture)

This repository contains the **iOS mobile application** of the **DemyStudents** project, developed using **Swift**, **SwiftUI**, **MVVM**, and **Clean Architecture**, following a **feature-based modular folder structure**.

The goal of this app is to provide a seamless and modern experience for **students**, aligned with the backend services and academic requirements of the project.

---

## Features  

- **SwiftUI-first UI** (modern, declarative, reactive)
- **MVVM + Clean Architecture**
- **Feature-based folder structure**
- **Secure session handling** with Keychain
- **Networking layer with URLSession + async/await**
- **Dependency Injection** using a custom DIContainer
- **Internationalization (i18n)** ready
- **Accessibility (a11y)** aligned with WCAG standards
- 100% **Swift**, no storyboards & no UIKit (unless needed)

---

## Architecture – MVVM + Clean Architecture + Feature-Based

The codebase is structured to separate concerns clearly:

- **Presentation Layer** → SwiftUI Views + ViewModels  
- **Domain Layer** → Entities + UseCases  
- **Data Layer** → Repositories + Remote/Local DataSources  

Combined with **feature-based modules**, the structure follows:

`  
DemyStudents/  
├─ App/                          # Application entry point  
│   ├─ Config/                   # Environments, constants  
│   ├─ DI/                       # DIContainer  
│   ├─ Navigation/               # AppRouter, Navigation flows  
│   └─ Session/                  # SessionManager, auth state  
│  
├─ Core/  
│   ├─ Network/                  # HTTPClient, ApiEndpoints  
│   ├─ Storage/                  # KeychainStorage  
│   └─ Utils/                    # Helpers, extensions  
│  
└─ Features/  
    ├─ Auth/                     # Authentication flow  
    │   ├─ Data/  
    │   ├─ Domain/  
    │   └─ Presentation/  
    ├─ Home/                     # Home screen for students  
    ├─ Profile/                  # Student profile  
    └─ ...  
`

This structure supports:
- High modularity  
- Easy scaling as new features are added  
- Clean separation of responsibilities  
- Testability and maintainability

---

## Installation / Setup  

### Prerequisites
- **Xcode (latest stable)**  
- **iOS SDK 17+**  
- Swift 5.9+ recommended  

### Run locally

`  
# Clone repository  
git clone https://github.com/<org>/<repo>.git  
cd <repo>  

# Open project  
open DemyStudents.xcodeproj  
`

### Swift Packages  
Dependencies will automatically resolve on project open.

---

## Project structure reference

- `App/` → app lifecycle, DI, navigation, session, config  
- `Features/` → feature-based modules (Auth, Home, Profile…)  
- `Core/` → shared logic (Network, Keychain, Utilities)  
- `docs/` → extended documentation (architecture, diagrams, API notes)  
- `CONTRIBUTING.md` → rules for contributions  
- `CODE_OF_CONDUCT.md` → expected behavior within the team  
- `SECURITY.md` → how to report vulnerabilities  
- `AUTHORS.md` → collaborators

---

## Contributing

We collaborate using **GitHub Issues** and **Pull Requests**.  
Use the templates provided for:

- Bug reports  
- Feature requests  
- UI/UX issues  
- Performance issues  
- Refactors / technical debt  
- Documentation  
- General issues  

Please read [CONTRIBUTING.md](./CONTRIBUTING.md) before submitting changes.  
Also review the [Code of Conduct](./CODE_OF_CONDUCT.md).

---

## Issue Templates

Located in [`/.github/ISSUE_TEMPLATE/`](./.github/ISSUE_TEMPLATE/):

- Bug Report  
- Feature Request  
- UI/UX Issue  
- Performance Issue  
- Refactor / Technical Debt  
- Documentation  
- Generic Issue  

---

## Extended Documentation

Available in the [`docs/`](./docs/) folder:

- **Architecture** → MVVM layers, feature organization, DI, navigation  
- **Guides** → How to set up the environment, Git workflow, testing  
- **Design** → UI/UX rules, color system, spacing, accessibility  
- **API** → Endpoint specs, data models, backend integration  
- **References** → Articles, research, official docs  

---

## Security

Found a vulnerability?  
Please refer to [SECURITY.md](./SECURITY.md).  
**Never disclose security issues publicly**.

---

## Authors

Full list in [AUTHORS.md](./AUTHORS.md).

---

## Project Status

This is an **academic and private project**, developed by the Software Engineering team (UPC).  
External contributions are **not accepted**.


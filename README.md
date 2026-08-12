# Demy Students

[English](./README.md) | [Español](./README.es.md)

The native iOS application for students using **Demy**. It provides a clear daily view of academy activity, upcoming classes, personal information, and account settings through a SwiftUI experience connected to the Demy API.

## Student capabilities

- Secure sign-in and session persistence through Keychain.
- Personalized home with today's classes and academy updates.
- Full class schedule with session details.
- Student profile and localized birthdate formatting.
- Password, language, privacy, terms, and session settings.
- English and Latin American Spanish localization across Home, Profile, and Settings.

## Product preview

<table>
  <tr>
    <td><img src="./docs/screenshots/home.png" alt="Demy Students home" /></td>
    <td><img src="./docs/screenshots/schedule.png" alt="Student schedule" /></td>
  </tr>
  <tr>
    <td><img src="./docs/screenshots/profile.png" alt="Student profile" /></td>
    <td><img src="./docs/screenshots/configuration.png" alt="Student settings" /></td>
  </tr>
</table>

## Technology and architecture

- Swift and SwiftUI with an application-specific design system.
- MVVM and Clean Architecture organized by feature.
- Async/await networking through URLSession.
- Repository and use-case abstractions with dependency injection.
- Keychain-backed session storage.
- String Catalog localization (`en` and `es-419`).

```text
DemyStudents/
├── App/            # Lifecycle, configuration, navigation, DI, and session
├── Core/           # Networking, storage, and shared utilities
├── Features/       # Auth, Home, Schedules, Profile, and Settings
├── Resources/      # Localized String Catalogs
└── Shared/         # Design system and reusable UI
```

## Run locally

### Requirements

- macOS with Xcode
- iOS 17+ simulator or device
- Demy API reachable from the selected target

```bash
open DemyStudents.xcodeproj
```

The API base URL is defined in `DemyStudents/App/Config/Environment.swift`. Swift Package dependencies resolve when the project opens.

## Command-line verification

```bash
xcodebuild \
  -project DemyStudents.xcodeproj \
  -scheme DemyStudents \
  -configuration Debug \
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 17 Pro' \
  CODE_SIGNING_ALLOWED=NO build
```

## Demy ecosystem

- [Landing page](https://github.com/nistrahq/demy-landing)
- [Backend API](https://github.com/nistrahq/demy-api)
- [Administrator app](https://github.com/nistrahq/demy-admins)
- [Teacher app](https://github.com/nistrahq/demy-teachers)

See [CONTRIBUTING.md](./CONTRIBUTING.md) for contribution and Git conventions.

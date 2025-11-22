# Security Policy

Available languages:
- [English](SECURITY.md)
- [Spanish](SECURITY.es.md)

## Supported Versions
This project is **academic and private**, developed for the DemyStudents iOS application.  
Security updates apply only to the **active development branch** (`develop`) and the **latest stable release** (`main`).  
Older versions or tags are **not maintained**.

---

## Reporting a Vulnerability
Please **do not disclose vulnerabilities publicly** in Issues or Pull Requests.

Instead, report them privately to the maintainers:

- Contact: <contact.demyteam@gmail.com>
- Or via the private channel provided in our team Discord.

When reporting, please include:
- A clear description of the issue and its potential impact.
- Steps to reproduce (screenshots, recordings, or test accounts).
- Any logs, crash reports, console output, or stacktraces  
  (**shared privately**, never posted publicly).
- Suggested mitigation or fix (if known).

We will acknowledge your report within **48 hours** and aim to provide an initial assessment within **5 working days**.

---

## Scope
This policy applies to the **iOS application** and all related components, including:

- Swift / SwiftUI codebase (feature-based architecture)
- MVVM and Clean Architecture layers (Data, Domain, Presentation)
- Core modules (Networking, Storage/Keychain, DIContainer, AppRouter)
- Sensitive configurations (API endpoints, Keychain operations)
- Data handling, authentication flow, and session management

This policy does **not** apply to:
- Third-party SPM dependencies (report these to their maintainers)
- Local simulator/device issues unrelated to the app logic
- Academic or course-related feedback (should be handled through the academic platform)

---

## Responsible Disclosure
By following this policy, you help us address security concerns responsibly.  
We will credit contributors in **internal documentation**, but no public disclosure will be made without team approval.

**Note:**  
This repository is an **academic and private project**. External contributions are not accepted.

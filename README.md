<div align="center">

<img src=".github/assets/httpcat_logo.svg" alt="HTTP Cats" width="160" />

# HTTP Cats App

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Bloc](https://img.shields.io/badge/Bloc-4A90E2?style=for-the-badge&logo=bloc&logoColor=white)](https://bloclibrary.dev)
[![GoRouter](https://img.shields.io/badge/go__router-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://pub.dev/packages/go_router)
[![Drift](https://img.shields.io/badge/Drift-4CAF50?style=for-the-badge&logo=sqlite&logoColor=white)](https://drift.simonbinder.eu)
[![Freezed](https://img.shields.io/badge/Freezed-00695C?style=for-the-badge)](https://pub.dev/packages/freezed)
[![fpdart](https://img.shields.io/badge/fpdart-FF6F00?style=for-the-badge)](https://pub.dev/packages/fpdart)
[![HTTP Cats API](https://img.shields.io/badge/HTTP%20Cats%20API-d0383e?style=for-the-badge)](https://http.cat)

[![About](https://readme-typing-svg.demolab.com/?font=Helvetica&size=13&duration=1&pause=100000&color=D0383E&background=00000000&center=false&vCenter=true&repeat=false&width=38&height=17&lines=About)](#about) [![Architecture](https://readme-typing-svg.demolab.com/?font=Helvetica&size=13&duration=1&pause=100000&color=D0383E&background=00000000&center=false&vCenter=true&repeat=false&width=84&height=17&lines=Architecture)](#architecture)  [![Tech stack](https://readme-typing-svg.demolab.com/?font=Helvetica&size=13&duration=1&pause=100000&color=D0383E&background=00000000&center=false&vCenter=true&repeat=false&width=71&height=17&lines=Tech+stack)](#tech-stack)  [![Getting started](https://readme-typing-svg.demolab.com/?font=Helvetica&size=13&duration=1&pause=100000&color=D0383E&background=00000000&center=false&vCenter=true&repeat=false&width=104&height=17&lines=Getting+started)](#getting-started)  [![Available commands](https://readme-typing-svg.demolab.com/?font=Helvetica&size=13&duration=1&pause=100000&color=D0383E&background=00000000&center=false&vCenter=true&repeat=false&width=125&height=17&lines=Available+commands)](#available-commands)  [![Conventions](https://readme-typing-svg.demolab.com/?font=Helvetica&size=13&duration=1&pause=100000&color=D0383E&background=00000000&center=false&vCenter=true&repeat=false&width=78&height=17&lines=Conventions)](#conventions)  [![Credits](https://readme-typing-svg.demolab.com/?font=Helvetica&size=13&duration=1&pause=100000&color=D0383E&background=00000000&center=false&vCenter=true&repeat=false&width=51&height=17&lines=Credits)](#credits)  [![License](https://readme-typing-svg.demolab.com/?font=Helvetica&size=13&duration=1&pause=100000&color=D0383E&background=00000000&center=false&vCenter=true&repeat=false&width=51&height=17&lines=License)](#license)

</div>

---

<a id="about"></a>
## About

HTTP Cats App is a Flutter application for browsing the full catalog of HTTP status codes, each illustrated with an image from [http.cat](https://http.cat), with search, category filtering, favorites, and full offline support via local caching.

<a id="architecture"></a>
## Architecture

The app follows a Clean Architecture-style separation, organized feature-first:

```
lib/features/<feature>/
├── presentation/   → widgets, pages, Blocs/Cubits — the only layer that imports Flutter
├── domain/         → entities, Failure types, repository interfaces, use cases — pure Dart
└── data/           → repository implementations, local/remote data sources, Drift schema
```

The dependency rule is strict: `domain/` never imports `presentation/`, `data/`, `flutter/`, or any infrastructure package. `data/` implements the abstract contracts defined in `domain/`; `presentation/` depends only on `domain/`. This is what makes the domain layer testable in complete isolation, with fakes standing in for real repositories.

<a id="tech-stack"></a>
## Tech stack

| Concern | Chosen | Rejected alternatives | Why |
|---|---|---|---|
| State management | [flutter_bloc](https://pub.dev/packages/flutter_bloc) [bloc](https://pub.dev/packages/bloc) | Riverpod, GetX, plain `Provider` | Explicit event→state contract, unit-testable in isolation via `bloc_test`, scales predictably as features grow. |
| Routing | [go_router](https://pub.dev/packages/go_router) | `auto_route`, raw `Navigator 2.0` | Declarative, first-party, deep linking, `ShellRoute` for persistent nav, integrates with Bloc streams for redirects. |
| Local persistence | [drift](https://pub.dev/packages/drift) | `isar`, `hive`, `objectbox` | SQL-backed, actively maintained, type-safe, reactive by default. |
| Functional error handling | [fpdart](https://pub.dev/packages/fpdart) (`Either<Failure, T>`) | `dartz` | Actively maintained equivalent with the same core primitives. |
| Immutability / data classes | [freezed](https://pub.dev/packages/freezed) [json_serializable](https://pub.dev/packages/json_serializable) | Manual classes, `built_value` | Immutability, union types, `copyWith` generation. |
| Image loading & cache | [cached_network_image](https://pub.dev/packages/cached_network_image) | Manual `Image.network` + custom cache | Battle-tested disk+memory caching, configurable TTL. |
| Loading placeholders | [shimmer](https://pub.dev/packages/shimmer) | `skeletonizer`, `auto_skeleton` | Manual placeholder layouts, kept explicit and reviewable. |
| Connectivity detection | [connectivity_plus](https://pub.dev/packages/connectivity_plus) | Manual `Socket` probing | Standard, covers Wi-Fi/mobile/none across platforms. |
| Networking (optional remote sync) | [dio](https://pub.dev/packages/dio) | `http` | Interceptors for logging/retry, only pulled in if remote sync is implemented. |
| Dependency injection | [get_it](https://pub.dev/packages/get_it) [injectable](https://pub.dev/packages/injectable) | Riverpod-as-DI | Single generated `configureDependencies()` entry point. |
| Testing — mocks | [mocktail](https://pub.dev/packages/mocktail) | `mockito` | No code generation required. |
| Testing — integration | [patrol](https://pub.dev/packages/patrol) | `integration_test` alone | Native selectors, better flakiness handling. |
| Lints | [very_good_analysis](https://pub.dev/packages/very_good_analysis) | `flutter_lints` (default) | Stricter ruleset. |
| App icons / splash | [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) [flutter_native_splash](https://pub.dev/packages/flutter_native_splash) | Manual per-platform assets | Standard tooling; icon reuses http.cat's own mark. |

<a id="getting-started"></a>
## Getting started

### 1. Install the Flutter SDK

**Linux / macOS**

```bash
git clone https://github.com/flutter/flutter.git -b stable ~/development/flutter
export PATH="$PATH:$HOME/development/flutter/bin"   # add this line to your shell config
source ~/.bashrc                                     # or ~/.zshrc, or restart your terminal
```

**Windows**

1. Download the [Flutter SDK zip](https://docs.flutter.dev/get-started/install/windows) and extract it to a path without spaces, e.g. `C:\development\flutter`.
2. Add `C:\development\flutter\bin` to your `Path` environment variable.
3. Open a new terminal window.

### 2. Verify the installation

```bash
flutter doctor
```

Resolve anything it flags — Android toolchain, Xcode (macOS only), a connected device/emulator.

### 3. Clone and set up the project

```bash
git clone https://github.com/<your-username>/http_cats_app.git
cd http_cats_app
make setup   # flutter pub get + code generation
```

### 4. Run the app

```bash
make run   # flutter run
```

<a id="available-commands"></a>
## Available commands

| Command | Description |
|---|---|
| `make setup` | Fetch dependencies and run code generation |
| `make generate` | Run `build_runner` (freezed, json_serializable, injectable, drift) |
| `make format` | Check formatting |
| `make analyze` | Static analysis, regenerating code first |
| `make test` | Run the full test suite with coverage, regenerating code first |
| `make build-apk` | Build a release APK |
| `make build-ios` | Build an unsigned release iOS build |
| `make run` | Run the app on a connected device/emulator |

<a id="conventions"></a>
## Conventions

- All code, identifiers, strings, commit messages, PR titles, and docs in English.
- No inline comments except where logic is genuinely non-obvious — explain *why*, never *what*.
- `dart format` and `flutter analyze` must pass with zero warnings before any PR merges.
- **Git flow**: `main` (production, tagged releases only) ← `develop` (integration) ← `feature/<slug>` / `release/<version>` / `hotfix/<slug>`.
- **Commits**: `type(scope): short description`, imperative mood, no trailing period. Types: `feat`, `fix`, `refactor`, `test`, `chore`, `docs`, `perf`. Enforced via `commitlint`.

<a id="credits"></a>
## Credits

The theme, cat images, and the underlying API concept are from [http.cat](https://http.cat) ([github.com/httpcats/http.cat](https://github.com/httpcats/http.cat)) — this is an unofficial companion app built on top of that project, not an official product.

<a id="license"></a>
## License

MIT — see [LICENSE.md](./LICENSE.md).
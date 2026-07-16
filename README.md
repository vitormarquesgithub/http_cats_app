<div align="center">

# HTTP Cats App

A Flutter app built on top of the [http.cat](https://http.cat) status image catalog.

Browse, search, and favorite HTTP status codes — illustrated by cats — with full offline support.

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Bloc](https://img.shields.io/badge/Bloc-4A90E2?style=for-the-badge&logo=bloc&logoColor=white)](https://bloclibrary.dev)
[![GoRouter](https://img.shields.io/badge/go__router-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://pub.dev/packages/go_router)
[![Drift](https://img.shields.io/badge/Drift-4CAF50?style=for-the-badge&logo=sqlite&logoColor=white)](https://drift.simonbinder.eu)
[![Freezed](https://img.shields.io/badge/Freezed-00695C?style=for-the-badge)](https://pub.dev/packages/freezed)
[![fpdart](https://img.shields.io/badge/fpdart-FF6F00?style=for-the-badge)](https://pub.dev/packages/fpdart)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](#license)

</div>

---

## About

HTTP Cats App is a Flutter application for browsing the full catalog of HTTP status codes, each illustrated with an image from [http.cat](https://http.cat), with search, category filtering, favorites, and full offline support via local caching.

## Architecture

The app follows a Clean Architecture-style separation, organized feature-first:

```
lib/features/<feature>/
├── presentation/   → widgets, pages, Blocs/Cubits — the only layer that imports Flutter
├── domain/         → entities, Failure types, repository interfaces, use cases — pure Dart
└── data/           → repository implementations, local/remote data sources, Drift schema
```

The dependency rule is strict: `domain/` never imports `presentation/`, `data/`, `flutter/`, or any infrastructure package. `data/` implements the abstract contracts defined in `domain/`; `presentation/` depends only on `domain/`. This is what makes the domain layer testable in complete isolation, with fakes standing in for real repositories.

## Stack

| Concern | Chosen | Rejected alternatives | Why |
|---|---|---|---|
| State management | `flutter_bloc` / `bloc` | Riverpod, GetX, plain `Provider` | Explicit event→state contract, unit-testable in isolation via `bloc_test`, scales predictably as features grow. |
| Routing | `go_router` | `auto_route`, raw `Navigator 2.0` | Declarative, first-party, deep linking, `ShellRoute` for persistent nav, integrates with Bloc streams for redirects. |
| Local persistence | `drift` | `isar`, `hive`, `objectbox` | SQL-backed, actively maintained, type-safe, reactive by default. |
| Functional error handling | `fpdart` (`Either<Failure, T>`) | `dartz` | Actively maintained equivalent with the same core primitives. |
| Immutability / data classes | `freezed` + `json_serializable` | Manual classes, `built_value` | Immutability, union types, `copyWith` generation. |
| Image loading & cache | `cached_network_image` | Manual `Image.network` + custom cache | Battle-tested disk+memory caching, configurable TTL. |
| Loading placeholders | `shimmer` | `skeletonizer`, `auto_skeleton` | Manual placeholder layouts, kept explicit and reviewable. |
| Connectivity detection | `connectivity_plus` | Manual `Socket` probing | Standard, covers Wi-Fi/mobile/none across platforms. |
| Networking (optional remote sync) | `dio` | `http` | Interceptors for logging/retry, only pulled in if remote sync is implemented. |
| Dependency injection | `get_it` + `injectable` | Riverpod-as-DI | Single generated `configureDependencies()` entry point. |
| Testing — mocks | `mocktail` | `mockito` | No code generation required. |
| Testing — integration | `patrol` | `integration_test` alone | Native selectors, better flakiness handling. |
| Lints | `very_good_analysis` | `flutter_lints` (default) | Stricter ruleset. |
| App icons / splash | `flutter_launcher_icons`, `flutter_native_splash` | Manual per-platform assets | Standard tooling; icon reuses http.cat's own mark. |

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
flutter run
```

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

## Conventions

- All code, identifiers, strings, commit messages, PR titles, and docs in English.
- No inline comments except where logic is genuinely non-obvious — explain *why*, never *what*.
- `dart format` and `flutter analyze` must pass with zero warnings before any PR merges.
- **Git flow**: `main` (production, tagged releases only) ← `develop` (integration) ← `feature/<slug>` / `release/<version>` / `hotfix/<slug>`.
- **Commits**: `type(scope): short description`, imperative mood, no trailing period. Types: `feat`, `fix`, `refactor`, `test`, `chore`, `docs`, `perf`. Enforced via `commitlint`.

## Credits

Status images and color palette from [http.cat](https://http.cat) — this is an unofficial companion app, not an official product.

## License

MIT — see [LICENSE](./LICENSE).
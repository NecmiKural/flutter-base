
# 🚀 Getting Started - Custom Flutter App Template

Welcome to **Custom Flutter App Template** – a modern Flutter starter project built with a scalable architecture and designed for real-world apps.

This template follows **Clean Architecture**, utilizes **Riverpod 3** (via `hooks_riverpod`) for state management, integrates **Keycloak authentication via AppAuth**, and supports **Flutter's native localization system**.

---

## 📌 Key Features

✅ **Clean Architecture**  
- Follows domain-driven design principles.  
- Separates concerns into domain, data, and presentation layers.  

✅ **Authentication**  
- Keycloak integration using AppAuth.  
- Secure sign-in and token management.  

✅ **Localization**  
- Uses Flutter’s built-in `intl` and `flutter_localizations`.  
- Centralized `l10n.yaml` and `arb` files for easy language management.  

✅ **State Management with Riverpod 3**  
- Scalable, modular, and reactive state handling via `hooks_riverpod`.  

✅ **Persistent Storage**  
- Local storage using Hive.  
- Integrated with Freezed models for type safety and serialization.  

✅ **Freezed for Models**  
- Powerful code generation for model classes.  
- Works seamlessly with Hive for persistent, versioned models.  

✅ **Reusable UI Components**  
- Buttons, input fields, dialogs, and toast notifications.  

✅ **Routing**  
- Declarative navigation using GoRouter.  

✅ **Custom Utilities**  
- Useful extensions for `BuildContext`, media queries, snackbars, etc.  
- Mixins for forms, state management, and more.  

---

## 🛠 Requirements

Before getting started, ensure you have the following installed:

- **Flutter SDK**: `3.27+` (tested on `3.44`)  
- **Dart SDK**: `3.7+` (included with Flutter)  
- **Keycloak Server**: For authentication (self-hosted or managed)  

---

## 🚀 Installation & Setup

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/NecmiKural/flutter-base.git
cd flutter-base
```

### 2️⃣ Install Dependencies
```bash
flutter pub get
```

### 3️⃣ Setup Keycloak & AppAuth

1. Deploy or configure your Keycloak server.  
2. Create a client with `openid-connect` type.  
3. Configure redirect URI and credentials.  
4. Add Keycloak URLs and credentials to your environment config.  

### 4️⃣ Run the Project
```bash
flutter run
```

---

## 📂 Folder Structure

```
lib/
 ├── main.dart                  # Entry point
 │
 ├── app/                       # App-level wiring
 │   ├── app.dart               # Root MaterialApp.router widget
 │   ├── app_bootstrap.dart     # Async init (Hive, secure storage, ...)
 │   └── init/                  # System chrome, localization, core init
 │
 ├── core/                      # Cross-cutting concerns (framework-agnostic)
 │   ├── config/                # Environment & app config
 │   ├── constants/
 │   ├── errors/                # Exceptions & error handling
 │   ├── extensions/
 │   ├── logging/
 │   ├── network/               # Dio client & interceptors
 │   ├── resources/             # UseCase base class, etc.
 │   ├── services/              # Localization, toast, ... services
 │   ├── storage/               # Hive & secure storage
 │   └── utils/                 # Mixins, validators, workers, helpers
 │
 ├── features/                  # Feature modules (Clean Architecture)
 │   └── auth/
 │       ├── data/              # Models, repositories, services (AppAuth/Keycloak)
 │       ├── domain/            # Entities, repository contracts, use cases
 │       └── presentation/      # Pages, widgets, providers
 │
 ├── presentation/              # Shared UI layer
 │   ├── router/                # GoRouter configuration & routes
 │   ├── theme/                 # Theme, colors, text styles, widget themes
 │   ├── mixins/
 │   └── widgets/               # Reusable widgets (buttons, dialogs, fields, ...)
 │
 ├── l10n/                      # Source .arb translation files
 └── src/generated/             # Generated localization output
```

---

## 📦 Dependencies Used

| Package | Description |
|--------|-------------|
| **Authentication** | |
| `flutter_appauth` | OAuth2/OIDC authentication with Keycloak |
| `flutter_secure_storage` | Secure token storage |
| **Networking** | |
| `dio` | HTTP client with interceptors |
| `connectivity_plus` | Network connectivity status |
| **Local Storage** | |
| `hive_flutter` | Lightweight local database |
| **Modeling & Serialization** | |
| `freezed`, `json_serializable`, `build_runner` | Type-safe, immutable models & codegen |
| **State Management** | |
| `hooks_riverpod` (Riverpod 3) | Scalable, reactive state management |
| **Localization** | |
| `flutter_localizations`, `intl`, `easy_localization` | Localization support |
| **Routing** | |
| `go_router` | Declarative navigation |
| **UI Utilities** | |
| `toastification` | Toast messages |
| `skeletonizer` | Loading placeholders |
| `google_fonts` | Font integration |
| `lottie` | Animations |
| `cached_network_image`, `flutter_svg` | Image rendering |
| `adaptive_theme`, `responsive_framework` | Theming & responsiveness |

---

## 🎯 Next Steps

✅ Explore and understand the **Clean Architecture** structure  
✅ Replace sample features with your own modules  
✅ Set up and secure your **Keycloak backend**  
✅ Add more languages with `.arb` files under `lib/l10n`  
✅ Build awesome features on top of this solid base 🎯  

Happy Coding! 🚀


# 🚀 Getting Started - Custom Flutter App Template

Welcome to **Custom Flutter App Template** – a modern Flutter starter project built with a scalable architecture and designed for real-world apps.

This template follows **Clean Architecture**, utilizes **Riverpod** for state management, integrates **Keycloak authentication via AppAuth**, and supports **Flutter's native localization system**.

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

✅ **State Management with Riverpod**  
- Scalable, modular, and reactive state handling.  

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

- **Flutter SDK**: `3.7.2+`  
- **Dart SDK**: Included with Flutter  
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
 ├── core/                  
 │   ├── constants/         
 │   ├── extensions/        
 │   ├── logger/            
 │   ├── utils/             
 │   ├── widgets/           
 │
 ├── config/                
 │   ├── localization/      # intl, arb files, delegates, etc.
 │   ├── routes/            
 │   ├── theme/             
 │
 ├── features/auth/         
 │   ├── data/              
 │   │   ├── models/        
 │   │   ├── repositories/  
 │   │   ├── services/      # AppAuthService for Keycloak
 │   ├── domain/            
 │   ├── presentation/      
 │
 ├── features/...           # Other feature modules
 │
 ├── product/               
 │   ├── init/              
 │   ├── mixins/            
 │   ├── utility/           
 │   ├── widgets/           
 │       ├── buttons/       
 │       ├── dialogs/       
 │       ├── forms/         
 │       ├── toast.dart     
 │       ├── loading_indicator.dart 
```

---

## 📦 Dependencies Used

| Package | Description |
|--------|-------------|
| **Authentication** | |
| `app_auth` | OAuth2/OIDC authentication with Keycloak |
| **Local Storage** | |
| `hive`, `hive_flutter` | Lightweight local database |
| **Modeling & Serialization** | |
| `freezed`, `json_serializable`, `hive_generator`, `build_runner` | Type-safe models with Hive integration |
| **State Management** | |
| `flutter_riverpod` | Scalable state management |
| **Localization** | |
| `flutter_localizations`, `intl` | Flutter native localization |
| **Routing** | |
| `go_router` | Declarative navigation |
| **UI Utilities** | |
| `toastification` | Toast messages |
| `skeletonizer` | Loading placeholders |
| `google_fonts` | Font integration |
| `lottie` | Animations |

---

## 🎯 Next Steps

✅ Explore and understand the **Clean Architecture** structure  
✅ Replace sample features with your own modules  
✅ Set up and secure your **Keycloak backend**  
✅ Add more languages with `.arb` files under `lib/config/localization`  
✅ Build awesome features on top of this solid base 🎯  

Happy Coding! 🚀

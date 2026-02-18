# Merchant Product Management App (Flutter)

A production-ready Flutter application for managing merchant products with offline-first capabilities, built as part of a Senior Mobile Engineer take-home test.

---

## 📌 Project Notes

- Flutter version: **3.41.1**
- Mock backend: **json-server v0.17**
- Architecture: **Clean Architecture + Feature-First**
- Conflict resolution strategy: **Last Write Wins**

---

## 🏗️ Architecture

This project follows Clean Architecture combined with a Feature-First structure to ensure scalability, maintainability, and testability.

### Layers

**Presentation**
- UI (Pages, Widgets)
- State management using Bloc

**Domain**
- Entities
- Use cases
- Repository interfaces

**Data**
- Repository implementations
- Remote data sources (API)
- Local data sources (Drift database)
- DTOs and mappers

### Feature-First Structure

```
lib/
 ├── core/
 ├── features/
 │    ├── product/
 │    │    ├── presentation/
 │    │    ├── domain/
 │    │    └── data/
```

---

## 📦 State Management

- flutter_bloc
- bloc_concurrency
- hooked_bloc
- flutter_hooks

Chosen for predictable state transitions and scalability.

---

## 🌐 Offline-First Strategy

The application is designed to function fully offline.

### Local Persistence

- Uses Drift (SQLite) for local storage
- All create/update operations are written to local storage first
- To simplify, each record maintains a sync boolean (true/false)

---

## 🔄 Sync Strategy

### Behavior While Offline

- Users can create and edit products offline
- Changes are saved locally and marked as false sync
- No network calls are attempted while offline

### Retry Strategy (Connectivity-Based)

This app uses retry on connectivity restoration.

When network connectivity is restored:

1. Detect connectivity change using `connectivity_plus`
2. Automatically trigger synchronization
3. Push pending local changes to the server
4. Pull latest server data if needed

---

## ⚠️ Conflict Handling

If a conflict occurs (HTTP 409):

- Strategy: Last Write Wins
- The most recent update (based on timestamp) overwrites previous data

---

## 🔌 Connectivity Handling

- Uses `connectivity_plus` to monitor network status
- Sync is automatically triggered when connection is restored
- Sync can also run on app start

---

## 📡 Networking

- HTTP client: Dio
- Logging: talker_dio_logger
- Functional error handling: fpdart

---

## 📚 Code Generation

- freezed_annotation
- json_annotation

Used for immutable models and JSON serialization.

---

## 🎨 UI & Utilities

- forui + forui_hooks
- skeletonizer for loading placeholders

---

## 📦 Dependencies

```yaml
freezed_annotation: ^3.1.0
json_annotation: ^4.10.0
skeletonizer: ^2.1.3
dio: ^5.9.1
fpdart: ^1.2.0
forui: ^0.18.1
flutter_bloc: ^9.1.1
flutter_hooks: ^0.21.3+1
hooked_bloc: ^1.7.0
get_it: ^9.2.0
talker_dio_logger: ^5.1.13
bloc_concurrency: ^0.3.0
forui_hooks: ^0.18.0
drift: ^2.31.0
drift_flutter: ^0.2.8
connectivity_plus: ^7.0.0
```

---

## 🚀 Running the Project

### 1. Start Mock Backend

To allow Android emulator or physical devices to access the local server, run JSON Server with host `0.0.0.0`.

```bash
npm install -g json-server@0.17
json-server --watch db.json --host 0.0.0.0 --port 3000
```

Backend will be available at:

```
http://0.0.0.0:3000
```

---

### 📱 Access from Android Emulator

Use:

```
http://10.0.2.2:3000
```

---

### 📱 Access from Physical Device

Use your machine's local IP address:

```
http://YOUR_LOCAL_IP:3000
```

Ensure both devices are on the same network.

---

### 2. Run Flutter App

```bash
flutter pub get
flutter run
```

---

## 📱 Core Features Implemented

- Product list with pagination / infinite scroll
- Product detail view
- Create and edit product
- Offline support
- Automatic sync on reconnect
- Loading, error, and offline states

---

## ⚖️ Trade-offs & Decisions

- Drift chosen over Hive for relational queries and robustness
- Bloc for explicit state handling
- Connectivity-based retry to optimize offline behavior
- Last Write Wins simplifies conflict resolution but may overwrite changes

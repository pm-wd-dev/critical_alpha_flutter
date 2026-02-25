# Critical Alpha — Flutter Application

A comprehensive goal tracking and learning platform built with Flutter, targeting iOS and Android. The app connects to a Node.js/React Native compatible backend and provides goal management, assessment tracking, audio learning, and subscription management.

---

## Features

- **Authentication** — Login, signup, password recovery with OTP/email verification
- **Dashboard** — Personal statistics, recent goals, upcoming assessments, weekly progress chart
- **Goals & Plans** — Create and manage plans containing individual goals; track status and progress
- **Assessments** — Complete assessments tied to plans; view submission history
- **Results & Analytics** — Line and radar charts for assessment trends and skill breakdowns
- **Audio Learning** — Educational audio player with categories, playlists, and soft-skills courses
- **Premium Subscriptions** — In-app purchase integration for unlocking premium features
- **Profile Management** — Update name, email, password, and avatar

---

## Project Structure

```
critical_alpha_flutter/
├── .env                           # Environment variables (BASE_URL, S3_URL, API_TIMEOUT)
├── pubspec.yaml
├── assets/
│   ├── fonts/                     # Poppins .otf font files (weights 300–900)
│   ├── icons/                     # SVG icons & app icon
│   ├── images/                    # PNG/JPG images
│   └── animations/                # Lottie JSON animation files
└── lib/
    ├── main.dart                  # App entry point; initialises env, prefs, ApiClient
    ├── routes/
    │   ├── app_router.dart        # GoRouter config with auth redirects & ShellRoute
    │   └── route_constants.dart   # Route path & name constants
    ├── core/
    │   ├── constants/
    │   │   ├── app_constants.dart # App-wide constants, storage keys, timeouts, spacing
    │   │   ├── app_colors.dart    # Centralised color palette
    │   │   └── app_assets.dart    # Asset path constants
    │   ├── errors/
    │   │   └── failures.dart      # AppException hierarchy + Result<T> wrapper
    │   ├── network/
    │   │   ├── api_client.dart    # Singleton Dio client with 5 interceptors
    │   │   └── api_endpoints.dart # All API endpoint strings and URL helpers
    │   ├── providers/
    │   │   └── shared_preferences_provider.dart
    │   ├── theme/
    │   │   └── app_theme.dart     # Material 3 light theme (full component coverage)
    │   ├── utils/
    │   │   ├── extensions.dart    # String & BuildContext extensions
    │   │   └── validators.dart    # Email, password, name, URL validators
    │   └── widgets/
    │       ├── bottom_navigation.dart
    │       ├── custom_button.dart
    │       ├── custom_drawer.dart
    │       ├── custom_floating_bottom_nav.dart
    │       ├── custom_input.dart
    │       ├── custom_text_field.dart
    │       ├── error_widget.dart
    │       └── loading_widget.dart
    └── features/
        ├── splash/
        │   └── pages/splash_page.dart
        ├── auth/
        │   ├── controllers/       # AuthController (StateNotifier) + Freezed state
        │   ├── models/            # UserModel, AuthResponse, request/response DTOs
        │   ├── pages/             # Login, Signup, ForgotPassword, CodeVerification, NewPassword
        │   ├── repositories/      # AuthRepository — API calls + SharedPreferences storage
        │   └── widgets/           # AuthHeader, SocialLoginButtons
        ├── home/
        │   ├── controllers/       # HomeController + DashboardController
        │   ├── models/            # DashboardStats, InsightModel, WeeklyProgressData, QuickActionModel
        │   ├── pages/             # HomePage
        │   └── widgets/           # StatsCard, InsightsSection, QuickActionsSection, etc.
        ├── goals/
        │   ├── controllers/       # GoalsController, PlansController
        │   ├── models/            # GoalModel, PlanModel
        │   └── pages/             # PlansPage, CreatePlanPage, AddGoalPage, AssessmentPage
        ├── plans/
        │   ├── models/            # PlanModel (plan detail view)
        │   ├── pages/             # PlanDetailPage
        │   ├── providers/         # plan_providers.dart
        │   ├── services/          # PlanService
        │   └── widgets/           # AssessmentStatusWidget, PlanResultsChart
        ├── assessment/
        │   ├── models/            # AssessmentModel
        │   └── pages/             # AssessmentPage (plan-scoped), AssessmentCompletePage
        ├── results/
        │   ├── controllers/       # ResultsController
        │   ├── models/            # AssessmentResultModel, ChartDataModel
        │   ├── pages/             # ResultsScreen, ResultLineChartPage, ResultRadarChartPage
        │   ├── providers/         # results_provider.dart
        │   ├── services/          # ResultsApiService
        │   └── widgets/           # AssessmentDropdown, AssessmentLineChart
        ├── audio/
        │   ├── controllers/       # AudioController
        │   ├── models/            # AudioModel
        │   └── pages/             # AudioSectionPage, MusicPlayerPage, SoftSkillPage
        ├── profile/
        │   ├── pages/             # ProfilePage, ChangeName/Email/Password/PicturePage
        │   └── services/          # ProfileService
        ├── purchase/
        │   ├── controllers/       # PurchaseController
        │   ├── models/            # PurchaseModel
        │   └── pages/             # PurchasePage
        └── settings/
            └── pages/             # SettingsPage
```

---

## Architecture

The app uses a **feature-first, layered architecture** inspired by Clean Architecture principles:

```
Presentation  →  Controllers (StateNotifier)  →  Repositories / Services  →  ApiClient (Dio)
     ↕                    ↕
   Pages            Riverpod State
  Widgets           (Freezed models)
```

### Layers per Feature

| Layer | Responsibility | Dart Location |
|-------|---------------|---------------|
| **Presentation** | UI rendering, user events | `pages/`, `widgets/` |
| **Controller** | Business logic, state transitions | `controllers/` (StateNotifier) |
| **Repository / Service** | Data sourcing (API + local cache) | `repositories/`, `services/` |
| **Model / DTO** | Serialisable data classes | `models/` |

### State Management — Riverpod

All mutable state lives in **StateNotifier** subclasses paired with **Freezed** immutable state classes.

```dart
// Declare provider at module level
final authControllerProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(ref.watch(authRepositoryProvider));
});

// Derived computed providers
final isAuthenticatedProvider = Provider<bool>((ref) =>
    ref.watch(authControllerProvider).isAuthenticated);
```

Provider types used:
- `StateNotifierProvider` — controllers with mutable state
- `Provider` — computed/derived values and injected services
- `FutureProvider` — one-shot async data
- `Provider.family` — parameterised (e.g. plan-by-id)

All providers are declared at **module level** (not inside widgets). Dependency injection is handled entirely through Riverpod's `ref.watch` / `ref.read`.

`SharedPreferences` is initialised in `main()` and injected into `ProviderScope` via an override:

```dart
ProviderScope(
  overrides: [
    sharedPreferencesProvider.overrideWithValue(sharedPreferences),
  ],
  child: const CriticalAlphaApp(),
)
```

---

## Navigation (GoRouter)

`app_router.dart` defines a single `GoRouter` exposed as `appRouterProvider`.

### Route Tree

```
/                          SplashPage
├── /login                 LoginPage
├── /signup                SignupPage
├── /forgot-password       ForgotPasswordPage
├── /code-verification     CodeVerificationPage  (?email=&type=)
├── /new-password          NewPasswordPage       (?email=)
│
├── ShellRoute  [ScaffoldWithBottomNavigation]
│   ├── /home              HomePage
│   ├── /goals             PlansPage
│   │   ├── create         CreatePlanPage
│   │   ├── add            AddGoalPage
│   │   └── assessment     AssessmentPage (goals-scoped)
│   ├── /results           ResultsScreen          (?planId=)
│   │   ├── line-chart     ResultLineChartPage
│   │   └── radar-chart    ResultRadarChartPage
│   ├── /audio             AudioSectionPage
│   │   ├── soft-skills    SoftSkillPage
│   │   └── player         MusicPlayerPage       (?trackId=)
│   └── /settings          SettingsPage
│
├── /profile               ProfilePage            [full-screen]
│   ├── change-name        ChangeNamePage
│   ├── change-email       ChangeEmailPage
│   ├── change-password    ChangePasswordPage
│   └── change-picture     ChangePicturePage
├── /purchase              PurchasePage           [full-screen]
├── /plan/:planId          PlanDetailPage         [full-screen]
├── /assessment/:planId    AssessmentPage         [full-screen]
└── /assessment-complete/:planId  AssessmentCompletePage  [full-screen, extras: List<Map>]
```

### Auth Redirect Logic

The router listens to `authControllerProvider` via a `ValueNotifier`. On every navigation event:

1. If on a **public route** → allow through unconditionally.
2. If **not authenticated** and on a protected route → redirect to `/login`.
3. If **authenticated** and on `/` or `/splash` → redirect to `/home`.

---

## Networking

### ApiClient (`lib/core/network/api_client.dart`)

Singleton Dio client, initialised once in `main()`. Interceptor chain (in order):

| Interceptor | Responsibility |
|---|---|
| `_AuthInterceptor` | Attaches token (no `Bearer` prefix — React Native backend convention); handles 401 by refreshing token and retrying |
| `_NetworkInterceptor` | Checks connectivity before each request; throws `NetworkException` when offline |
| `_LoggingInterceptor` | Logs requests/responses in debug mode only |
| `_ErrorInterceptor` | Converts `success: false` responses to exceptions |
| `_RetryInterceptor` | Retries failed requests up to 3 times with exponential backoff |

Generic request methods: `get`, `post`, `put`, `delete`, `patch`.

### Backend Compatibility Notes

The backend is shared with a React Native app. Key differences from a standard REST convention:

- Token sent **without** `Bearer ` prefix
- Field names use snake_case internally: `_id` → `id`, `first_name` → `firstName`
- Response envelope: `{ success: bool, data: T, message: string }`
- Some endpoints use underscores: `/user/sign_up`, `/user/changePass_request`

### Key Endpoints

| Category | Endpoint |
|---|---|
| Login | `POST /user/login` |
| Sign up | `POST /user/sign_up` |
| Forgot password | `POST /user/changePass_request` |
| Verify OTP | `POST /user/verify` |
| Change password | `POST /user/change_password` |
| Plans (goals) | `GET/POST /user/plans`, `/user/plans/create` |
| Assessments | `GET /user/assessment/v2/user_assessments` |
| Audio categories | `GET /user/categories` |
| Audio tracks | `GET /user/categories/audios?category_id=` |
| Subscription update | `POST /user/update-subscription-details` |
| Profile avatar | `POST /user/avatar` |

Full endpoint list: `lib/core/network/api_endpoints.dart`.

---

## Error Handling

`lib/core/errors/failures.dart` defines a typed exception hierarchy and a `Result<T>` wrapper.

### Exception Hierarchy

```
AppException (base, Equatable)
├── NetworkException
├── ServerException
├── BadRequestException
├── UnauthorizedException
├── ForbiddenException
├── NotFoundException
├── ValidationException (+ Map<String, dynamic> errors)
├── RateLimitException
├── AuthException variants (TokenExpired, InvalidCredentials, …)
├── StorageException variants
├── BusinessLogicException variants
├── MediaException variants
├── PaymentException variants
└── PlatformException variants
```

### Result<T> Pattern

```dart
// Repository returns
Future<Result<UserModel>> login(LoginRequest request);

// Controller consumes
final result = await _repository.login(request);
result.when(
  success: (user) => state = state.copyWith(user: user),
  failure: (e) => state = state.copyWith(error: e.message),
);
```

---

## Key Technologies

| Package | Version | Purpose |
|---|---|---|
| `flutter_riverpod` | ^2.4.9 | State management |
| `go_router` | ^13.0.1 | Declarative navigation |
| `dio` | ^5.4.0 | HTTP client |
| `freezed_annotation` | ^2.4.1 | Immutable model code generation |
| `json_annotation` | ^4.8.1 | JSON serialisation |
| `equatable` | ^2.0.5 | Value equality |
| `shared_preferences` | ^2.2.2 | Persistent key-value storage |
| `flutter_secure_storage` | ^9.0.0 | Secure credential storage |
| `hive_flutter` | ^1.1.0 | Local database |
| `fl_chart` | ^0.66.0 | Line & bar charts |
| `syncfusion_flutter_charts` | ^24.1.41 | Radar/advanced charts |
| `just_audio` | ^0.9.36 | Audio playback |
| `audio_service` | ^0.18.12 | Background audio |
| `flutter_screenutil` | ^5.9.0 | Responsive layout (design: 375×812) |
| `reactive_forms` | ^17.0.0 | Declarative form validation |
| `cached_network_image` | ^3.3.0 | Network image caching |
| `shimmer` | ^3.0.0 | Loading skeleton effect |
| `lottie` | ^3.0.0 | Lottie JSON animations |
| `flutter_animate` | ^4.3.0 | Chainable widget animations |
| `in_app_purchase` | ^3.1.11 | App Store / Play Store IAP |
| `image_picker` | ^1.0.5 | Camera & gallery |
| `pdf` | ^3.10.7 | PDF generation |
| `share_plus` | ^7.2.1 | Native share sheet |
| `screenshot` | ^2.1.0 | Widget capture |
| `pin_code_fields` | ^8.0.1 | OTP input |
| `youtube_player_flutter` | ^9.1.0 | Embedded YouTube player |
| `aws_s3_api` | ^2.0.0 | AWS S3 file operations |
| `flutter_dotenv` | ^5.1.0 | `.env` config loading |
| `connectivity_plus` | ^5.0.2 | Network connectivity |

**Dev dependencies:** `build_runner`, `freezed`, `json_serializable`, `riverpod_generator`, `riverpod_lint`, `go_router_builder`, `flutter_launcher_icons`.

---

## Prerequisites

- Flutter SDK `>=3.0.0 <4.0.0`
- Dart SDK `>=3.0.0 <4.0.0`
- iOS deployment target: 12.0
- Android `minSdkVersion`: 21

---

## Setup

### 1. Navigate to project directory

```bash
cd ~/Documents/critical_alpha_flutter
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Generate Freezed / JSON code

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

> To watch for changes during development:
> ```bash
> flutter pub run build_runner watch --delete-conflicting-outputs
> ```

### 4. Environment variables

Ensure `.env` exists at the project root with:

```
BASE_URL=https://admin.criticalalpha.com
S3_URL=https://critical-alpha-web.s3.us-west-1.amazonaws.com
API_TIMEOUT=10000
```

The `.env` file is declared as a Flutter asset in `pubspec.yaml` and loaded via `flutter_dotenv` before `runApp()`.

### 5. Fonts

Place Poppins `.otf` font files in `assets/fonts/`:

| File | Weight |
|---|---|
| `Poppins-Light.otf` | 300 |
| `Poppins-Regular.otf` | 400 |
| `Poppins-Medium.otf` | 500 |
| `Poppins-SemiBold.otf` | 600 |
| `Poppins-Bold.otf` | 700 |
| `Poppins-ExtraBold.otf` | 800 |
| `Poppins-Black.otf` | 900 |

---

## Running the App

```bash
# iOS
flutter run -d ios

# Android
flutter run -d android

# List all connected devices
flutter devices
```

---

## Build for Production

```bash
# iOS
flutter build ios --release

# Android APK
flutter build apk --release

# Android App Bundle (recommended for Play Store)
flutter build appbundle --release
```

### App Icon Generation

After updating `assets/icons/app_icon_.png`:

```bash
flutter pub run flutter_launcher_icons
```

---

## Developer Guidelines

### Adding a New Feature

1. Create `lib/features/<feature_name>/` with subdirectories: `models/`, `controllers/`, `pages/`, `widgets/`, and optionally `repositories/` or `services/`.
2. Define a Freezed state class and a `StateNotifier` controller.
3. Declare Riverpod providers at the top of the controller file.
4. Add new routes to `route_constants.dart` and `app_router.dart`.
5. Run `build_runner` to generate `.freezed.dart` and `.g.dart` files.

### State Management Conventions

- Controllers extend `StateNotifier<MyState>`.
- State classes use `@freezed` annotation with `copyWith` support.
- Never expose mutable state directly from widgets; always go through providers.
- Use `ref.watch` in `build()` for reactive updates; `ref.read` inside callbacks.

### API Calls

- All API interaction goes through `ApiClient` — do not create raw `Dio` instances.
- Repositories return `Result<T>` (never throw directly from repositories).
- New endpoints go in `ApiEndpoints` as `static const String`.

### Navigation

- Use `context.go(RouteConstants.x)` for tab-level navigation.
- Use `context.push(RouteConstants.x)` for pushing onto the stack.
- Pass data via query parameters (simple types) or `state.extra` (complex objects).
- Never hardcode path strings outside `RouteConstants`.

### Code Generation

Freezed model files end in `.freezed.dart`; JSON serialisation files end in `.g.dart`. Commit generated files. Never edit them manually.

```bash
# One-time generation
flutter pub run build_runner build --delete-conflicting-outputs

# Continuous watch mode
flutter pub run build_runner watch --delete-conflicting-outputs
```

---

## Troubleshooting

| Problem | Solution |
|---|---|
| Dependency conflicts | `flutter clean && flutter pub get` |
| Build runner errors | `flutter pub run build_runner clean && flutter pub run build_runner build --delete-conflicting-outputs` |
| iOS pod issues | `cd ios && pod install --repo-update` |
| Font not loading | Confirm file names and weights match `pubspec.yaml` exactly (`.otf` not `.ttf`) |
| 401 loops | Verify token is stored correctly and `_AuthInterceptor` refresh flow is not calling itself |
| Routing errors | Check that new routes are added to both `RouteConstants` and `app_router.dart` |

---

## API Environment

| Variable | Value |
|---|---|
| Base URL | `https://admin.criticalalpha.com` |
| S3 URL | `https://critical-alpha-web.s3.us-west-1.amazonaws.com` |
| Request timeout | 30 seconds (configurable via `AppConstants`) |
| Retry attempts | 3 (exponential backoff) |
| Token storage key | `auth_token` (SharedPreferences) |
| Refresh token key | `refresh_token` (SharedPreferences) |

---

## License

Copyright © 2024 Critical Alpha. All rights reserved.

# Critical Alpha - Flutter Application

A comprehensive goal tracking and learning platform built with Flutter.

## Features

- 🔐 **Authentication**: Login, Signup, Password Recovery with OTP verification
- 📊 **Dashboard**: Personal statistics and progress tracking
- 🎯 **Goals Management**: Create, track, and complete goals with assessments
- 📈 **Results Analytics**: Visualize progress with charts and insights
- 🎵 **Audio Learning**: Educational audio content with player
- 💎 **Premium Subscriptions**: In-app purchases for premium features
- 👤 **Profile Management**: Manage personal information and settings

## Project Structure

```
lib/
├── core/                 # Core utilities and infrastructure
│   ├── constants/       # App constants and strings
│   ├── theme/          # App theme configuration
│   ├── network/        # API client and endpoints
│   ├── utils/          # Utilities and validators
│   ├── widgets/        # Reusable widgets
│   └── providers/      # Global providers
├── features/            # Feature modules
│   ├── auth/           # Authentication feature
│   ├── splash/         # Splash screen
│   ├── home/           # Dashboard
│   ├── goals/          # Goals management
│   ├── results/        # Analytics and charts
│   ├── audio/          # Audio content
│   ├── settings/       # Settings
│   ├── profile/        # User profile
│   └── purchase/       # Subscriptions
├── routes/             # Navigation configuration
└── main.dart          # Application entry point
```

## Prerequisites

- Flutter SDK: >=3.0.0 <4.0.0
- Dart: >=3.0.0 <4.0.0
- iOS: Deployment target 12.0
- Android: minSdkVersion 21

## Installation

1. **Navigate to project directory**
   ```bash
   cd ~/Documents/critical_alpha
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code (for Freezed models)**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Set up environment variables**
   - The `.env` file already exists with:
   ```
   BASE_URL=https://admin.criticalalpha.com
   S3_URL=https://critical-alpha-web.s3.us-west-1.amazonaws.com
   API_TIMEOUT=10000
   ```

5. **Add Poppins fonts** (Optional - for production)
   - Download Poppins font files and place them in `assets/fonts/`:
     - Poppins-Regular.ttf
     - Poppins-Medium.ttf
     - Poppins-SemiBold.ttf
     - Poppins-Bold.ttf

## Running the App

### iOS
```bash
flutter run -d ios
```

### Android
```bash
flutter run -d android
```

### All available devices
```bash
flutter run
```

## Build for Production

### iOS
```bash
flutter build ios --release
```

### Android
```bash
flutter build apk --release
# or for App Bundle
flutter build appbundle --release
```

## Architecture

The app follows **Clean Architecture** principles with:

- **Presentation Layer**: UI pages and widgets
- **Domain Layer**: Business logic and entities
- **Data Layer**: API clients and repositories
- **State Management**: Riverpod for state management
- **Navigation**: GoRouter for declarative routing
- **Networking**: Dio for HTTP requests

## Key Technologies

- **Flutter & Dart**: Core framework
- **Riverpod**: State management
- **GoRouter**: Navigation
- **Dio**: HTTP client
- **Freezed**: Code generation for immutable classes
- **FL Chart**: Data visualization
- **Just Audio**: Audio playback
- **Reactive Forms**: Form validation
- **Flutter ScreenUtil**: Responsive design

## API Integration

The app connects to:
- Base URL: `https://admin.criticalalpha.com`
- S3 URL: `https://critical-alpha-web.s3.us-west-1.amazonaws.com`

### Main API Endpoints

- **Authentication**: `/user/signin`, `/user/signup`, `/user/forgot_password`
- **Goals**: `/user/plans`, `/user/plans/create`, `/user/plans/update`
- **Assessments**: `/user/assessment/v2/user_assessments`
- **Audio**: `/user/categories`, `/user/categories/audios`
- **Profile**: `/self/change_username`, `/self/change_email`
- **Subscription**: `/user/update-subscription-details`

## Troubleshooting

1. **Dependencies Issues**
   ```bash
   flutter clean
   flutter pub get
   ```

2. **Build Runner Issues**
   ```bash
   flutter pub run build_runner clean
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

3. **iOS Pod Issues**
   ```bash
   cd ios
   pod install --repo-update
   ```

4. **Run without sound null safety (if needed)**
   ```bash
   flutter run --no-sound-null-safety
   ```

## License

Copyright © 2024 Critical Alpha. All rights reserved.

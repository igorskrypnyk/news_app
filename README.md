# News App 📰

A Flutter news application built with clean architecture and modern state management.

## Features

- 📰 Top headlines from real NewsAPI
- 🔖 Save articles for later reading
- 👤 Profile with saved articles count
- 💾 Persistent storage between sessions

## Tech Stack

- **Flutter** — UI framework
- **Dart** — Programming language
- **Riverpod** — State management
- **Dio** — HTTP client
- **SharedPreferences** — Local storage

## Architecture
lib/
├── models/        # Data models (Article)
├── providers/     # Riverpod providers (news, saved)
├── pages/         # UI screens
└── widgets/       # Reusable widgets

## Screenshots

_Coming soon_

## Getting Started

1. Clone the repo
2. Get your free API key at [newsapi.org](https://newsapi.org)
3. Add your key in `lib/providers/news_provider.dart`
4. Run `flutter pub get`
5. Run `flutter run`

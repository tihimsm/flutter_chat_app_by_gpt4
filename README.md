# Flutter Chat App

This project is a simple chat application created using Flutter. It uses riverpod for state management and follows the Clean Architecture principles. For user authentication, it utilizes FirebaseAuth, and for the database, it uses Firestore. FirebaseAnalytics is used for analytics purposes.

## Features

-   User registration
-   User login
-   One-to-one chats
-   Group chats with two or more participants

## Setup

1.  Install [Flutter](https://flutter.dev/docs/get-started/install) and set up the environment.
    
2.  Clone this repository.
    

```bash
git clone https://github.com/your_username/flutter_chat_app.git
cd flutter_chat_app
```

3.  Install the required packages.

```bash
flutter pub get
```

4.  Create a [Firebase project](https://console.firebase.google.com/) and place `google-services.json` in the `android/app` directory. Also, place the configuration file `GoogleService-Info.plist` for iOS in the `ios/Runner` directory.
    
5.  Run the app on an emulator or a physical device.
    

```bash
flutter run
```

## Architecture

This application follows the Clean Architecture approach, divided into the following layers:

1.  UI Layer - Contains Flutter widgets
2.  Domain Layer - Contains business logic and repository interfaces
3.  Data Layer - Contains data sources and repository implementations

Additionally, it uses riverpod for state management, effectively controlling the flow of data and minimizing UI updates.

## Future Improvements

-   Display message timestamps
-   Upload and display user profile images
-   Better error handling and validation
-   Show user online/offline status
-   Display unread message count
-   Search and filtering of messages
-   Dark mode support

## License

[MIT License](LICENSE)
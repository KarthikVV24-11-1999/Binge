# Binge

Binge is a multiplayer social party game app built using Flutter, where users can create or join game lobbies, select themed decks based on popular TV shows, and challenge friends in real time. The app features in game currency, social sign in, and seamless payment integration.

## Features

- **Account & Authentication**
  - Sign up/in using email/password or Google account
  - Firebase authentication and user management
- **Game Lobby System**
  - Create or join private game rooms with unique codes
  - Invite friends to lobbies via shareable links/codes
  - Wait for all players before starting the game
- **Themed Decks**
  - Select from a variety of decks themed around hit TV shows (e.g., Friends, Game of Thrones, Money Heist, Squid Game, and more)
  - Visual deck selection with custom images and branding
- **Virtual Currency (BingeCoins)**
  - Earn or purchase BingeCoins to unlock additional game features or decks
  - Razorpay integration for in app purchases
- **Profile and Social**
  - Custom avatars and profiles
  - Social login via Google
- **Modern Flutter UI**
  - Responsive design, custom fonts, and app theming

## Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/KarthikVV24-11-1999/Binge.git
   cd Binge
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Setup Firebase**
   - Configure Firebase for both Android and iOS (see `firebase_core` and `cloud_firestore` dependencies).
   - Add your `google_services.json`/`GoogleService_Info.plist` to the respective `android/` and `ios/` folders.

4. **Run the app**
   ```bash
   flutter run
   ```

## Tech Stack

- **Flutter** (cross platform, Dart)
- **Firebase** (Auth, Firestore)
- **Razorpay** (in app payments)
- **Third party packages**: google_sign_in, share, form_field_validator, etc.
 
## License

[MIT](LICENSE)

# Crypto Market info

This project demonstrates how to implement a real-time trading chart using the TradingView Widget in Flutter. It leverages various Flutter packages to handle state management, data processing, and API communication.

## Features
- Real-time data updates through WebSocket
- State management using Cubit
- Data persistence with Hydrated Bloc
- TradingView Widget integration

## Getting Started

### Prerequisites
Before you can run this project, ensure your development environment is properly set up with the following:

- **Flutter SDK**: Version 3.22.2 or later
- **Dart SDK**: Version 3.4.3 or later
- **VSCode**: Version 1.91.1 or later, and Flutter and Dart extensions
- **A working Android/iOS simulator or a physical device**

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Imron-Code17/crypto-market-info.git
   cd crypto-market-info
2. **Install dependencies**:
    ```bash
    flutter pub get
3. **Generate necessary files**:
    Before running the project, you need to generate some files with build_runner:
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
4. **Run the app:**
    ```bash
    flutter run

### Environment Details
- **Flutter Version**: 3.22.2 
- **Dart Version**: 3.4.3
- **Target Platforms**: Android, iOS
- **Tested on**:
    Android Emulator: Pixel 5 (API 34)
    IOS Simulator: iPhone 14 Pro Max (iOS 16.2)
-----

# Flutter Tour Booking App

This project is a Flutter application that implements a single, seamless workflow for booking tourism packages. It was developed as a technical assignment focusing on clean architecture, robust state management, and adherence to modern development best practices.

The application is built entirely with mock data, requiring no external API integration.




## 📸 Screenshots

| Package Selection                                                                   | Itinerary Customization                                                             | Booking Confirmation                                                                |
| :----------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------: |
|<img width="250" height="2556" alt="Simulator Screenshot - iPhone 15 Pro - 2025-10-08 at 01 04 39" src="https://github.com/user-attachments/assets/7b498b97-a0f3-4cd6-8d67-4461f762b00b" /> | <img width="250" height="2556" alt="Simulator Screenshot - iPhone 15 Pro - 2025-10-08 at 01 04 28" src="https://github.com/user-attachments/assets/f3b12d0b-7397-4af4-9432-b95c489539d6" /> |  <img width="250" height="2556" alt="Simulator Screenshot - iPhone 15 Pro - 2025-10-08 at 01 04 16" src="https://github.com/user-attachments/assets/f38f4b7f-61f4-4957-a167-fba45f04b98a" />

-----

## ✨ Features

  - **Browse Packages:** View a horizontal list of available tour packages.
  - **Select & Customize:** Choose a package to see its details and customize the itinerary.
  - **Adjust Traveler Count:** Easily increase or decrease the number of travelers for the booking.
  - **Dynamic Price Calculation:** The total price updates in real-time as the number of travelers changes.
  - **Seamless Confirmation:** A straightforward process to confirm and reserve the booking.
  - **Success Feedback:** A clear confirmation screen is displayed upon a successful reservation.
  - **Error Handling:** Proper mechanisms are in place to handle potential errors, such as booking with zero travelers.

-----

## 🛠️ Tech Stack & Architecture

  - **Framework:** **Flutter**
  - **Language:** **Dart**
  - **Architecture:** **BLoC (Business Logic Component)**
      - A predictable state management library that separates presentation from business logic, making the app easy to test and scale.
  - **State Management:** **`flutter_bloc`**
  - **Core Principles:** The codebase is structured following **SOLID principles** to ensure it is clean, scalable, and easy to maintain.

-----

## 🚀 Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

  - Flutter SDK (version 3.0.0 or higher)
  - An IDE like VS Code or Android Studio

### Installation & Running

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/your-username/nestafar-booking-app.git
    ```
2.  **Navigate to the project directory:**
    ```sh
    cd nestafar-booking-app
    ```
3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```
4.  **Run the app:**
    ```sh
    flutter run
    ```
5.  **Run the tests:**
    ```sh
    flutter test
    ```

-----

## 📂 Project Structure

The project is organized into a feature-driven directory structure that promotes separation of concerns:

```
lib/
├── components/   # Contains all core components required to build booking screen
├── bloc/         # Contains all BLoC logic (Blocs, Events, States)
├── data/         # Implementation of Repository for handling data (mock data source)
├── domain/       # Interface between data layer and bloc (repos , models )
├── screens/      # Booking Screen
└── main.dart     # Main application entry point
```

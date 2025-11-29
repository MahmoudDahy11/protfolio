<<<<<<< HEAD
# Flutter Portfolio 🚀
=======
Portfolio 🚀
>>>>>>> 07daf08c8a389ba08a2baee91a492d2ccd835c57

A stunning, responsive Flutter Web portfolio featuring a modern aesthetic with floating elements, parallax effects, and smooth animations. Built with a focus on clean architecture and premium user experience.

![Portfolio Preview](assets/bookly_protfolio.png)

## ✨ Features

- **🌓 Dark/Light Mode**: Seamless theme switching with persistent state.
- **🚀 Dynamic Animations**: Floating elements, parallax scrolling, and spring animations.
- **📱 Fully Responsive**: Adaptive layout for web, tablet, and mobile.
- **🎨 Clean Architecture**: Structured using Presentation, Cubit, Domain, and Data layers.
- **⚡ High Performance**: Optimized with `flutter_animate` and efficient state management.
- **📧 Contact Form**: Integrated with EmailJS for direct communication.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Navigation**: [go_router](https://pub.dev/packages/go_router)
- **Animations**: [flutter_animate](https://pub.dev/packages/flutter_animate)
- **Typography**: [google_fonts](https://pub.dev/packages/google_fonts)
- **Icons**: [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter)
- **Networking**: [http](https://pub.dev/packages/http)
- **Storage**: [shared_preferences](https://pub.dev/packages/shared_preferences)

## 📂 Project Structure

```
lib/
├── core/                   # Core utilities, theme, and constants
├── features/
│   └── portfolio/
│       ├── data/           # Data layer (Repositories, Data Sources)
│       ├── domain/         # Domain layer (Entities, Repository Interfaces)
│       └── presentation/   # Presentation layer (Pages, Widgets, Cubits)
│           ├── cubit/      # State management (PortfolioCubit, ThemeCubit)
│           ├── pages/      # Main pages (HomePage)
│           └── widgets/    # Reusable widgets (Hero, About, Projects, etc.)
└── main.dart               # Entry point
```

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version 3.10.0 or higher)
- [Dart SDK](https://dart.dev/get-dart)

### Installation

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/MahmoudDahy11/protfolio.git
    cd protfolio
    ```

2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Run the app**:
    ```bash
    flutter run -d chrome
    ```

## 📬 Contact

**Mahmoud Dahy**

- 📧 Email: [dahym2028@gmail.com](mailto:dahym2028@gmail.com)
- 💼 LinkedIn: [Mahmoud Dahy](https://www.linkedin.com/in/mahmoud-dahy/)
- 🐙 GitHub: [MahmoudDahy11](https://github.com/MahmoudDahy11)

---

Made with 💙 and Flutter.


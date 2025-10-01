# Challenge App 🎯

## Overview

**Challenge App** is a comprehensive Flutter application that demonstrates advanced UI/UX patterns, animations, and interactive widgets. Built with modern Flutter development practices, this project showcases multiple features including task management with dismissible actions, animated loading sequences, and drag-and-drop gameplay mechanics.

The application serves as a learning platform and reference implementation for Flutter developers looking to understand complex animations, state management with hooks, modular widget architecture, and engaging user interactions.

## Features

### 🎨 **Advanced Animations**

- Sequential dots loading animation with elastic curves
- Staggered scale and fade transitions
- Customizable animation controls (play/pause/restart)
- Flutter Hooks integration for cleaner state management

### 📝 **Task Management System**

- Create, complete, and delete tasks with smooth animations
- Swipe-to-dismiss functionality with visual feedback
- Drag-and-drop reordering capabilities
- Priority-based task organization (High/Low)
- Completion status tracking with undo functionality
- Custom snackbar notifications

### 🎮 **Interactive Gameplay**

- Drag-and-drop ball matching game
- Audio feedback and confetti celebrations
- Multiple ball types with color-coded targets
- Video player integration for wrong answers
- Score tracking and game state management

### 🏗️ **Modern Architecture**

- Clean Architecture with feature-based organization
- Modular widget system for reusability
- Flutter Hooks for efficient state management
- Equatable for value equality comparisons
- Custom routing with GoRouter

### 🎯 **UI/UX Excellence**

- Material Design 3 components
- Responsive layouts for multiple screen sizes
- Custom animations and transitions
- Accessible design patterns
- Device preview integration for testing

## Project Structure

```
challenge_app/
├── lib/
│   ├── main.dart                           # App entry point with routing setup
│   ├── core/                               # Shared utilities and configurations
│   │   ├── enums/                          # Application enums (BallType, SnackBarType)
│   │   ├── extensions/                     # Dart extensions for enhanced functionality
│   │   ├── helper/                         # Helper classes and utilities
│   │   ├── routing/                        # Navigation and routing configuration
│   │   ├── utils/                          # Utility functions and constants
│   │   └── widgets/                        # Reusable core widgets
│   └── features/
│       └── home/
│           ├── data/                       # Data layer (models, repositories)
│           └── ui/
│               ├── views/                  # Main screen implementations
│               │   ├── home_view.dart      # Main home screen
│               │   ├── dots_view.dart      # Loading animation showcase
│               │   ├── task_manager_view.dart  # Task management interface
│               │   └── draggable_widget_demo.dart  # Drag & drop game
│               └── widgets/                # Feature-specific widgets
│                   ├── dots_widgets/       # Animation-related widgets
│                   │   ├── animated_dots_sequence.dart
│                   │   ├── dots_animation_builder.dart
│                   │   ├── animated_dot.dart
│                   │   ├── animation_control_buttons.dart
│                   │   └── [8 more animation widgets]
│                   ├── task_manager_widgets/  # Task management widgets
│                   │   ├── task_card.dart
│                   │   ├── dismissible_task_item.dart
│                   │   ├── task_manager_header.dart
│                   │   └── [12 more task widgets]
│                   └── draggable_widgets/  # Game-related widgets
│                       ├── game_ball.dart
│                       └── game_target.dart
├── assets/                                 # Static resources
│   ├── images/                            # Image assets
│   ├── fonts/                             # Custom fonts (Inter, Raleway)
│   ├── sounds/                            # Audio files
│   └── videos/                            # Video assets
└── test/                                  # Unit and widget tests
```

### Widget Architecture - DotsView Example

```
DotsView (HookWidget)
├── LoadingScreenLayout
    ├── LoadingTitle
    ├── AnimatedDotsSequence
    │   ├── DotsAnimationBuilder
    │   ├── DotsRow
    │   └── AnimatedDot
    │       └── DotContainer
    └── AnimationControlButtons
        ├── PlayPauseButton
        └── RestartButton
```

### Widget Architecture - Task Manager Example

```
TaskManagerView
├── TaskManagerHeader
│   ├── TaskCountSection
│   └── AddTaskButton
├── TaskEmptyState
└── DismissibleTaskItem
    ├── TaskCard
    │   ├── TaskPriorityIndicator
    │   └── TaskContent
    │       ├── TaskTitleRow
    │       │   └── TaskPriorityBadge
    │       ├── TaskDescription
    │       └── TaskCompletionStatus
    └── DismissBackground
```

## Screenshots

### Main Features

![Home Screen](screenshots/home_screen.png)
_Main navigation and feature overview_

![Task Manager](screenshots/task_manager.png)
_Task management interface with swipe actions_

![Task Creation](screenshots/task_creation.png)
_Adding new tasks with priority selection_

### Animation Showcase

![Loading Animation](screenshots/dots_animation.png)
_Sequential dots loading animation with controls_

![Animation Controls](screenshots/animation_controls.png)
_Play, pause, and restart animation controls_

### Interactive Gameplay

![Drag Drop Game](screenshots/drag_drop_game.png)
_Ball matching game with drag and drop mechanics_

![Game Victory](screenshots/game_victory.png)
_Confetti celebration and success feedback_

![Game Feedback](screenshots/game_feedback.png)
_Audio and visual feedback for interactions_

### Task Management Details

![Swipe Actions](screenshots/swipe_actions.png)
_Swipe-to-complete and swipe-to-delete actions_

![Task Reordering](screenshots/task_reordering.png)
_Drag and drop task reordering functionality_

![Task Priorities](screenshots/task_priorities.png)
_High and low priority task visualization_

### Responsive Design

![Mobile Layout](screenshots/mobile_layout.png)
_Optimized mobile interface_

![Tablet Layout](screenshots/tablet_layout.png)
_Responsive tablet adaptation_

## Getting Started

### Prerequisites

- Flutter 3.0 or higher
- Dart 3.0 or higher
- Android Studio / VS Code
- Device or Emulator

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/mohamed-abdelmaboud1/challenge-app.git
   cd challenge-app
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

### Key Dependencies

- `flutter_hooks` - State management with hooks
- `equatable` - Value equality comparisons
- `go_router` - Navigation and routing
- `confetti` - Celebration animations
- `audioplayers` - Sound effects
- `video_player` - Video playback
- `device_preview` - Multi-device testing

## Architecture Highlights

### Clean Architecture Implementation

- **Feature-based organization** for scalability
- **Separation of concerns** with clear layer boundaries
- **Dependency injection** patterns
- **Testable code structure**

### State Management

- **Flutter Hooks** for functional reactive programming
- **useAnimationController** for animation management
- **useEffect** for lifecycle handling
- **Stateless widgets** for performance optimization

### Widget Design Patterns

- **Composition over inheritance**
- **Single responsibility principle**
- **Reusable component library**
- **Consistent naming conventions**

---

_Built with ❤️ using Flutter_

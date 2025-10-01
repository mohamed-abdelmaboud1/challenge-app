# Challenge App 🎯

## Overview

**Challenge App** is a comprehensive Flutter application that demonstrates advanced UI/UX patterns, animations, and interactive widgets. Built with modern Flutter development practices, this project showcases multiple features including task management with dismissible actions, animated loading sequences, and drag-and-drop gameplay mechanics.

The application serves as a learning platform and reference implementation for Flutter developers looking to understand complex animations, state management with hooks, modular widget architecture, and engaging user interactions.

## Demos


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

### Key Dependencies

- `flutter_hooks` - State management with hooks
- `equatable` - Value equality comparisons
- `go_router` - Navigation and routing
- `confetti` - Celebration animations
- `audioplayers` - Sound effects
- `video_player` - Video playback
- `device_preview` - Multi-device testing

---

_Built with ❤️ using Flutter_

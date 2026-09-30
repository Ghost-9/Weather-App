# Cupertino Weather

<p align="center">
  <strong>A minimalist iOS weather application crafted with SwiftUI.</strong><br />
  <em>Exploring declarative UI state flows, SF Symbols, and Cupertino design tokens.</em>
</p>

<p align="center">
  <a href="#overview">Overview</a> •
  <a href="#key-features">Key Features</a> •
  <a href="#architecture">Architecture</a> •
  <a href="#running-locally">Running Locally</a>
</p>

---

## Overview

A clean, native iOS application exploring Apple's declarative SwiftUI framework. The interface showcases dynamic day-to-night transitions, gradient sky backdrops, and responsive weekly forecast widgets.

---

## Key Features

* **Declarative State Flow:** Clean `@State` property bindings dynamically altering theme and iconography between Day and Night cycles.
* **SF Symbols Integration:** Native Apple iconography adapting seamlessly across temperature and atmospheric condition states.
* **Adaptive Cupertino Layout:** Fluid `VStack` and `HStack` hierarchies optimized for modern iPhone displays with safe area considerations.

---

## Architecture

```
Weather-App/
├── Shared/
│   ├── ContentView.swift      # Main declarative layout, state bindings & preview
│   ├── Weather_AppApp.swift   # App entry point
│   └── Assets.xcassets/       # Accent colors & App Icon sets
└── Tests/                     # iOS & macOS test suites
```

---

## Running Locally

### Requirements
* Xcode 13.0+
* macOS Monterey or later
* iOS 15.0+ Simulator or physical device

### Quick Start
1. Clone the repository:
   ```bash
   git clone https://github.com/Ghost-9/Weather-App.git
   ```
2. Open `Weather App.xcodeproj` in Xcode:
   ```bash
   open "Weather App.xcodeproj"
   ```
3. Select your target simulator (e.g., iPhone 15 Pro) and press `Cmd + R` to build and run.

---

<p align="center">
  <sub>Crafted with SwiftUI by <a href="https://github.com/Ghost-9">Mayank Batra</a></sub>
</p>

# Cupertino Weather · Native SwiftUI Experience

<p align="center">
  <strong>An elegant, native iOS & macOS weather application handcrafted with Apple's SwiftUI framework.</strong><br />
  <em>Featuring dynamic diurnal cycles, frosted glassmorphism telemetry cards, spring animations, and native SF Symbols.</em>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Swift-5.x-FA7343?logo=swift&logoColor=white" alt="Swift" />
  <img src="https://img.shields.io/badge/SwiftUI-iOS_15%2B_%7C_macOS_12%2B-007AFF?logo=apple&logoColor=white" alt="SwiftUI" />
  <img src="https://img.shields.io/badge/Design-Cupertino_Human_Interface-blue" alt="HIG" />
  <img src="https://img.shields.io/badge/Symbols-SF_Symbols_5-grey" alt="SF Symbols" />
  <img src="https://img.shields.io/badge/Build-Xcode_15%2B-1575F9?logo=xcode&logoColor=white" alt="Xcode" />
  <img src="https://img.shields.io/badge/License-MIT-green" alt="MIT" />
</p>

<p align="center">
  <a href="#interface-design">Interface Design</a> •
  <a href="#swiftui-craftsmanship">SwiftUI Craftsmanship</a> •
  <a href="#architecture">Architecture</a> •
  <a href="#running-locally">Running Locally</a> •
  <a href="#license">License</a>
</p>

---

## Interface Design

<div align="center">
  <table>
    <tr>
      <th align="center" width="50%">☀️ Day Cycle (Dynamic Gradient)</th>
      <th align="center" width="50%">🌙 Night Cycle (Deep Indigo Obsidian)</th>
    </tr>
    <tr>
      <td align="left">
        <ul>
          <li><strong>Sky Atmosphere:</strong> Multi-stop gradient transitioning from vivid azure (<code>#1F78E0</code>) to serene cloud white</li>
          <li><strong>Atmospheric Telemetry:</strong> Frosted ultra-thin material pill tracking Humidity (62%), Wind (9 mph), and UV Index (5)</li>
          <li><strong>5-Day Forecast:</strong> Responsive horizontal cards with individual condition symbols and temperature readings</li>
        </ul>
      </td>
      <td align="left">
        <ul>
          <li><strong>Sky Atmosphere:</strong> Nightfall gradient from midnight navy (<code>#0D1229</code>) into deep indigo twilight</li>
          <li><strong>Atmospheric Telemetry:</strong> Live recalibration to Night metrics (Humidity 74%, Wind 6 mph, UV Index 0)</li>
          <li><strong>Night Forecast:</strong> Night-specific SF Symbols including moon stars, nocturnal rain, and lunar storm warnings</li>
        </ul>
      </td>
    </tr>
  </table>
</div>

---

## SwiftUI Craftsmanship

* **Zero-Deprecation Modern Syntax:** Built natively using `.foregroundStyle`, `.ignoresSafeArea()`, and `.symbolRenderingMode(.multicolor)`.
* **Tactile Spring Physics:** Smooth diurnal state toggling driven by `withAnimation(.spring(response: 0.45, dampingFraction: 0.7))`.
* **Liquid Frosted Glass:** Surface cards rendered via `.ultraThinMaterial` with continuous corner radii and 15% opacity hairline borders.
* **Universal Multi-Platform Binary:** Shared declarative codebase compiling cleanly for both iOS and macOS targets with zero target-specific fragmentation.

---

## Architecture

```
Weather-App/
├── Shared/
│   ├── ContentView.swift      # Main declarative layout, diurnal state & telemetry cards
│   ├── Weather_AppApp.swift   # Universal App scene entry point
│   └── Assets.xcassets/       # Native app icon set & semantic accent color assets
├── Tests iOS/                 # iOS UI & performance testing suite
├── Tests macOS/               # macOS target test suite
└── Weather App.xcodeproj      # Xcode multiplatform workspace project
```

---

## Running Locally

### Prerequisites
* macOS Ventura / Sonoma or later
* Xcode 15.0 or later with iOS 15+ SDK

### Build & Run
```bash
# Clone repository
git clone https://github.com/Ghost-9/Weather-App.git
cd Weather-App

# Open project in Xcode
open "Weather App.xcodeproj"

# Or build via terminal command line
xcodebuild -scheme "Weather App (macOS)" -destination "platform=macOS" CODE_SIGNING_ALLOWED=NO build
```

---

## License

This project is licensed under the [MIT License](LICENSE).

<div align="center">
  <sub>Crafted with SwiftUI by <a href="https://github.com/Ghost-9">Mayank Batra</a></sub>
</div>

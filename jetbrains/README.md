# Midnight Moss for JetBrains IDEs

Dark organic theme for IntelliJ IDEA, PyCharm, WebStorm, PhpStorm, RubyMine, and all other JetBrains IDEs.

## Installation

### Method 1: JetBrains Marketplace (Recommended)

1. Open your JetBrains IDE
2. Go to **Settings** → **Plugins** → **Marketplace**
3. Search for "Midnight Moss"
4. Click **Install** and restart the IDE
5. Go to **Settings** → **Editor** → **Color Scheme** and select "Midnight Moss"

### Method 2: Install from Disk

1. Download the `.jar` plugin file from [releases](https://github.com/HomunculusLabs/midnight-moss-theme/releases)
2. In your IDE, go to **Settings** → **Plugins**
3. Click the gear icon → **Install Plugin from Disk...**
4. Select the downloaded `.jar` file
5. Restart the IDE
6. Go to **Settings** → **Editor** → **Color Scheme** and select "Midnight Moss"

### Method 3: Import Color Scheme File

1. Download `midnight-moss.icls`
2. In your IDE, go to **Settings** → **Editor** → **Color Scheme**
3. Click the gear icon → **Import Scheme** → **IntelliJ IDEA color scheme (.icls)**
4. Select the downloaded file and click **OK**
5. Choose "Midnight Moss" from the scheme dropdown

### Method 4: Manual Installation

1. Copy `midnight-moss.icls` to your IDE's color schemes directory:
   - **Windows**: `%USERPROFILE%\.IntelliJIdea{version}\config\colors\`
   - **macOS**: `~/Library/Application Support/JetBrains/{IDE}{version}/colors/`
   - **Linux**: `~/.config/JetBrains/{IDE}{version}/colors/`
2. Restart your IDE
3. Go to **Settings** → **Editor** → **Color Scheme** and select "Midnight Moss"

## Features

- **Organic Color Palette**: Deep night backgrounds with moss-inspired accents
- **Optimized Syntax Highlighting**: Carefully chosen colors for each language element
- **Enhanced Readability**: High contrast ratios for extended coding sessions
- **Error/Warning Integration**: Consistent color coding for diagnostics
- **Diff Support**: Clear visualization of code changes
- **Search Highlighting**: Prominent but non-distracting search results

## Supported IDEs

- IntelliJ IDEA
- PyCharm
- WebStorm
- PhpStorm
- RubyMine
- CLion
- GoLand
- DataGrip
- Android Studio
- AppCode

## Building the Plugin

### Prerequisites

- JDK 17 or later
- Gradle 8.0 or later

### Build

```bash
cd jetbrains

# Build the plugin
./gradlew buildPlugin

# The plugin JAR will be in build/distributions/
```

### Publish to JetBrains Marketplace

```bash
# Set your JetBrains Marketplace token
export PUBLISH_TOKEN="your-token-here"

# Publish
./gradlew publishPlugin
```

## Plugin Structure

```
jetbrains/
├── META-INF/
│   └── plugin.xml       # Plugin descriptor
├── colors/
│   └── midnight-moss.xml # Color scheme
├── midnight-moss.icls   # Standalone color scheme file
├── build.gradle.kts     # Gradle build configuration
├── settings.gradle.kts  # Gradle settings
└── gradle.properties    # Build properties
```

## Color Mapping

- **Keywords**: Sage purple (`#826d94`) - `if`, `class`, `function`
- **Strings**: Amber yellow (`#a09262`) - String literals
- **Numbers**: Copper orange (`#9d7a5a`) - Numeric values
- **Comments**: Mist gray (`#7a7a7a`) - Code documentation
- **Functions**: Ocean blue (`#5d7e97`) - Method calls and declarations
- **Classes**: Forest green (`#6e8f7c`) - Type definitions
- **Variables**: Moonlight gray (`#b8b8b8`) - Identifiers
- **Errors**: Wine red (`#9b6a6c`) - Syntax errors
- **Warnings**: Amber yellow (`#a09262`) - Potential issues
- **Selection**: Moss green (`#5e8d87`) - Text selection and highlights

## License

MIT License - See [LICENSE](../LICENSE) for details.

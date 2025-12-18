# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.1] - 2025-01-18

### Fixed
- 🔧 Renamed main library file from `multiple_dialog.dart` to `flutter_multi_dialogs.dart` for consistency with package name
- 🔧 Updated all imports to use the correct library file name

## [1.0.0] - 2025-01-18

### Added
- ✨ **Adaptive Dialogs**: Automatic platform detection (iOS → Cupertino, Android → Material)
  - `showAdaptiveAlertDialog` - Automatically uses Cupertino on iOS, Material on Android
  - `showAdaptiveLoadingDialog` - Platform-aware loading dialogs
  - `showAdaptiveSuccessDialog` - Adaptive success dialogs
  - `showAdaptiveErrorDialog` - Adaptive error dialogs
  - `showAdaptiveWarningDialog` - Adaptive warning dialogs
  - `showAdaptiveInfoDialog` - Adaptive info dialogs

- 🍎 **Cupertino (iOS) Dialogs**: Full iOS-style dialog support
  - `showCupertinoAlertDialog` - iOS-style alert dialogs
  - `showCupertinoIconAlertDialog` - Alert dialogs with custom icons
  - `showCupertinoActionSheet` - iOS-style action sheets
  - `showCupertinoListActionSheet` - Action sheets with list items
  - `showCupertinoLoadingDialog` - iOS-style loading dialogs
  - `showCupertinoSuccessDialog` - Success dialogs with Cupertino styling
  - `showCupertinoErrorDialog` - Error dialogs with Cupertino styling
  - `showCupertinoWarningDialog` - Warning dialogs with Cupertino styling
  - `showCupertinoInfoDialog` - Info dialogs with Cupertino styling

- 🎨 **Preset Dialogs**: Ready-to-use dialog presets for common scenarios
  - `showSuccessDialog` - Success messages with check icon
  - `showErrorDialog` - Error messages with error icon
  - `showWarningDialog` - Warning messages with warning icon
  - `showInfoDialog` - Informational messages with info icon

- 🎯 **Material Design Dialogs**: Enhanced Material Design dialog support
  - `showAlertDialog` - Standard alert dialogs
  - `showIconAlertDialog` - Alert dialogs with custom icons
  - `showLoadingDialog` - Loading dialogs with customizable options
  - `showSimpleListDialog` - List dialogs with item selection
  - `showCustomDialog` - Fully customizable dialogs
  - `showCustomAlertDialog` - Custom alert dialogs with builders
  - `showCustomSimpleDialog` - Custom simple dialogs

- 🎨 **Material 3 Support**: Full Material 3 compatibility
  - Adaptive border radius (28.0 for Material 3, 12.0 for Material 2)
  - Adaptive elevation (3.0 for Material 3, 24.0 for Material 2)
  - Theme-aware background colors

- 🧪 **Testing**: Comprehensive test suite
  - Unit tests for all models and builders
  - Widget tests for all dialog types
  - Platform detection tests
  - Material 3 helper tests

- 📚 **Documentation**: Complete documentation
  - Comprehensive README with examples
  - API documentation with DartDoc
  - Usage examples for all dialog types

### Changed
- 🔄 **Null Safety**: Full null-safety migration
- 🔄 **Widget Modernization**: Updated to modern Flutter widgets
  - Replaced deprecated `RaisedButton` with `ElevatedButton`
  - Replaced deprecated `FlatButton` with `TextButton`
- 🔄 **Code Structure**: Refactored into modular architecture
  - Separated dialogs into individual files
  - Organized models, builders, and utilities
  - Improved code maintainability

### Fixed
- 🐛 Fixed deprecated widget usage
- 🐛 Fixed null-safety issues
- 🐛 Fixed Material 3 compatibility issues
- 🐛 Improved dialog theming and styling

### Technical Details
- **SDK**: Requires Dart >=2.17.0 <4.0.0
- **Flutter**: Compatible with Flutter stable channel
- **Linting**: Uses `flutter_lints ^3.0.0` for code quality

---

## Previous Versions (Legacy)

### [0.1.6] - Legacy
- Initial release with basic Material Design dialogs
- Loading dialogs, alert dialogs, and simple dialogs


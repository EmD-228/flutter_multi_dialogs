## [0.0.1] - New library and continuous addition。。。。。。

## [0.0.2] - change loadingDialog,add api ,add example

## [0.0.3] - change showBottomDialog,add CustomAlertDialog、CustomDialog

## [0.0.4] - add  showSimpleListDialog  and override CustomDialog

## [0.1.0] - fix bug and now release

## [0.1.1] - add analysis_options.yaml

## [0.1.2] - change analysis_options.yaml

## [0.1.3] - Analysis

## [0.1.4] - Analysis

## [0.1.5] - remove showBottomDialog,if you want to use it , see example

## [0.1.6] - change showCustomDialog to showCustomSimpleDialog ,add new showCustomDialog,change showLoadingDialog and more useful

## [0.4.0] - 2024 - Adaptive dialogs with automatic platform detection
- ✨ **NEW**: Added adaptive dialogs that automatically detect platform (iOS → Cupertino, Android → Material)
- ✨ **NEW**: `showAdaptiveAlertDialog` - Automatically uses Cupertino on iOS, Material on Android
- ✨ **NEW**: `showAdaptiveLoadingDialog` - Platform-adaptive loading dialogs
- ✨ **NEW**: `showAdaptiveSuccessDialog` - Platform-adaptive success dialogs
- ✨ **NEW**: `showAdaptiveErrorDialog` - Platform-adaptive error dialogs
- ✨ **NEW**: `showAdaptiveWarningDialog` - Platform-adaptive warning dialogs
- ✨ **NEW**: `showAdaptiveInfoDialog` - Platform-adaptive info dialogs
- ✨ **NEW**: `PlatformHelper` utility class for platform detection
- ✨ **NEW**: Comprehensive test suite for adaptive dialogs (6+ tests)
- 📚 Updated documentation with adaptive dialog examples
- 🎯 One API for all platforms - automatic native look and feel

## [0.3.0] - 2024 - Cupertino (iOS) dialogs support
- ✨ **NEW**: Added full Cupertino (iOS) dialog support
- ✨ **NEW**: `showCupertinoAlertDialog` - iOS-style alert dialogs
- ✨ **NEW**: `showCupertinoIconAlertDialog` - Alert dialogs with icons
- ✨ **NEW**: `showCupertinoActionSheet` - iOS-style action sheets
- ✨ **NEW**: `showCupertinoListActionSheet` - Action sheets with list items
- ✨ **NEW**: `showCupertinoLoadingDialog` - iOS-style loading dialogs
- ✨ **NEW**: Cupertino preset dialogs (success, error, warning, info)
- ✨ **NEW**: Comprehensive test suite for Cupertino dialogs (15+ tests)
- 📚 Updated documentation with Cupertino examples
- 🎨 Native iOS look and feel for all Cupertino dialogs

## [0.2.3] - 2024 - Enhanced Material 3 support
- ✨ **NEW**: Added Material3Helper utility class for adaptive Material 3/Material 2 support
- ✨ **NEW**: Adaptive border radius (28.0 for Material 3, 12.0 for Material 2)
- ✨ **NEW**: Adaptive elevation (3.0 for Material 3, 24.0 for Material 2)
- ✨ **NEW**: Improved dialog background color handling with Material 3 support
- 🎨 Updated CustomDialog and LoadingDialog to use Material 3 adaptive styling
- 🔧 Removed deprecated dialogBackgroundColor usage
- 📚 Better integration with Flutter's DialogTheme

## [0.2.2] - 2024 - CI/CD setup
- ✨ **NEW**: Added GitHub Actions workflows for automated testing and analysis
- ✨ **NEW**: CI pipeline runs tests on Flutter stable and beta channels
- ✨ **NEW**: Automated code analysis and formatting checks
- ✨ **NEW**: Example app testing in CI pipeline
- ✨ **NEW**: Code coverage reporting with Codecov integration
- ✨ **NEW**: Automated dry-run package publishing verification
- 🔧 Improved development workflow with automated quality checks

## [0.2.1] - 2024 - Preset dialogs and code restructuring
- ✨ **NEW**: Added preset dialogs (showSuccessDialog, showErrorDialog, showWarningDialog, showInfoDialog)
- ✨ **NEW**: Restructured code into modular architecture (src/models, src/builders, src/dialogs)
- ✨ **NEW**: Comprehensive test suite with 30+ tests
- ✨ **NEW**: Improved example app with organized structure
- 🎨 Better code organization and maintainability
- 📚 Enhanced documentation with preset examples

## [0.2.0] - 2024 - Major update and maintenance takeover
- ✅ Updated to Flutter SDK >=2.17.0 <4.0.0
- ✅ Migrated to null-safety
- ✅ Replaced deprecated widgets (RaisedButton → ElevatedButton, FlatButton → TextButton)
- ✅ Fixed LoadingDialog missing insetAnimationDuration and insetAnimationCurve parameters
- ✅ Fixed showCustomDialog hardcoded backgroundColor and elevation
- ✅ Updated analysis_options.yaml to use flutter_lints instead of pedantic
- ✅ Improved code quality and documentation
- ✅ Modernized all examples
- ✨ **NEW**: Enhanced animations with customizable transitions (Fade + Scale)
- ✨ **NEW**: Added `showIconAlertDialog()` for dialogs with icons
- ✨ **NEW**: Improved LoadingDialog with customizable progress indicator color and stroke width
- ✨ **NEW**: Enhanced SimpleListDialog with dividers, better padding, and highlight colors
- ✨ **NEW**: Added auto-close functionality for CustomAlertDialog actions
- ✨ **NEW**: Better accessibility with proper barrier labels
- ✨ **NEW**: Modern border radius (12px) for better Material Design 3 compliance
- ✨ **NEW**: RouteSettings support for all dialogs
- ✨ **NEW**: Customizable transition durations and curves
- 🎨 Improved LoadingDialog message text alignment
- 🎨 Better visual feedback in SimpleListDialog with Material ripple effects 

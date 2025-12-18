# Screenshots Directory

This directory contains screenshots of the different dialog types organized by category.

## Directory Structure

```
screenshots/
├── adaptive_dialogs/
│   ├── adaptive_success.png
│   ├── adaptive_error.png
│   ├── adaptive_warning.png
│   ├── adaptive_info.png
│   ├── adaptive_loading.png
│   └── adaptive_alert.png
├── preset_dialogs/
│   ├── preset_success.png
│   ├── preset_error.png
│   ├── preset_warning.png
│   ├── preset_info.png
│   ├── preset_loading.png
│   └── preset_icon_alert.png
└── custom_dialogs/
    ├── custom_alert.png
    ├── custom_simple.png
    ├── custom_dialog.png
    ├── list_dialog.png
    ├── cupertino_action_sheet.png
    └── cupertino_alert.png
```

## How to Generate Screenshots

1. Run the example app:
   ```bash
   cd example
   flutter run
   ```

2. Navigate to each dialog type in the app

3. Take screenshots using:
   - iOS Simulator: `xcrun simctl io booted screenshot <filename>.png`
   - Android Emulator: Use the built-in screenshot tool or `adb shell screencap`
   - Or use Flutter's screenshot package

4. Save screenshots in the appropriate subdirectory

5. Update the README.md with the correct paths

## Recommended Screenshot Sizes

- **Width**: 200-400px (for pub.dev display)
- **Aspect Ratio**: Maintain device aspect ratio
- **Format**: PNG with transparency (preferred) or JPG
- **Quality**: High resolution for clarity

## Notes

- Screenshots should show the dialogs in their natural state
- Include both iOS and Android versions for adaptive dialogs if possible
- Ensure text is readable and dialogs are clearly visible
- Use consistent styling across all screenshots


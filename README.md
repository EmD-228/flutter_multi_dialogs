# multiple_dialog

A Flutter package providing multiple Material Design dialogs with easy-to-use APIs, including loading dialogs, alert dialogs, list dialogs, and customizable dialogs.

[![Pub](https://img.shields.io/pub/v/multiple_dialog.svg?style=flat-square)](https://pub.dev/packages/multiple_dialog)
[![support](https://img.shields.io/badge/platform-flutter%7Cdart-ff69b4.svg?style=flat-square)](https://github.com/Lans/multiple_dialog)
[![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg?style=flat-square)](LICENSE)

## Features

- 🎨 Multiple Material Design dialog types
- ⚡ Easy-to-use APIs similar to Flutter's built-in dialogs
- 🔧 Highly customizable
- 📱 Null-safety support
- 🎯 Modern Flutter widgets (ElevatedButton, TextButton)
- 🚀 Compatible with Flutter 3.x

## Getting Started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  multiple_dialog: ^0.2.0
```

Then import it in your Dart code:

```dart
import 'package:multiple_dialog/multiple_dialog.dart';
```

## Usage Examples

### 1. Loading Dialog

Display a loading dialog with customizable orientation and message:

```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    elevation: 10,
  ),
  child: const Text("Show Loading Dialog"),
  onPressed: () {
    showLoadingDialog(
      context: context,
      direction: Direction(
        message: "Loading...",
        messageStyle: const TextStyle(fontSize: 16),
        orientations: Orientations.Horizontal,
        width: 120,
        height: 120,
      ),
    );
  },
),
```

### 2. Alert Dialog

Extended AlertDialog with more customization options:

```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    elevation: 10,
  ),
  child: const Text("Show Alert Dialog"),
  onPressed: () {
    showAlertDialog(
      context: context,
      title: const Text("Title"),
      content: const Text("This is the content"),
      semanticLabel: "AlertDialog Extension",
      actions: <Widget>[
        TextButton(
          child: const Text("Confirm"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  },
),
```

### 3. Bottom Dialog

Display a dialog from the bottom of the screen (see example folder for implementation):

```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    elevation: 10,
  ),
  child: const Text("Show Bottom Dialog"),
  onPressed: () {
    showBottomDialog(
      context: context,
      title: const Text("Title"),
      content: Container(child: const Text("Content")),
      isScrollControlled: true,
      backgroundColor: Colors.deepOrange,
      actions: <Widget>[
        TextButton(
          child: const Text("Confirm"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  },
),
```

### 4. Custom Alert Dialog

Create a custom alert dialog with a builder pattern:

```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    elevation: 10,
  ),
  child: const Text("Show Custom Alert Dialog"),
  onPressed: () {
    showCustomAlertDialog(
      context: context,
      dialogBuilder: DialogBuilder(
        simpleBuilder: SimpleBuilder(
          title: const Text("Title"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                for (var item in items)
                  InkWell(
                    child: Text(item),
                    onTap: () {
                      debugPrint('Tapped item: $item');
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
      confirmWidget: const Text("Confirm"),
      cancelWidget: const Text("Cancel"),
      onConfirmCallBack: () {
        Navigator.pop(context);
      },
      onCancelCallBack: () {
        Navigator.pop(context);
      },
    );
  },
),
```

### 5. Custom Simple Dialog

Display a simple dialog with custom children:

```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    elevation: 10,
  ),
  child: const Text("Show Custom Simple Dialog"),
  onPressed: () {
    showCustomSimpleDialog(
      context: context,
      simpleBuilder: const SimpleBuilder(),
      children: <Widget>[
        const Text("Custom SimpleDialog"),
      ],
    );
  },
),
```

### 6. Simple List Dialog

Display a list dialog with item callbacks:

```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    elevation: 10,
  ),
  child: const Text("Show Simple List Dialog"),
  onPressed: () {
    showSimpleListDialog(
      context: context,
      simpleBuilder: const SimpleBuilder(),
      children: <Widget>[
        for (var item in items) Text(item),
      ],
      onItemCallBack: (index) {
        debugPrint('Selected item: ${items[index]}');
      },
    );
  },
),
```

### 7. Custom Dialog

Create a fully customizable dialog with gravity control:

```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    elevation: 10,
  ),
  child: const Text("Show Custom Dialog"),
  onPressed: () {
    showCustomDialog(
      context: context,
      gravity: 0, // -1 (top) to 1 (bottom), 0 is center
      child: const Text("Custom Dialog"),
    );
  },
),
```

**Note:** The `gravity` parameter controls the vertical position from -1 (top) to 1 (bottom), with 0 being the center.

## API Reference

### Functions

- `showLoadingDialog()` - Display a loading dialog
- `showAlertDialog()` - Display an extended alert dialog
- `showCustomAlertDialog()` - Display a custom alert dialog with builder
- `showCustomSimpleDialog()` - Display a custom simple dialog
- `showSimpleListDialog()` - Display a list dialog with callbacks
- `showCustomDialog()` - Display a fully customizable dialog

### Classes

- `LoadingDialog` - Loading dialog widget
- `CustomDialog` - Customizable dialog widget
- `CustomAlertDialog` - Custom alert dialog widget
- `CustomSimpleDialog` - Custom simple dialog widget
- `SimpleListDialog` - List dialog widget
- `Direction` - Configuration for loading dialog orientation
- `DialogBuilder` - Builder for custom alert dialogs
- `SimpleBuilder` - Builder for simple dialogs

## Customization

If you want to customize the dialogs further, you can override `showCustomDialog` or `showCustomAlertDialog` to create your own implementations.

## Requirements

- Flutter SDK: >=2.17.0 <4.0.0
- Dart: >=2.17.0 <4.0.0

## Contributing

Contributions are welcome! If you have suggestions or find issues, please feel free to open an issue or submit a pull request.

## License

Copyright 2019 Lans  
Copyright 2024 [Your Name]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
# flutter_multi_dialogs

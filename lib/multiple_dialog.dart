/// Multiple Dialog - A Flutter package providing multiple Material Design and Cupertino dialogs
/// with easy-to-use APIs
library multiple_dialog;

// Export builders
export 'src/builders/dialog_builder.dart';
export 'src/builders/simple_builder.dart';
// Export adaptive dialogs (auto-detect platform: iOS → Cupertino, Android → Material)
export 'src/dialogs/adaptive_dialogs.dart';
// Export Material dialogs
export 'src/dialogs/alert_dialog.dart';
export 'src/dialogs/cupertino_action_sheet.dart';
// Export Cupertino dialogs
export 'src/dialogs/cupertino_alert_dialog.dart';
export 'src/dialogs/cupertino_loading_dialog.dart';
export 'src/dialogs/cupertino_preset_dialogs.dart';
export 'src/dialogs/custom_alert_dialog.dart';
export 'src/dialogs/custom_dialog.dart';
export 'src/dialogs/list_dialog.dart';
export 'src/dialogs/loading_dialog.dart';
export 'src/dialogs/preset_dialogs.dart';
// Export models
export 'src/models/direction.dart';
export 'src/models/orientations.dart';
// Export utils
export 'src/utils/platform_helper.dart';

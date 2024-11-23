import 'package:flutter/material.dart';
import 'package:siakad_itts/src/settings/settings_controller.dart';
import 'package:siakad_itts/src/settings/settings_service.dart';

import 'src/app.dart';
void main() async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  runApp(MyApp(settingsController: settingsController));
}

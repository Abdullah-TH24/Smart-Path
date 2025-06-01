import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HideShowPasswordController extends GetxController {
  IconData icon = LucideIcons.eyeOff;
  bool obscureText = true;
  IconData iconConfirm = LucideIcons.eyeOff;
  bool obscureTextConfirm = true;

  showPassword() {
    icon = LucideIcons.eye;
    obscureText = false;
    update();
  }

  hidePassword() {
    icon = LucideIcons.eyeOff;
    obscureText = true;
    update();
  }

  showPasswordConfirm() {
    iconConfirm = LucideIcons.eye;
    obscureTextConfirm = false;
    update();
  }

  hidePasswordConfirm() {
    iconConfirm = LucideIcons.eyeOff;
    obscureTextConfirm = true;
    update();
  }
}

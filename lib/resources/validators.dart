import 'package:mobyte_chto_to/resources/enums.dart';

class Validators {
  String? valid(TextFieldType type, String txt, [String? txtBefore]) {
    if (type == TextFieldType.password) {
      if (txt.isEmpty) {
        return "Invalid password!";
      }
      if (txt.length < 6) {
        return "Password must has 6 characters";
      }
      if (!txt.contains(RegExp(r'[0-9]'))) {
        return "Password must has digits";
      }
      if (!txt.contains(RegExp(r'[a-z]'))) {
        return "Password must has lowercase";
      } else {
        return null;
      }
    } else if (type == TextFieldType.login) {
      if (!txt.contains(RegExp('@'))) {
        return 'Used email';
      }
      if (!txt.contains(RegExp('.'))) {
        return 'Used email';
      } else {
        return null;
      }
    } else if (type == TextFieldType.phone) {
      if (txt.length < 10) {
        return 'Number is too short';
      }
      if (txt.length > 12) {
        return 'Number is too long';
      }
      if (txt.isEmpty) {
        return "Invalid number!";
      } else {
        return null;
      }
    } else if (type == TextFieldType.checkPassword) {
      if (txt != txtBefore) {
        return 'Password does not match!';
      } else {
        return null;
      }
    }

    return null;
  }
}

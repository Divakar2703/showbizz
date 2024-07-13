import 'package:showbiz/utils/app_strings.dart';

class AppValidation {
  static String? validatesPassword(String? value) {
    String pattern =
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return AppString.fieldIsRequired;
    } else if (!regExp.hasMatch(value)) {
      return AppString.validatePasswordMsg;
    }

    return null;
  }

  static String? validatesEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return AppString.fieldIsRequired;
    } else if (!regExp.hasMatch(value)) {
      return AppString.validateEmailMsg;
    }

    return null;
  }

  static String? validatesCPassWord(String? value, String? oldPass) {
    if (value!.isEmpty) {
      return AppString.fieldIsRequired;
    } else if (!(value == oldPass)) {
      return AppString.validateCPassMsg;
    }

    return null;
  }

  static String? checkEmpty(String? value) {
    if (value!.isEmpty) {
      return AppString.fieldIsRequired;
    }

    return null;
  }
}

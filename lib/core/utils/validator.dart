import 'package:easy_localization/easy_localization.dart';

class Validator {
  static String? defaultValidator(String? value) {
    if (value != null && value.trim().isEmpty) {
      return tr("error_filed_required");
    }
    return null;
  }

  static String? name(String? value) {
    if (value != null) {
      value = value.trim();
      if (value.isEmpty) {
        return tr("This Field is required");
      } else if (value.length < 2 ||
          value.length > 60 ||
          value.contains(RegExp(r'[0-9]')) ||
          value.contains(RegExp(r"[$&+,:;=?@#|'<>.^*()%!]"))) {
        return tr("Only characters are allowed in full name");
      } else if (!RegExp(r"^([\u0621-\u064A]{1,})").hasMatch(value) &&
          !RegExp(r"^([a-zA-Z]{1,})").hasMatch(value)) {
        return tr("Only characters are allowed in full name");
      }
    }
    return null;
  }

// (!RegExp(
//                   r"^([\u0621-\u064A]{1,}\s[\u0621-\u064A]{1,}'?-?[\u0621-\u064A]{1,}\s?([[\u0621-\u064A]{1,})?)")
//               .hasMatch(value) &&
//           !RegExp(r"^([a-zA-Z]{1,}\s[a-zA-Z]{1,}'?-?[a-zA-Z]{1,}\s?([a-zA-Z]{1,})?)")
//               .hasMatch(value))
  static String? price(String? value) {
    if (value != null) {
      value = value.trim();
      if (value.isEmpty) {
        return tr("enter_price");
      }
    }
    return null;
  }

  static String? area(String? value) {
    if (value != null) {
      value = value.trim();
      if (value.isEmpty) {
        return tr("enter_area");
      }
    }
    return null;
  }

  static String? fastOrder(String? value) {
    if (value != null) {
      value = value.trim();
      if (value.isEmpty) {
        return tr("error_filed_required");
      }
      if (value.length < 3) {
        return tr("short_input_fast");
      }
    }
    return null;
  }

  static String? registerAddress(String? value) {
    if (value != null) {
      value = value.trim();
      if (value.isEmpty) {
        return tr("error_filed_required");
      }
      if (value.length < 4) {
        return tr("short_address");
      }
    }
    return null;
  }

  static String? text(String? value) {
    if (value != null) {
      value = value.trim();
      if (value.isEmpty) {
        return tr("error_filed_required");
      } else if (!RegExp('[a-zA-Z]').hasMatch(value)) {
        return tr("enter_correct_name");
      }
    }
    return null;
  }

  static String? defaultEmptyValidator(String? value) {
    return null;
  }

  static String? email(String? value) {
    if (value != null) {
      value = value.trim();
      if (value.isEmpty) {
        return tr("error_filed_required");
      } else if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return tr("error_email_regex");
      }
    } else {
      return tr("error_filed_required");
    }
    return null;
  }

  static String? password(String? value) {
    if (value != null) {
      value = value.trim();
      if (value.isEmpty) {
        return tr("This Field is required");
      }
      if (value.length < 6) {
        return tr("Password must contain 6 characters at least");
      }
    }
    return null;
  }

  static String? confirmPassword(String? confirmPassword, String? password) {
    if (confirmPassword != null) {
      confirmPassword = confirmPassword.trim();
      if (confirmPassword.isEmpty) {
        return tr("error_filed_required");
      } else if (confirmPassword != password) {
        return tr("error_wrong_password_confirm");
      }
    } else {
      return tr("error_filed_required");
    }
    return null;
  }

  static String? numbers(String? value) {
    if (value != null) {
      value = value.trim();
      if (value.isEmpty) {
        return tr("error_filed_required");
      }
      if (value.startsWith("+")) {
        value = value.replaceFirst(r'+', "");
      }
      final number = int.tryParse(value);
      if (number == null) {
        return tr("error_wrong_input");
      }
    } else {
      return tr("error_filed_required");
    }
    return null;
  }

  // static String? phone(String? value) {
  //   if (value != null) {
  //     value = value.trim();
  //     if (value.isEmpty) {
  //       return tr("error_filed_required");
  //     }
  //     if (value.startsWith("+9665") && value.length == 13) {
  //       value = value.replaceFirst(r'+', "");
  //     } else {
  //       return tr("error_wrong_phone");
  //     }
  //     final number = int.tryParse(value);
  //     if (number == null) {
  //       return tr("error_wrong_input");
  //     }
  //   } else {
  //     return tr("error_filed_required");
  //   }
  //   return null;
  // }
}

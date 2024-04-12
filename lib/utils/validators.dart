class Validator {
  static bool isEmailValid(String email) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return password.length >= 6;
  }

  static bool isNameValid(String name) {
    return name.isNotEmpty;
  }

  static bool passwordsMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  static bool isMobileNumberValid(String mobileNumber) {
    // Assuming a valid mobile number contains exactly 10 digits
    String pattern = r'^\d{10}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(mobileNumber);
  }

  static bool isEmptyString(String input) {
    return input.trim().isEmpty;
  }

  static bool isValidLatitude(double latitude) {
    return latitude >= -90 && latitude <= 90;
  }

  static bool isValidLongitude(double longitude) {
    return longitude >= -180 && longitude <= 180;
  }

  static bool isValidExpDate(String input) {
    RegExp regex = RegExp(r'^(0[1-9]|1[0-2])\/(2[0-9])$');
    return regex.hasMatch(input);
  }

  static bool validateCreditCardNumber(String input) {
    String digitsOnly = input.replaceAll(RegExp(r'\D'), '');

    if (digitsOnly.length < 13 || digitsOnly.length > 16) {
      return false;
    }

    RegExp regex = RegExp(r'^[4-6]\d{12,15}$');

    return regex.hasMatch(digitsOnly);
  }

  static bool isNumeric(String input) {
    if (int.tryParse(input) != null) {
      return true;
    }
    if (double.tryParse(input) != null) {
      return true;
    }
    return false;
  }
}

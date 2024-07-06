bool isPasswordValid(String? value) {
  final passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
  return passwordRegex.hasMatch(value!);
}
bool isEmailValid(String? value) {
  final email = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  return email.hasMatch(value!);
}

bool isUserNameValid(String? value) {
  final userName = RegExp(r'^[a-zA-Z\u0600-\u06FF\s\-]+$');
  return userName.hasMatch(value!);
}

bool isUnitNameValid(String? value) {
  final userName = RegExp(r'^[a-zA-Z\u0600-\u06FF\s\-]+$');
  return userName.hasMatch(value!);
}

bool isProvinceNameValid(String? value) {
  final userName = RegExp(r'^[a-zA-Z\u0600-\u06FF\s\-]+$');
  return userName.hasMatch(value!);
}

bool isSmallCharacter(String value) {
  final regex = RegExp(r'^[a-z]+$');
  return regex.hasMatch(value);
}

bool isPagCharacter(String value) {
  final regex = RegExp(r'^[A-Z]+$');
  return regex.hasMatch(value);
}

bool isSpecialCharacter(String value) {
  final regex = RegExp(r'^[!@#$%^&*(),.?":{}|<>]+$');
  return regex.hasMatch(value);
}

bool isNumber(String value) {
  final regex = RegExp(r'^[0-9]+$');
  return regex.hasMatch(value);
}

bool isYoungerThan8Character(String value) {
  if (value.isEmpty|| value.length < 8) {
    return false;
  }
  return true;
}



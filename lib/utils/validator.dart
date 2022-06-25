class Validator {
  static String? nameError(String email) {
    String? errorText;
    return errorText;
  }

  static String? emailError(String email) {
    String? errorText;
    if (email.length > 6) {
      if (!email.contains('@')) {
        errorText = 'EMAIL_IS_NOT_VALID';
      }
    }
    return errorText;
  }

  static String? passwordError(String password1, String password2) {
    String? errorText;
    if (password1.length > 6 && password2.length > 6) {
      if (password1 != password2) {
        errorText = 'PASSWORDS_DONT_MATCH';
      }
    }
    return errorText;
  }

  static String? registrationDataError({
    required String name,
    required String email,
    required String password1,
    required String password2,
  }) {
    String? errorText;
    if (name.length < 6) {
      return 'NAME_LENGTH_IS_NOT_ALLOWED';
    }
    if (nameError(name) != null) {
      return nameError(name);
    }
    if (email.length < 6) {
      return 'EMAIL_LENGTH_IS_NOT_ALLOWED';
    }
    if (emailError(email) != null) {
      return emailError(email);
    }
    if (password1.length < 6 || password2.length < 6) {
      return 'PASSWORD_LENGTH_IS_NOT_ALLOWED';
    }
    if (passwordError(password1, password2) != null) {
      return passwordError(password1, password2);
    }
    return errorText;
  }

  static String? loginDataError({
    required String email,
    required String password,
  }) {
    String? errorText;

    if (email.length < 6) {
      return 'EMAIL_LENGTH_IS_NOT_ALLOWED';
    }
    if (emailError(email) != null) {
      return emailError(email);
    }
    if (password.length < 6) {
      return 'PASSWORD_LENGTH_IS_NOT_ALLOWED';
    }

    return errorText;
  }

  static String? verificationCodeError(String email) {
    String? errorText;
    if (email.length != 6) {
      if (!email.contains('@')) {
        errorText = 'CODE_LENGTH_IS_NOT_VALID';
      }
    }
    return errorText;
  }
}

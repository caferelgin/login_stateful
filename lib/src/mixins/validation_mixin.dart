class ValidationMixin {
  String? validateEmail(String? value) {
    if (value == null || value.length == 0) {
      return 'Email is required';
    }

    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length == 0) {
      return 'Password is required';
    }

    if (value.length < 4) {
      return 'Password should be at least 4 characters.';
    }

    return null;
  }
}

class Validators {
  static final _nameRegex = RegExp(
    r'^[a-zA-Z\u0600-\u06FF]+(?:\s[a-zA-Z\u0600-\u06FF]+)*$',
  );
  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  static final _passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$&*~.,?%^()_+=-]).{8,}$',
  );

  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) return "Name is required";
    if (value.trim().length < 3) return "Name must be at least 3 characters";
    if (!_nameRegex.hasMatch(value.trim())) return "Enter a valid name";
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) return "Email is required";
    if (!_emailRegex.hasMatch(value.trim())) return "Enter a valid email";
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return "Password is required";
    if (!_passwordRegex.hasMatch(value)) {
      return "Min 8 chars, incl. uppercase, lowercase, number & symbol";
    }
    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) return "Please confirm your password";
    if (value != password) return "Passwords do not match";
    return null;
  }
}

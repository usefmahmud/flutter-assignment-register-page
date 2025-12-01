class FormValidators {
  final List<String? Function(String?)> _validators = [];

  FormValidators validateNotEmpty(String fieldName) {
    _validators.add((value) {
      if (value == null || value.isEmpty) {
        return '$fieldName cannot be empty';
      }
      return null;
    });
    return this;
  }

  FormValidators validateIsEmail() {
    _validators.add((value) {
      if (value == null || value.isEmpty) {
        return null;
      }
      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
      if (!emailRegex.hasMatch(value)) {
        return 'Enter a valid email address';
      }
      return null;
    });
    return this;
  }

  FormValidators validateIsPhone() {
    _validators.add((value) {
      if (value == null || value.isEmpty) {
        return null;
      }
      final phoneRegex = RegExp(r'^\+?[\d\s\-\(\)]+$');
      if (!phoneRegex.hasMatch(value) || value.length < 10) {
        return 'Enter a valid phone number';
      }
      return null;
    });
    return this;
  }

  FormValidators validateMinLength(int minLength) {
    _validators.add((value) {
      if (value == null || value.isEmpty) {
        return null;
      }
      if (value.length < minLength) {
        return 'Must be at least $minLength characters';
      }
      return null;
    });
    return this;
  }

  String? Function(String?) build() {
    return (value) {
      for (var validator in _validators) {
        final error = validator(value);
        if (error != null) {
          return error;
        }
      }
      return null;
    };
  }
}

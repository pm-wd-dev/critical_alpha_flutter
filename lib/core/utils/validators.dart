import '../constants/app_constants.dart';

class Validators {
  // Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorRequiredField;
    }

    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegExp.hasMatch(value)) {
      return AppStrings.errorInvalidEmail;
    }

    if (value.length > AppConstants.maxEmailLength) {
      return AppStrings.errorMaxLength
          .replaceFirst('{0}', AppConstants.maxEmailLength.toString());
    }

    return null;
  }

  // Password validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorRequiredField;
    }

    if (value.length < AppConstants.minPasswordLength) {
      return AppStrings.errorMinLength
          .replaceFirst('{0}', AppConstants.minPasswordLength.toString());
    }

    if (value.length > AppConstants.maxPasswordLength) {
      return AppStrings.errorMaxLength
          .replaceFirst('{0}', AppConstants.maxPasswordLength.toString());
    }

    // Check for at least one uppercase letter
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    // Check for at least one lowercase letter
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }

    // Check for at least one digit
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }

    // Check for at least one special character
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  // Confirm password validation
  static String? validateConfirmPassword(String? value, String? originalPassword) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorRequiredField;
    }

    if (value != originalPassword) {
      return AppStrings.errorPasswordMismatch;
    }

    return null;
  }

  // Name validation
  static String? validateName(String? value, {String fieldName = 'Name'}) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorRequiredField;
    }

    if (value.trim().isEmpty) {
      return AppStrings.errorRequiredField;
    }

    if (value.length > AppConstants.maxNameLength) {
      return AppStrings.errorMaxLength
          .replaceFirst('{0}', AppConstants.maxNameLength.toString());
    }

    // Check for valid name characters (letters, spaces, hyphens, apostrophes)
    if (!RegExp(r"^[a-zA-Z\s\-']+$").hasMatch(value)) {
      return '$fieldName can only contain letters, spaces, hyphens, and apostrophes';
    }

    return null;
  }

  // Phone number validation
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorRequiredField;
    }

    // Remove all non-digit characters for validation
    final digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.length < 10 || digitsOnly.length > 15) {
      return 'Please enter a valid phone number';
    }

    // Basic phone number format validation
    final phoneRegExp = RegExp(r'^[\+]?[1-9][\d]{0,15}$');
    if (!phoneRegExp.hasMatch(digitsOnly)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  // Required field validation
  static String? validateRequired(String? value, {String fieldName = 'Field'}) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return AppStrings.errorRequiredField;
    }
    return null;
  }

  // URL validation
  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorRequiredField;
    }

    final urlRegExp = RegExp(
      r'^(https?|ftp)://[^\s/$.?#].[^\s]*$',
      caseSensitive: false,
    );

    if (!urlRegExp.hasMatch(value)) {
      return 'Please enter a valid URL';
    }

    return null;
  }

  // Number validation
  static String? validateNumber(String? value, {double? min, double? max}) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorRequiredField;
    }

    final number = double.tryParse(value);
    if (number == null) {
      return 'Please enter a valid number';
    }

    if (min != null && number < min) {
      return 'Value must be at least $min';
    }

    if (max != null && number > max) {
      return 'Value must be at most $max';
    }

    return null;
  }

  // Integer validation
  static String? validateInteger(String? value, {int? min, int? max}) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorRequiredField;
    }

    final number = int.tryParse(value);
    if (number == null) {
      return 'Please enter a valid whole number';
    }

    if (min != null && number < min) {
      return 'Value must be at least $min';
    }

    if (max != null && number > max) {
      return 'Value must be at most $max';
    }

    return null;
  }

  // Age validation
  static String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorRequiredField;
    }

    final age = int.tryParse(value);
    if (age == null) {
      return 'Please enter a valid age';
    }

    if (age < 13) {
      return 'You must be at least 13 years old';
    }

    if (age > 120) {
      return 'Please enter a valid age';
    }

    return null;
  }

  // Date validation
  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorRequiredField;
    }

    try {
      DateTime.parse(value);
      return null;
    } catch (e) {
      return 'Please enter a valid date';
    }
  }

  // Future date validation
  static String? validateFutureDate(String? value) {
    final dateValidation = validateDate(value);
    if (dateValidation != null) return dateValidation;

    try {
      final date = DateTime.parse(value!);
      if (date.isBefore(DateTime.now())) {
        return 'Date must be in the future';
      }
      return null;
    } catch (e) {
      return 'Please enter a valid date';
    }
  }

  // Past date validation
  static String? validatePastDate(String? value) {
    final dateValidation = validateDate(value);
    if (dateValidation != null) return dateValidation;

    try {
      final date = DateTime.parse(value!);
      if (date.isAfter(DateTime.now())) {
        return 'Date must be in the past';
      }
      return null;
    } catch (e) {
      return 'Please enter a valid date';
    }
  }

  // Credit card validation (basic Luhn algorithm)
  static String? validateCreditCard(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorRequiredField;
    }

    // Remove all non-digit characters
    final digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.length < 13 || digitsOnly.length > 19) {
      return 'Please enter a valid credit card number';
    }

    // Luhn algorithm
    int sum = 0;
    bool isEven = false;

    for (int i = digitsOnly.length - 1; i >= 0; i--) {
      int digit = int.parse(digitsOnly[i]);

      if (isEven) {
        digit *= 2;
        if (digit > 9) {
          digit = digit ~/ 10 + digit % 10;
        }
      }

      sum += digit;
      isEven = !isEven;
    }

    if (sum % 10 != 0) {
      return 'Please enter a valid credit card number';
    }

    return null;
  }

  // CVV validation
  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorRequiredField;
    }

    if (!RegExp(r'^[0-9]{3,4}$').hasMatch(value)) {
      return 'Please enter a valid CVV';
    }

    return null;
  }

  // Expiry date validation (MM/YY format)
  static String? validateExpiryDate(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorRequiredField;
    }

    if (!RegExp(r'^(0[1-9]|1[0-2])\/([0-9]{2})$').hasMatch(value)) {
      return 'Please enter expiry date in MM/YY format';
    }

    final parts = value.split('/');
    final month = int.parse(parts[0]);
    final year = int.parse('20${parts[1]}'); // Assuming 20XX

    final now = DateTime.now();
    final expiryDate = DateTime(year, month + 1, 0); // Last day of the month

    if (expiryDate.isBefore(now)) {
      return 'Card has expired';
    }

    return null;
  }

  // File size validation (in bytes)
  static String? validateFileSize(int? fileSizeBytes, {int maxSizeBytes = 5 * 1024 * 1024}) {
    if (fileSizeBytes == null) {
      return AppStrings.errorRequiredField;
    }

    if (fileSizeBytes > maxSizeBytes) {
      final maxSizeMB = (maxSizeBytes / (1024 * 1024)).toStringAsFixed(1);
      return 'File size must be less than ${maxSizeMB}MB';
    }

    return null;
  }

  // File extension validation
  static String? validateFileExtension(String? fileName, List<String> allowedExtensions) {
    if (fileName == null || fileName.isEmpty) {
      return AppStrings.errorRequiredField;
    }

    final extension = fileName.split('.').last.toLowerCase();
    if (!allowedExtensions.map((e) => e.toLowerCase()).contains(extension)) {
      return 'Allowed file types: ${allowedExtensions.join(', ')}';
    }

    return null;
  }

  // Username validation
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorRequiredField;
    }

    if (value.length < 3) {
      return 'Username must be at least 3 characters long';
    }

    if (value.length > 20) {
      return 'Username must be no more than 20 characters long';
    }

    // Username can contain letters, numbers, underscores, and hyphens
    if (!RegExp(r'^[a-zA-Z0-9_-]+$').hasMatch(value)) {
      return 'Username can only contain letters, numbers, underscores, and hyphens';
    }

    // Cannot start with underscore or hyphen
    if (value.startsWith('_') || value.startsWith('-')) {
      return 'Username cannot start with underscore or hyphen';
    }

    return null;
  }

  // Multiple validator combiner
  static String? combineValidators(String? value, List<String? Function(String?)> validators) {
    for (final validator in validators) {
      final result = validator(value);
      if (result != null) return result;
    }
    return null;
  }

  // Custom validation with regex
  static String? validateWithRegex(
    String? value,
    RegExp regex,
    String errorMessage,
  ) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorRequiredField;
    }

    if (!regex.hasMatch(value)) {
      return errorMessage;
    }

    return null;
  }

  // Length validation
  static String? validateLength(
    String? value, {
    int? minLength,
    int? maxLength,
    String fieldName = 'Field',
  }) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorRequiredField;
    }

    if (minLength != null && value.length < minLength) {
      return '$fieldName must be at least $minLength characters long';
    }

    if (maxLength != null && value.length > maxLength) {
      return '$fieldName must be no more than $maxLength characters long';
    }

    return null;
  }

  // Contains validation
  static String? validateContains(
    String? value,
    String requiredSubstring,
    String errorMessage,
  ) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorRequiredField;
    }

    if (!value.contains(requiredSubstring)) {
      return errorMessage;
    }

    return null;
  }

  // Not contains validation
  static String? validateNotContains(
    String? value,
    String forbiddenSubstring,
    String errorMessage,
  ) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorRequiredField;
    }

    if (value.contains(forbiddenSubstring)) {
      return errorMessage;
    }

    return null;
  }

  // OTP/PIN validation
  static String? validateOTP(String? value, {int length = 6}) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorRequiredField;
    }

    if (value.length != length) {
      return 'Please enter a $length-digit code';
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Code must contain only numbers';
    }

    return null;
  }

  // Goal title validation
  static String? validateGoalTitle(String? value) {
    return combineValidators(value, [
      (v) => validateRequired(v, fieldName: 'Goal title'),
      (v) => validateLength(v, minLength: 3, maxLength: 100, fieldName: 'Goal title'),
    ]);
  }

  // Goal description validation
  static String? validateGoalDescription(String? value) {
    if (value != null && value.isNotEmpty) {
      return validateLength(value, maxLength: 500, fieldName: 'Goal description');
    }
    return null; // Description is optional
  }
}
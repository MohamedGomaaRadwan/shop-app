abstract class AppFormValidator {

  static String? requiredField(String? value, String message) {
    if (value?.isEmpty ?? true) return message;
    return null;
  }

}
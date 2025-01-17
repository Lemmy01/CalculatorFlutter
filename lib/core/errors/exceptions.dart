abstract class AppException implements Exception {
  final String message;

  AppException(this.message);
}

class EasyException extends AppException {
  EasyException(super.message);
}

class MediumException extends AppException {
  MediumException(type, super.message);
}

class HardException extends AppException {
  HardException(type, super.message);
}

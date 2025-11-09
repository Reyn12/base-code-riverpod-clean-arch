abstract class Failure {
  final String message;
  const Failure(this.message);

  // Getter untuk title
  String get title;

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  final int? statusCode;
  const ServerFailure(super.message, {this.statusCode});

  @override
  String get title => 'Server Error'; 
  @override
  String toString() {
    if (statusCode != null) {
      return '($statusCode) $message';
    }
    return message;
  }
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);

  @override
  String get title => 'Network Error'; 
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);

  @override
  String get title => 'Cache Error';
}
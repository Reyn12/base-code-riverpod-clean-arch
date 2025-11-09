import '../error/failures.dart';

extension ErrorExtension on Object {
  String get errorTitle {
    if (this is Failure) {
      return (this as Failure).title;
    }
    return 'Error';
  }
}
import 'package:movies_app/core/exceptions/exception.dart';
import 'package:movies_app/core/languages/translation_keys.g.dart';

class UnknownException extends BaseException {
  UnknownException([Object? error])
      : super(LocaleKeys.Errors_UnknownError, data: error);
}

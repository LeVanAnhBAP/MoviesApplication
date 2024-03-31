import 'package:movies_app/data/services/auth/auth.services.dart';

class AuthServicesImpl extends AuthServices {
  static const String _prefix = '@@oauth-token';

  final String key;

  const AuthServicesImpl._(
    this.key,
  );

  const AuthServicesImpl([String key = 'default']) : this._(key);
}

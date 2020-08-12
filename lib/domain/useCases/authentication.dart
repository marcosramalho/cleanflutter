import 'package:meta/meta.dart';

import '../entities/account_entity.dart';

abstract class Authentication {
  Future<AccountEntity> auth(AuthenticaionParams params);
}

class AuthenticaionParams {
  final String email;
  final String secret;

  AuthenticaionParams({
    @required this.email,
    @required this.secret
  });
}

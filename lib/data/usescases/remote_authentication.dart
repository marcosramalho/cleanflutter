import 'package:meta/meta.dart';

import '../../domain/useCases/useCases.dart';

import '../http/http.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({
    @required this.httpClient, 
    @required this.url
  });

  Future<void> auth(AuthenticaionParams params) async {
    final body = RemoteAuthenticaionParams.fromDomain(params).toJson();
    await httpClient.request(url: url, method: 'post', body: body);
  }
}

class RemoteAuthenticaionParams {
  final String email;
  final String password;

  RemoteAuthenticaionParams({
    @required this.email,
    @required this.password
  });

  factory RemoteAuthenticaionParams.fromDomain(AuthenticaionParams entity) => 
    RemoteAuthenticaionParams(email: entity.email, password: entity.secret);
  
  Map toJson() => { 'email': email, 'password': password };
}

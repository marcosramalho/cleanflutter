import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:cleanflutter/domain/useCases/authentication.dart';

import 'package:cleanflutter/data/usescases/usescases.dart';
import 'package:cleanflutter/data/http/http.dart';


class HttpClientSpy extends Mock implements HttpClient {}
void main() {
  RemoteAuthentication sut;
  HttpClientSpy httpClient;
  String url;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
  });
  test('Should call HttpClient with correct method', () async {
    final params = AuthenticaionParams(email: faker.internet.email(), secret: faker.internet.password());
    await sut.auth(params);
    
    verify(httpClient.request(
      url: url,
      method: 'post',
      body: {'email': params.email, 'password': params.secret}
    ));
  });
}
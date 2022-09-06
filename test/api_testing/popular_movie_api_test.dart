import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/data/constants/endpoint_strings.dart';

class MockDioClient extends Mock implements Dio {}

class MockDioResponse extends Mock implements Response {}

void main() {
  late Dio dio;
  setUp(() {
    dio = MockDioClient();
  });
  tearDown(() {
    dio.close();
  });
  group('api test for popular movie endpoint', () {
    test('should return list of popular movies for a successful api call',
        () async {
      final response = MockDioResponse();

      when(() => response.statusCode).thenReturn(200);
      when(() => response.data).thenReturn('[]');
      when(() => dio.get(any())).thenAnswer((_) async => response);
      try {
        await dio.get(popularMovieEndpoint);
      } catch (_) {}
      verify(
        () => dio.get('http://api.themoviedb.org/3/movie/popular?api_key='),
      ).called(1);
    });
  });
}

import 'package:flutter_testing/util/fetch_album.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'fetch_album_test.mocks.dart';

@GenerateMocks([http.Client])
void main(){

  group('Fetch album test', (){
  test('Returns an Album if the http call completes successfully', () async {
    final mockClient = MockClient();
    when(mockClient.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'))).thenAnswer((_) async{
      return http.Response('{"userId": 1, "id": 2, "title": "Mock"}', 200);
    });

    expect(await fetchAlbum(mockClient), isA<Album>());
  });

  test("throws an exception if the http call completes with error", (){
    MockClient mockClient = MockClient();
    when(mockClient.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'))).thenAnswer((_) async{
      return http.Response('Not Found', 404);
    });
    expect(fetchAlbum(mockClient), throwsException);
  });
  });

 
}
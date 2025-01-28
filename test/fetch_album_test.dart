import 'package:flutter_testing/util/fetch_album.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'fetch_album_test.mocks.dart';

@GenerateMocks([http.Client])
void main(){

  group('Fetch album test', (){

    late MockClient mockClient;

    //Setup Register the mock client before each test is run
    setUp((){
      mockClient = MockClient();
    });

    //TearDown Unregister the mock client after each test is run
    tearDown((){

    });

  test('Returns an Album if the http call completes successfully', () async {

    when(mockClient.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'))).thenAnswer((_) async{
      return http.Response('{"userId": 1, "id": 2, "title": "Mock"}', 200);
    });

    expect(await fetchAlbum(mockClient), isA<Album>()
    .having((album) => album.id, "id", 2)
    .having((album) => album.userId, "userId", 1)
    .having((album) => album.title, "title", "Mock"));
  });

  test("throws an exception if the http call completes with error", (){

    when(mockClient.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'))).thenAnswer((_) async{
      return http.Response('Not Found', 404);
    });
    expect(fetchAlbum(mockClient), throwsException);
  });
 

  test("Called get method on client once", (){

    when(mockClient.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'))).thenAnswer((_) async{
      return http.Response('{"userId": 1, "id": 2, "title": "Mock"}', 200);
    });

    fetchAlbum(mockClient);
    verify(mockClient.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'))).called(1);
  });
 });

}
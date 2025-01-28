import 'package:flutter/material.dart';
import 'package:flutter_testing/util/fetch_album.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child:Center(
          child: FutureBuilder<Album>(
            future: fetchAlbum(http.Client()),
            builder: (context, snapshot){
              if (snapshot.hasData && snapshot.data != null){
                Album album = snapshot.data!;

                return Card(
                  child: ListTile(
                    title: Text(album.title),
                    subtitle: Text("User id : ${album.userId}"),
                    leading: Text("${album.id}"),
                  ),
                );
              }else if (snapshot.hasError){
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            },
          )
        ) ,)
    );
  }
}
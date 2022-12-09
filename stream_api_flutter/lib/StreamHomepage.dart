import 'package:flutter/material.dart';
import 'package:stream_api_flutter/model.dart';

import 'apihelpher.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final jsondata = Livedata.getdata();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Api'),
      ),
      body: StreamBuilder<ProductDetailList>(
          stream: Livedata.getdata(),
          builder: (BuildContext context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return const Center(child: Text('Some error occurred!'));
                } else if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data!.data[index].title),
                          subtitle:
                              Text(snapshot.data!.data[index].description),
                        );
                      });
                }
            }
            return const Center(
              child: Text('data'),
            );
          }),
    );
  }
}

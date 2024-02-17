import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget(
      {super.key,
      required this.title,
      required this.message,
      required this.items});
  final List<String> items;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: const Key('key'),
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          // Add a key to the ListView. This makes it possible to
          // find the list and scroll through it in the tests.
          key: const Key('long_list'),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                items[index],
                // Add a key to the Text widget for each item. This makes
                // it possible to look for a particular item in the list
                // and verify that the text is correct
                key: Key('item_${index}_text'),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListPageState();
}

class ListPageState extends State<ListPage> {
  final _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextFormField(
          controller: _search,
          decoration: InputDecoration(
            labelText: 'Search',
            icon: Icon(Icons.search),
          ),
        ),

      ],
    );
  }

  @override
  void initState() {
    _search.addListener(() {});
    super.initState();
  }
}

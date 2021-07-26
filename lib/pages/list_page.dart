import 'package:assessment/api/list_api.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListPageState();
}

class ListPageState extends State<ListPage> {
  final _search = TextEditingController();
  ScrollController controller = ScrollController();
  var listAPI = ListApi();

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
        Align(
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed('/add');
            },
          ),
          alignment: Alignment.topRight,
        ),
      ],
    );
  }

  @override
  void initState() {
    _search.addListener(() {});
    controller.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      print("at the end of list");
      listAPI.getNextTodo();
    }
  }
}

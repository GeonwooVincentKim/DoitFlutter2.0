
import 'package:flutter/material.dart';

class SubDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SubDetail();
  }

}

class _SubDetail  extends State<SubDetail>{
  List<String> todoList = new List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    todoList.add('a');
    todoList.add('b');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sub Detail Example')),
      body: ListView.builder(
        itemBuilder: (context, index){
          return Card(
            child: InkWell(
              child: Text(todoList[index], style: TextStyle(fontSize: 30),),
              onTap: () {
                Navigator.of(context).pushNamed('/third', arguments: todoList[index]);
              },
            ),
          );
        },
        itemCount: todoList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNavigation(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
  
  void _addNavigation(BuildContext context) async {
    var result = await Navigator.of(context).pushNamed('/second');
    setState(() {
      todoList.add(result as String);
    });
  }
}
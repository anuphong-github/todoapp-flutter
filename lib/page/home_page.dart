import 'package:flutter/material.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/widget/add_todo_dialog_widget.dart';
import 'package:todoapp/widget/completed_list_widget.dart';
import 'package:todoapp/widget/todo_list_widget.dart';
class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context){
    final tabs = [
      TodoListWidget(),
      CompletedListWidget(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index)=>setState((){
          selectedIndex=index;
        }), items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Todos'
          ),
        BottomNavigationBarItem(
          icon:Icon(Icons.done,size: 30),
          label: 'Completed',
        )
      ],
      ),
      body:tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.black,
        onPressed:() => showDialog(
            builder: (context) => AddTodoDialogWidget(), context: context,
        barrierDismissible:false,
      ),
        child: Icon(Icons.add),

      ),

    );
  }
}

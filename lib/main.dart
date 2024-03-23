//
// import 'package:flutter/material.dart';
// import 'package:todoappsql/note_todo.dart';
// import 'package:todoappsql/to.dart';
// void main() {
//   runApp(MaterialApp(debugShowCheckedModeBanner: false, home: a()));
// }
//
// class a extends StatefulWidget {
//    a({super.key});
//
//   @override
//   State<a> createState() => _aState();
// }
//
// class _aState extends State<a> {
// final todolist=todo.todolist();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color(0xffFFEEEFF5),
//         appBar: AppBar(
//           backgroundColor: const Color(0xffFFEEEFF5),
//           elevation: 0,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Icon(
//                 Icons.menu,
//                 color: Colors.black,
//                 size: 30,
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
//                 height: 40,
//                 width: 40,
//                 child: ClipRRect(
//
//                   borderRadius: BorderRadius.circular(25),
//                   child: Image.asset("assets/list-icon-1437.png",),
//                 ),
//               )
//             ],
//           ),
//         ),
//         body: Stack(
//           children: [
//             Column(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Column(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20)),
//                         child: TextFormField(
//                           decoration: const InputDecoration(
//                             contentPadding: EdgeInsets.all(0),
//                             prefixIcon: Icon(
//                               Icons.search,
//                               color: Color(0xffFFEEEFF5),
//                               size: 20,
//                             ),
//                             prefixIconConstraints:
//                                 BoxConstraints(maxHeight: 20, minWidth: 25),
//                             border: InputBorder.none,
//                             hintText: "Search",
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: ListView(
//                     children: [
//                       Container(
//                         margin: const EdgeInsets.only(top: 50,bottom: 20),
//                         child: const Text("All Todos",style: TextStyle(
//                           fontSize: 30,fontWeight: FontWeight.w500
//                         ),),
//                       ),
//                      for(todo to in todolist)
//                        todoitem(to: to,onchhanged:(){
//                          setState(() {
//                            to.isdone!=to.isdone;
//                          });
//                        },ondelete:(){
//
//                        }
//                        //deleteItem(to.id)
//                        )],
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child:Row(
//                     children: [
//                       Expanded(child: Container(margin: EdgeInsets.only(
//                         bottom: 20,
//                         top: 20,
//                         left: 20,
//                         right: 20
//                       ),padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),decoration: BoxDecoration(
//                         color: Colors.white,
//                       boxShadow: [BoxShadow(color: Colors.grey,offset: Offset(0.0,0.0),blurRadius: 10.0,spreadRadius: 0.0)],
//                         borderRadius: BorderRadius.circular(10),
//
//                       ),child: TextField(
//                         decoration: InputDecoration(
//                           hintText: "Add a new todo item",
//                           border: InputBorder.none
//                         ),
//                       ),),),
// Container(
//   margin: EdgeInsets.only(bottom: 20,right: 20),
//   child: ElevatedButton(
//     child:Text( "+",style: TextStyle(
//       fontSize: 40
//     ),),  onPressed: () {
//
//
//
//   },
//     style: ElevatedButton.styleFrom(
//       primary: Color(0xff5F52EE),
//       minimumSize: Size(50, 50),
//       elevation: 10
//     ),
//   ),
// )
//                     ],
//                   ) ,
//                 )
//               ],
//             ),
//           ],
//         ));
//   }
// void handel(todo to){
//   setState(() {
//
//
// to.isdone!=to.isdone;
//   });
//
// }
//
// }
//
// class todoitem extends StatefulWidget {
//    todoitem({super.key,required this.to,required this.onchhanged,required this.ondelete});
//    Function onchhanged;
//   final ondelete;
//   final todo to;
//
//   @override
//   State<todoitem> createState() => _todoitemState();
// }
//
// class _todoitemState extends State<todoitem> {
//   final todolist=todo.todolist();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       child: ListTile(
//         onTap: (){
//
// widget.onchhanged (todo);
//
//         },
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
//         tileColor: Colors.white,
//         leading:Icon(widget.to.isdone ? Icons.check_box:Icons.check_box_outline_blank,color: const Color(0xff5F52EE),),
//
//         contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//         title: Text(widget.to.todotext!,style: TextStyle(fontSize: 15,color: const Color(0xff3A3A3A),decoration: widget.to.isdone?TextDecoration.lineThrough:TextDecoration.none),),
//         trailing: Container(padding: const EdgeInsets.all(0),margin: const EdgeInsets.symmetric(vertical: 5,),height: 35,width: 35,decoration: BoxDecoration(
//           color: const Color(0xffDA4848),
//           borderRadius: BorderRadius.circular(10),
//
//         ),child: IconButton(
//           color: Colors.white,
//           icon: const Icon(Icons.delete),
//           onPressed: (){
// print("delete");
//           },
//         ),),
//       ),
//     );
//   }
//
//    void deleteItem(String id) {
//      setState(() {
//        // Remove the item at the specified index from the list
//        todolist.removeWhere((element) => element.id==id);
//      });
//    }
// }
// class todo{
//   String? id;
//   String? todotext;
//   bool isdone;
//   todo({
//     required this.id,required this.todotext,  this.isdone=false
//   });
//
//   static List<todo> todolist(){
//     return [
//       todo(id: "01", todotext: "صلاه الفجر",isdone: true),
//       todo(id: "02", todotext: "قراءه قرءان",),
//       todo(id: "03", todotext: "مذاكره",),
//       todo(id: "04", todotext: "اروح الخمروبه",),
//       todo(id: "05", todotext: "انام",),
//       todo(id: "06", todotext: "اصحي افطر",),
//       todo(id: "07", todotext: "العشا والتراويح",),
//
//     ];
//   }}
import 'package:flutter/material.dart';
import 'package:todoappsql/splash.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
       // accentColor: Colors.deepPurpleAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimationScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<String> tasks = [];
  TextEditingController _taskController = TextEditingController();

  void addTask() {
    setState(() {
      String task = _taskController.text;
      tasks.add(task);
      _taskController.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App',style: TextStyle(
            color: Colors.white
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4.0,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(

                      ),
                      child: ListTile(

                        title: Text(
                          tasks[index],
                          style: TextStyle(fontSize: 16.0),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete,color: Colors.orange,),
                          onPressed: () => deleteTask(index),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: 'Task',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: addTask,
              child: Text('Add Task',style: TextStyle(
                color: Colors.white
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class note {
  final int? id;
  final String title;
  final String content;
  note({ this.id, required this.title, required this.content});
  Map<String, dynamic> tomap() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }
}

class todo {
  final int? id;
  final String title;
  final String value;
  todo({ this.id, required this.title, required this.value});
  Map<String, dynamic> tomap() {
    return {
      'id': id,
      'title': title,
      'value': value,
    };
  }
}

class sqlhelper {
  Database? database;
  getdatabase() async {
    if (database != null) {
      return database;
    } else {
      database = await initdatabase();
      return database;
    }
  }
   initdatabase() async {
    String path = join(await getDatabasesPath(), 'gdscbenha24.db');
    await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      Batch batch = db.batch();
      batch.execute('''
    create table notes 
    (id integer primary key,title text,content text) 
   
    ''');
      batch.execute('''
    create table todos 
    (id integer primary key,title text,value integer) 
   
    ''');
      batch.commit();
    });
  }
  insertnote(note no) async {
    Database db = await getdatabase();
    Batch batch = db.batch();
    batch.insert('note', no.tomap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    batch.commit();
  }
  Future inserttodo(todo to) async {
    Database db = await getdatabase();
    Batch batch = db.batch();
    batch.insert('todos', to.tomap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    batch.commit();
  }
  Future<List<Map>>loadnotes() async {
    Database db = await getdatabase();
    List<Map> maps = await db.query('notes');
    List<Map> genetratlist = [];
    // for(int i=0;i<maps.length;i++){
    //   Map<String,dynamic>generatedmap={
    //     'id':maps[i]['id'],
    //     'title':maps[i]['title'],
    //     'content':maps[i]['content'],
    //   };
    //   genetratlist.add(generatedmap);
    // }
    return List.generate(
        maps.length,
        (index) => note(
                id: maps[index]['id'],
                title: maps[index]['title'],
                content: maps[index]['content'])
            .tomap());
    // return genetratlist;
  }
  loaddata() async {
    Database db = await getdatabase();
    List<Map> maps = await db.query('todos');
    List<Map> genetratlist = [];
    // for(int i=0;i<maps.length;i++){
    //   Map<String,dynamic>generatedmap={
    //     'id':maps[i]['id'],
    //     'title':maps[i]['title'],
    //     'content':maps[i]['content'],
    //   };
    //   genetratlist.add(generatedmap);
    // }
    return List.generate(
        maps.length,
            (index) => todo(
            id: maps[index]['id'],
            title: maps[index]['title'],
            value: maps[index]['value'])
            .tomap());
    // return genetratlist;
  }
  Future update(note n)async{
    Database db=await getdatabase();
    db.update('notes',n.tomap(),
    where: 'id=?',
      whereArgs: [n.id]
    );
  }
  Future updatetodocheck(int id, int currentvalue)async{
    Database db=await getdatabase();
    Map<String,dynamic>values={
      'value':currentvalue==0?1:0,
    };
    await db.update("todos", values,where: 'id= ?',whereArgs: [id]);
  }
  Future deleteat(int id)async{
    Database db=await getdatabase();
  await  db.delete('notes',where: 'id=?',whereArgs: [id]);
  }
  Future deleteallnotes()async{
    Database db=await getdatabase();
   await db.delete('notes');
  }
  Future deletealltodo()async{
    Database db=await getdatabase();
    await db.delete('todos');
  }
}

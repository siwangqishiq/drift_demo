import 'dart:ffi';
import 'dart:io';

import 'package:drift_demo/data.dart';
import 'package:flutter/material.dart';
import 'package:sqlite3/open.dart';


///
/// windows版本打包发布后 需要手动拷贝sqlite3.dll 到输出包根目录下
///
void main() {
  open.overrideFor(OperatingSystem.windows, _openOnWindows);

  runApp(const MyApp());
}

DynamicLibrary _openOnWindows(){
  final scriptDir = File(Platform.script.toFilePath()).parent;
  final libraryNextToScript = File('${scriptDir.path}\\sqlite3.dll');
  print("libraryNextToScript : ${libraryNextToScript.path}");
  return DynamicLibrary.open(libraryNextToScript.path);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drift Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Drift Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  String? queryResult;

  late PersonDatabase mDatabase;

  @override
  void initState(){
    super.initState();
    
    mDatabase = PersonDatabase();
    // mDatabase.into(mDatabase.personTable)
    //   .insert(PersonTableCompanion.insert(name: "工藤新一" , age: 20 , desc: "")).then((v){
    //     print("insert 完成 $v");
    //     queryPerson();
    //   });
  }

  void queryPerson() async{
    // mDatabase.update(mDatabase.personTable).where((tbl) => )
    List<PersonTableData> list = await mDatabase.select(mDatabase.personTable).get();

    queryResult = "";
    for(var v in list){
      print("${v.id}  ${v.name} ${v.age} ${v.desc}");
      queryResult = (queryResult??"") + ("${v.id}  ${v.name} ${v.age} ${v.desc} \n");
    }

    print("数据集: $queryResult");
    setState(() {
    });
  }

  void insertData() {
    _counter++;

    mDatabase.into(mDatabase.personTable)
      .insert(
        PersonTableCompanion
        .insert(name: "工藤新一_$_counter" , age: 20 + _counter , desc: "高中生侦探$_counter"))
        .then((v){
          print("insert 完成 $v");
          queryPerson();
        }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(queryResult??""),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: insertData,
        tooltip: '插入数据',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


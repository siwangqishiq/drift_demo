import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'data.g.dart';
///
///   flutter packages pub run build_runner build 自动生成
///

//人员表
class PersonTable extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get desc => text()();
  IntColumn get age => integer()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();

    print("db路径: ${dbFolder.path}");
    final file = File(p.join(dbFolder.path, 'persondb.sqlite'));
    return NativeDatabase(file);
  });
}


@DriftDatabase(tables: [PersonTable])
class PersonDatabase extends _$PersonDatabase{
  PersonDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;  
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class PersonTableData extends DataClass implements Insertable<PersonTableData> {
  final int id;
  final String name;
  final String desc;
  final int age;
  PersonTableData(
      {required this.id,
      required this.name,
      required this.desc,
      required this.age});
  factory PersonTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PersonTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      desc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}desc'])!,
      age: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}age'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['desc'] = Variable<String>(desc);
    map['age'] = Variable<int>(age);
    return map;
  }

  PersonTableCompanion toCompanion(bool nullToAbsent) {
    return PersonTableCompanion(
      id: Value(id),
      name: Value(name),
      desc: Value(desc),
      age: Value(age),
    );
  }

  factory PersonTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      desc: serializer.fromJson<String>(json['desc']),
      age: serializer.fromJson<int>(json['age']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'desc': serializer.toJson<String>(desc),
      'age': serializer.toJson<int>(age),
    };
  }

  PersonTableData copyWith({int? id, String? name, String? desc, int? age}) =>
      PersonTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        desc: desc ?? this.desc,
        age: age ?? this.age,
      );
  @override
  String toString() {
    return (StringBuffer('PersonTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('desc: $desc, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, desc, age);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.desc == this.desc &&
          other.age == this.age);
}

class PersonTableCompanion extends UpdateCompanion<PersonTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> desc;
  final Value<int> age;
  const PersonTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.desc = const Value.absent(),
    this.age = const Value.absent(),
  });
  PersonTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String desc,
    required int age,
  })  : name = Value(name),
        desc = Value(desc),
        age = Value(age);
  static Insertable<PersonTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? desc,
    Expression<int>? age,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (desc != null) 'desc': desc,
      if (age != null) 'age': age,
    });
  }

  PersonTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? desc,
      Value<int>? age}) {
    return PersonTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      age: age ?? this.age,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('desc: $desc, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }
}

class $PersonTableTable extends PersonTable
    with TableInfo<$PersonTableTable, PersonTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PersonTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String?> desc = GeneratedColumn<String?>(
      'desc', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int?> age = GeneratedColumn<int?>(
      'age', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, desc, age];
  @override
  String get aliasedName => _alias ?? 'person_table';
  @override
  String get actualTableName => 'person_table';
  @override
  VerificationContext validateIntegrity(Insertable<PersonTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PersonTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PersonTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PersonTableTable createAlias(String alias) {
    return $PersonTableTable(_db, alias);
  }
}

abstract class _$PersonDatabase extends GeneratedDatabase {
  _$PersonDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PersonTableTable personTable = $PersonTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [personTable];
}

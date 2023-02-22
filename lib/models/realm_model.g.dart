// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class RealmIndexModel extends _RealmIndexModel
    with RealmEntity, RealmObjectBase, RealmObject {
  RealmIndexModel(
    int id,
    String title,
    bool archived, {
    Iterable<String> words = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'archived', archived);
    RealmObjectBase.set<RealmList<String>>(
        this, 'words', RealmList<String>(words));
  }

  RealmIndexModel._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  RealmList<String> get words =>
      RealmObjectBase.get<String>(this, 'words') as RealmList<String>;
  @override
  set words(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  bool get archived => RealmObjectBase.get<bool>(this, 'archived') as bool;
  @override
  set archived(bool value) => RealmObjectBase.set(this, 'archived', value);

  @override
  Stream<RealmObjectChanges<RealmIndexModel>> get changes =>
      RealmObjectBase.getChanges<RealmIndexModel>(this);

  @override
  RealmIndexModel freeze() =>
      RealmObjectBase.freezeObject<RealmIndexModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(RealmIndexModel._);
    return const SchemaObject(
        ObjectType.realmObject, RealmIndexModel, 'RealmIndexModel', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string, indexed: true),
      SchemaProperty('words', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('archived', RealmPropertyType.bool),
    ]);
  }
}

class RealmModel extends _RealmModel
    with RealmEntity, RealmObjectBase, RealmObject {
  RealmModel(
    int id,
    String title,
    bool archived, {
    Iterable<String> words = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'archived', archived);
    RealmObjectBase.set<RealmList<String>>(
        this, 'words', RealmList<String>(words));
  }

  RealmModel._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  RealmList<String> get words =>
      RealmObjectBase.get<String>(this, 'words') as RealmList<String>;
  @override
  set words(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  bool get archived => RealmObjectBase.get<bool>(this, 'archived') as bool;
  @override
  set archived(bool value) => RealmObjectBase.set(this, 'archived', value);

  @override
  Stream<RealmObjectChanges<RealmModel>> get changes =>
      RealmObjectBase.getChanges<RealmModel>(this);

  @override
  RealmModel freeze() => RealmObjectBase.freezeObject<RealmModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(RealmModel._);
    return const SchemaObject(
        ObjectType.realmObject, RealmModel, 'RealmModel', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('words', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('archived', RealmPropertyType.bool),
    ]);
  }
}

import 'dart:async';
import 'dart:io';

import 'package:benchmark_test/models/model.dart';
import 'package:benchmark_test/runners/main_runner/runner.dart';
import 'package:path_provider/path_provider.dart';
import 'package:realm/realm.dart';
import 'package:path/path.dart' as path;


import '../models/realm_model.dart' as realmModel;

class RealmRunner implements BenchmarkRunner {
  late Realm _realm;
  late String realmFile;

  @override
  Future<void> setUp() async {
    var dir = await getApplicationDocumentsDirectory();
    var homePath = path.join(dir.path, 'realmS');

    realmFile = homePath;

    final config = Configuration.local(
      [realmModel.RealmModel.schema,realmModel.RealmIndexModel.schema],
      path: realmFile,
    );
    _realm = Realm(config);
  }

  @override
  Future<void> tearDown() async {
    _realm.close();

    File(realmFile).deleteSync();
  }

  @override
  Future<int> insertSync(List<Model> models) async {
    final s = Stopwatch()..start();
    List<realmModel.RealmModel> realmModels =
        models.map(realmModel.modelToRealm).toList();

    _realm.write(() {
      _realm.addAll(realmModels);
    });

    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  Future<int> getSync(List<Model> models) async {
    List<realmModel.RealmModel> realmModels =
        models.map(realmModel.modelToRealm).toList();
    _realm.write(() {
      _realm.addAll<realmModel.RealmModel>(realmModels);
    });

    final s = Stopwatch()..start();

    final idsToGet =
        realmModels.map((e) => e.id).where((e) => e % 2 == 0).toList();

    for (var id in idsToGet) {
      realmModel.realmToModel(_realm.find<realmModel.RealmModel>(id)!);
    }
    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  Future<int> deleteSync(List<Model> models) async {
    List<realmModel.RealmModel> realmModels =
        models.map(realmModel.modelToRealm).toList();

    _realm.write(() {
      _realm.addAll<realmModel.RealmModel>(realmModels);
    });

    final s = Stopwatch()..start();

    final modelsToDelete = realmModels.where((e) => e.id % 2 == 0).toList();

    _realm.write(() {
      _realm.deleteMany(modelsToDelete);
    });

    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  // TODO: implement name
  String get name => 'realm';
}

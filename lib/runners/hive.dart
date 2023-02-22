import 'dart:io';

import 'package:hive/hive.dart';
import 'package:benchmark_test/models/hive_model.dart';
import 'package:benchmark_test/models/model.dart';
import 'package:benchmark_test/runners/main_runner/runner.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class HiveRunner implements BenchmarkRunner {
  @override
  String get name => 'Hive';

  @override
  Future<void> setUp() async {
    var dir = await getApplicationDocumentsDirectory();
    var homePath = path.join(dir.path, 'hive');

    if (await Directory(homePath).exists()) {
      await Directory(homePath).delete(recursive: true);
    }
    await Directory(homePath).create();

    Hive.init(homePath);

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(HiveAdapter());
    }

    await Hive.openBox<HiveTestModel>(name);
  }

  @override
  Future<void> tearDown() async {
    await Hive.close();
  }

  @override
  Future<int> insertSync(List<Model> models) async {
    var box = await Hive.openBox<HiveTestModel>(name);

    final s = Stopwatch()..start();
    final obModels = models.map(HiveTestModel.fromModel);

    await box.addAll(obModels);

    await box.close();

    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  Future<int> getSync(List<Model> models) async {
    var box = await Hive.openBox<HiveTestModel>(name);

    final obModels = models.map(HiveTestModel.fromModel);

    await box.addAll(obModels);

    final s = Stopwatch()..start();

    final idsToGet =
        obModels.map((e) => e.id).where((e) => e % 2 == 0).toList();

    for (var id in idsToGet) {
      box.get(id);
    }

    await box.close();
    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  Future<int> deleteSync(List<Model> models) async {
    var box = await Hive.openBox<HiveTestModel>(name);

    final obModels = models.map(HiveTestModel.fromModel);

    await box.addAll(obModels);

    final s = Stopwatch()..start();

    final idsToDelete =
        obModels.map((e) => e.id).where((e) => e % 2 == 0).toList();

    await box.deleteAll(idsToDelete);

    await box.close();

    s.stop();
    return s.elapsedMilliseconds;
  }
}

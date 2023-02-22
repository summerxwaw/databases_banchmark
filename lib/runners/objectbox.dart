import 'dart:async';

import 'package:benchmark_test/models/model.dart';
import 'package:benchmark_test/runners/main_runner/runner.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import '../models/objectbox_model.dart';
import '../objectbox.g.dart';

class ObjectBoxRunner implements BenchmarkRunner {
  late Store soreBox;

  @override
  Future<void> setUp() async {
    var dir = await getApplicationDocumentsDirectory();
    var homePath = path.join(dir.path, 'objectBox');

    soreBox = Store(
      getObjectBoxModel(),
      directory: homePath,
    );
  }

  @override
  Future<void> tearDown() async {
    soreBox.close();
  }

  @override
  Future<int> insertSync(List<Model> models) async {
    final s = Stopwatch()..start();
    final obModels = models.map(ObjectBoxModel.fromModel).toList();

    soreBox.box<ObjectBoxModel>().putMany(obModels);

    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  Future<int> getSync(List<Model> models) async {
    final obModels = models.map(ObjectBoxModel.fromModel).toList();

    soreBox.box<ObjectBoxModel>().putMany(obModels);

    final s = Stopwatch()..start();

    final idsToGet =
    obModels.map((e) => e.id).where((e) => e % 2 == 0).toList();

    soreBox.box<ObjectBoxModel>().getMany(idsToGet);

    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  Future<int> deleteSync(List<Model> models) async {
    final obModels = models.map(ObjectBoxModel.fromModel).toList();

    soreBox.box<ObjectBoxModel>().putMany(obModels);

    final s = Stopwatch()..start();

    final idsToDelete =
    obModels.map((e) => e.id).where((e) => e % 2 == 0).toList();

    soreBox.box<ObjectBoxModel>().removeMany(idsToDelete);

    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  // TODO: implement name
  String get name => 'objectBox';
}

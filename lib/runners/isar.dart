import 'dart:async';
import 'dart:io';

import 'package:benchmark_test/models/model.dart';
import 'package:benchmark_test/runners/main_runner/runner.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/isar_model.dart';



class IsarRunner implements BenchmarkRunner {
  late Isar _isar;

  @override
  Future<void> setUp() async {
    final tempDir = await getTemporaryDirectory();
    final benchDir = Directory('${tempDir.path}/bench')
      ..createSync(recursive: true);

    _isar = await Isar.open(
      [IsarModelSchema],
      directory: benchDir.path,
    );
  }

  @override
  Future<void> tearDown() async {
    _isar.close();
  }

  @override
  Future<int> insertSync(List<Model> models) async {
    final s = Stopwatch()..start();
    final isarModels = models.map(IsarModel.fromModel).toList();

    _isar.writeTxnSync(() {
      return _isar.isarModels.putAllSync(isarModels);
    });

    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  Future<int> getSync(List<Model> models) async {
    final isarModels = models.map(IsarModel.fromModel).toList();

    await _isar.writeTxn(() {
      return _isar.isarModels.putAll(isarModels);
    });


    final s = Stopwatch()..start();

    final idsToGet =
    isarModels.map((e) => e.id).where((e) => e % 2 == 0).toList();

    _isar.writeTxnSync(() {
      return _isar.isarModels.getAllSync(idsToGet);
    });


    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  Future<int> deleteSync(List<Model> models) async {
    final isarModels = models.map(IsarModel.fromModel).toList();

    await _isar.writeTxn(() {
      return _isar.isarModels.putAll(isarModels);
    });

    final s = Stopwatch()..start();

    final idsToGet =
    isarModels.map((e) => e.id).where((e) => e % 2 == 0).toList();

    _isar.writeTxnSync(() {
      return _isar.isarModels.deleteAllSync(idsToGet);
    }, silent: false);

    s.stop();
    return s.elapsedMilliseconds;
  }

  @override
  // TODO: implement name
  String get name => 'isar';
}

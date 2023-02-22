import 'package:benchmark_test/runners/hive.dart';
import 'package:benchmark_test/runners/isar.dart';
import 'package:benchmark_test/runners/objectbox.dart';
import 'package:benchmark_test/runners/realm.dart';
import 'package:benchmark_test/runners/main_runner/runner.dart';
import 'package:logging/logging.dart';

import 'models/model.dart';

class Result {
  final BenchmarkRunner runner;
  int modelTime = 0;

  Result(this.runner);
}

final runners = [
  ObjectBoxRunner(),
  IsarRunner(),
  HiveRunner(),
  RealmRunner(),
];

List<Result> _createResults() {
  return runners.map((r) => Result(r)).toList();
}

Logger _logger = Logger('Benchmark');

Future<List<Result>> benchmarkRead(int count) async {
  _logger.fine('Benchmarking read($count)');

  var results = _createResults();

  final models = Model.generateModels(count, false);

  for (var result in results) {
    _logger.info('Running ${result.runner.name}...');
    await result.runner.setUp();

    result.modelTime = await result.runner.getSync(models);
  }

  for (var result in results) {
    await result.runner.tearDown();
  }

  return results;
}

Future<List<Result>> benchmarkWrite(int count) async {
  _logger.fine('Benchmarking write($count)');

  final results = _createResults();

  final models = Model.generateModels(count, false);

  for (var result in results) {
    _logger.info('Running ${result.runner.name}...');
    await result.runner.setUp();

    result.modelTime = await result.runner.insertSync(models);

    await result.runner.tearDown();
  }

  return results;
}

Future<List<Result>> benchmarkDelete(int count) async {
  _logger.fine('Benchmarking delete($count)');

  final results = _createResults();
  final models = Model.generateModels(count, false);

  for (var result in results) {
    _logger.info('Running ${result.runner.name}...');
    await result.runner.setUp();

    result.modelTime = await result.runner.deleteSync(models);
  }

  for (var result in results) {
    await result.runner.tearDown();
  }

  return results;
}
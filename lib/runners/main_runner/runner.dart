import 'package:benchmark_test/models/model.dart';

abstract class BenchmarkRunner {
  String get name;

  Future<void> setUp();
  Future<void> tearDown();

  Future<int> insertSync(List<Model> models);
  Future<int> getSync(List<Model> models);
  Future<int> deleteSync(List<Model> models);
}

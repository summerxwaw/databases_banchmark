import 'package:hive/hive.dart';
import 'package:objectbox/objectbox.dart';

import 'model.dart';

part 'hive_model.g.dart';

@HiveType(typeId: 0, adapterName: "HiveAdapter")
class HiveTestModel {
  @HiveField(0)
  int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final List<String> words;

  @HiveField(3)
  final bool archived;

  HiveTestModel({
    required this.id,
    required this.title,
    required this.words,
    required this.archived,
  });

  factory HiveTestModel.fromModel(Model model) {
    return HiveTestModel(
      id: model.id,
      title: model.title,
      words: model.words,
      archived: model.archived,
    );
  }
}
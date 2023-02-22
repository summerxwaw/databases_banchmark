import 'package:isar/isar.dart';

import 'model.dart';

part 'isar_model.g.dart';

@Collection()
class IsarModel {
  final Id id;

  @Index()
  final String title;

  final List<String> words;

  @Index()
  final bool archived;

  const IsarModel({
    required this.id,
    required this.title,
    required this.words,
    required this.archived,
  });

  factory IsarModel.fromModel(Model model) {
    return IsarModel(
      id: model.id,
      title: model.title,
      words: model.words,
      archived: model.archived,
    );
  }
}

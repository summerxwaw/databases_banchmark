import 'package:objectbox/objectbox.dart';

import 'model.dart';

@Entity()
class ObjectBoxModel {
  @Id(assignable: true)
  int id;

  final String title;

  final List<String> words;

  @Index()
  final bool archived;

  ObjectBoxModel({
    required this.id,
    required this.title,
    required this.words,
    required this.archived,
  });

  factory ObjectBoxModel.fromModel(Model model) {
    return ObjectBoxModel(
      id: model.id,
      title: model.title,
      words: model.words,
      archived: model.archived,
    );
  }
}

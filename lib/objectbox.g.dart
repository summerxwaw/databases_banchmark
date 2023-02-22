// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'models/objectbox_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(2, 7316547477110486679),
      name: 'ObjectBoxModel',
      lastPropertyId: const IdUid(4, 7508946436596665703),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6462575333468478270),
            name: 'id',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 748920352853802990),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5156212260433795664),
            name: 'words',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 7508946436596665703),
            name: 'archived',
            type: 1,
            flags: 8,
            indexId: const IdUid(3, 3705586620935944750))
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(3, 3288475771677481496),
      lastIndexId: const IdUid(4, 1264821477944918953),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [2581665673923436406, 3288475771677481496],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        643454751582475117,
        3450518197477734499,
        6659250921309547362,
        7222192164271918285,
        5140968088825704709,
        5663321415870680974,
        4009757969923792538,
        847408795094948139
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    ObjectBoxModel: EntityDefinition<ObjectBoxModel>(
        model: _entities[0],
        toOneRelations: (ObjectBoxModel object) => [],
        toManyRelations: (ObjectBoxModel object) => {},
        getId: (ObjectBoxModel object) => object.id,
        setId: (ObjectBoxModel object, int id) {
          object.id = id;
        },
        objectToFB: (ObjectBoxModel object, fb.Builder fbb) {
          final titleOffset = fbb.writeString(object.title);
          final wordsOffset = fbb.writeList(
              object.words.map(fbb.writeString).toList(growable: false));
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addOffset(2, wordsOffset);
          fbb.addBool(3, object.archived);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ObjectBoxModel(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              title: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              words: const fb.ListReader<String>(
                      fb.StringReader(asciiOptimization: true),
                      lazy: false)
                  .vTableGet(buffer, rootOffset, 8, []),
              archived: const fb.BoolReader()
                  .vTableGet(buffer, rootOffset, 10, false));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [ObjectBoxModel] entity fields to define ObjectBox queries.
class ObjectBoxModel_ {
  /// see [ObjectBoxModel.id]
  static final id =
      QueryIntegerProperty<ObjectBoxModel>(_entities[0].properties[0]);

  /// see [ObjectBoxModel.title]
  static final title =
      QueryStringProperty<ObjectBoxModel>(_entities[0].properties[1]);

  /// see [ObjectBoxModel.words]
  static final words =
      QueryStringVectorProperty<ObjectBoxModel>(_entities[0].properties[2]);

  /// see [ObjectBoxModel.archived]
  static final archived =
      QueryBooleanProperty<ObjectBoxModel>(_entities[0].properties[3]);
}
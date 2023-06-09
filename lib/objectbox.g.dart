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

import 'cache/cache.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 7194707144786448258),
      name: 'Cache',
      lastPropertyId: const IdUid(3, 2420286019822419411),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2299842796373171279),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8030404839697770095),
            name: 'key',
            type: 9,
            flags: 2048,
            indexId: const IdUid(1, 141012316670183745)),
        ModelProperty(
            id: const IdUid(3, 2420286019822419411),
            name: 'byteList',
            type: 23,
            flags: 0)
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
      lastEntityId: const IdUid(1, 7194707144786448258),
      lastIndexId: const IdUid(1, 141012316670183745),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Cache: EntityDefinition<Cache>(
        model: _entities[0],
        toOneRelations: (Cache object) => [],
        toManyRelations: (Cache object) => {},
        getId: (Cache object) => object.id,
        setId: (Cache object, int id) {
          object.id = id;
        },
        objectToFB: (Cache object, fb.Builder fbb) {
          final keyOffset = fbb.writeString(object.key);
          final byteListOffset = fbb.writeListInt8(object.byteList);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, keyOffset);
          fbb.addOffset(2, byteListOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Cache(
              key: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              byteList: const fb.ListReader<int>(fb.Int8Reader(), lazy: false)
                  .vTableGet(buffer, rootOffset, 8, []))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Cache] entity fields to define ObjectBox queries.
class Cache_ {
  /// see [Cache.id]
  static final id = QueryIntegerProperty<Cache>(_entities[0].properties[0]);

  /// see [Cache.key]
  static final key = QueryStringProperty<Cache>(_entities[0].properties[1]);

  /// see [Cache.byteList]
  static final byteList =
      QueryByteVectorProperty<Cache>(_entities[0].properties[2]);
}

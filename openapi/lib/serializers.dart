library serializers;

import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:openapi/model/foto.dart';
import 'package:openapi/model/inline_object.dart';


part 'serializers.g.dart';

@SerializersFor(const [
Foto,
InlineObject,

])

//allow all models to be serialized within a list
Serializers serializers = (_$serializers.toBuilder()
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(Foto)]),
() => new ListBuilder<Foto>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(InlineObject)]),
() => new ListBuilder<InlineObject>())

..add(Iso8601DateTimeSerializer())
).build();

Serializers standardSerializers =
(serializers.toBuilder()
..addPlugin(StandardJsonPlugin())).build();

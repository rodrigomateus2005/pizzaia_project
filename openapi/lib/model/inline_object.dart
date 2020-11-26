import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'inline_object.g.dart';

abstract class InlineObject implements Built<InlineObject, InlineObjectBuilder> {

    
        @nullable
    @BuiltValueField(wireName: r'uuid')
    String get uuid;
    
        @nullable
    @BuiltValueField(wireName: r'favorita')
    bool get favorita;
    
        @nullable
    @BuiltValueField(wireName: r'ContentType')
    String get contentType;
    
        @nullable
    @BuiltValueField(wireName: r'ContentDisposition')
    String get contentDisposition;
    
        @nullable
    @BuiltValueField(wireName: r'Headers')
    BuiltMap<String, BuiltList<String>> get headers;
    
        @nullable
    @BuiltValueField(wireName: r'Length')
    int get length;
    
        @nullable
    @BuiltValueField(wireName: r'Name')
    String get name;
    
        @nullable
    @BuiltValueField(wireName: r'FileName')
    String get fileName;

    // Boilerplate code needed to wire-up generated code
    InlineObject._();

    factory InlineObject([updates(InlineObjectBuilder b)]) = _$InlineObject;
    static Serializer<InlineObject> get serializer => _$inlineObjectSerializer;

}


import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'foto.g.dart';

abstract class Foto implements Built<Foto, FotoBuilder> {

    
        @nullable
    @BuiltValueField(wireName: r'uuid')
    String get uuid;
    
        @nullable
    @BuiltValueField(wireName: r'favorita')
    bool get favorita;

    // Boilerplate code needed to wire-up generated code
    Foto._();

    factory Foto([updates(FotoBuilder b)]) = _$Foto;
    static Serializer<Foto> get serializer => _$fotoSerializer;

}


// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Foto> _$fotoSerializer = new _$FotoSerializer();

class _$FotoSerializer implements StructuredSerializer<Foto> {
  @override
  final Iterable<Type> types = const [Foto, _$Foto];
  @override
  final String wireName = 'Foto';

  @override
  Iterable<Object> serialize(Serializers serializers, Foto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.uuid != null) {
      result
        ..add('uuid')
        ..add(serializers.serialize(object.uuid,
            specifiedType: const FullType(String)));
    }
    if (object.favorita != null) {
      result
        ..add('favorita')
        ..add(serializers.serialize(object.favorita,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  Foto deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FotoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'uuid':
          result.uuid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'favorita':
          result.favorita = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$Foto extends Foto {
  @override
  final String uuid;
  @override
  final bool favorita;

  factory _$Foto([void Function(FotoBuilder) updates]) =>
      (new FotoBuilder()..update(updates)).build();

  _$Foto._({this.uuid, this.favorita}) : super._();

  @override
  Foto rebuild(void Function(FotoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FotoBuilder toBuilder() => new FotoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Foto && uuid == other.uuid && favorita == other.favorita;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, uuid.hashCode), favorita.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Foto')
          ..add('uuid', uuid)
          ..add('favorita', favorita))
        .toString();
  }
}

class FotoBuilder implements Builder<Foto, FotoBuilder> {
  _$Foto _$v;

  String _uuid;
  String get uuid => _$this._uuid;
  set uuid(String uuid) => _$this._uuid = uuid;

  bool _favorita;
  bool get favorita => _$this._favorita;
  set favorita(bool favorita) => _$this._favorita = favorita;

  FotoBuilder();

  FotoBuilder get _$this {
    if (_$v != null) {
      _uuid = _$v.uuid;
      _favorita = _$v.favorita;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Foto other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Foto;
  }

  @override
  void update(void Function(FotoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Foto build() {
    final _$result = _$v ?? new _$Foto._(uuid: uuid, favorita: favorita);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

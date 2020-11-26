// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inline_object.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InlineObject> _$inlineObjectSerializer =
    new _$InlineObjectSerializer();

class _$InlineObjectSerializer implements StructuredSerializer<InlineObject> {
  @override
  final Iterable<Type> types = const [InlineObject, _$InlineObject];
  @override
  final String wireName = 'InlineObject';

  @override
  Iterable<Object> serialize(Serializers serializers, InlineObject object,
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
    if (object.contentType != null) {
      result
        ..add('ContentType')
        ..add(serializers.serialize(object.contentType,
            specifiedType: const FullType(String)));
    }
    if (object.contentDisposition != null) {
      result
        ..add('ContentDisposition')
        ..add(serializers.serialize(object.contentDisposition,
            specifiedType: const FullType(String)));
    }
    if (object.headers != null) {
      result
        ..add('Headers')
        ..add(serializers.serialize(object.headers,
            specifiedType: const FullType(BuiltMap, const [
              const FullType(String),
              const FullType(BuiltList, const [const FullType(String)])
            ])));
    }
    if (object.length != null) {
      result
        ..add('Length')
        ..add(serializers.serialize(object.length,
            specifiedType: const FullType(int)));
    }
    if (object.name != null) {
      result
        ..add('Name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.fileName != null) {
      result
        ..add('FileName')
        ..add(serializers.serialize(object.fileName,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  InlineObject deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InlineObjectBuilder();

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
        case 'ContentType':
          result.contentType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ContentDisposition':
          result.contentDisposition = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Headers':
          result.headers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(BuiltList, const [const FullType(String)])
              ])));
          break;
        case 'Length':
          result.length = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'Name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'FileName':
          result.fileName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$InlineObject extends InlineObject {
  @override
  final String uuid;
  @override
  final bool favorita;
  @override
  final String contentType;
  @override
  final String contentDisposition;
  @override
  final BuiltMap<String, BuiltList<String>> headers;
  @override
  final int length;
  @override
  final String name;
  @override
  final String fileName;

  factory _$InlineObject([void Function(InlineObjectBuilder) updates]) =>
      (new InlineObjectBuilder()..update(updates)).build();

  _$InlineObject._(
      {this.uuid,
      this.favorita,
      this.contentType,
      this.contentDisposition,
      this.headers,
      this.length,
      this.name,
      this.fileName})
      : super._();

  @override
  InlineObject rebuild(void Function(InlineObjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InlineObjectBuilder toBuilder() => new InlineObjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InlineObject &&
        uuid == other.uuid &&
        favorita == other.favorita &&
        contentType == other.contentType &&
        contentDisposition == other.contentDisposition &&
        headers == other.headers &&
        length == other.length &&
        name == other.name &&
        fileName == other.fileName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, uuid.hashCode), favorita.hashCode),
                            contentType.hashCode),
                        contentDisposition.hashCode),
                    headers.hashCode),
                length.hashCode),
            name.hashCode),
        fileName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InlineObject')
          ..add('uuid', uuid)
          ..add('favorita', favorita)
          ..add('contentType', contentType)
          ..add('contentDisposition', contentDisposition)
          ..add('headers', headers)
          ..add('length', length)
          ..add('name', name)
          ..add('fileName', fileName))
        .toString();
  }
}

class InlineObjectBuilder
    implements Builder<InlineObject, InlineObjectBuilder> {
  _$InlineObject _$v;

  String _uuid;
  String get uuid => _$this._uuid;
  set uuid(String uuid) => _$this._uuid = uuid;

  bool _favorita;
  bool get favorita => _$this._favorita;
  set favorita(bool favorita) => _$this._favorita = favorita;

  String _contentType;
  String get contentType => _$this._contentType;
  set contentType(String contentType) => _$this._contentType = contentType;

  String _contentDisposition;
  String get contentDisposition => _$this._contentDisposition;
  set contentDisposition(String contentDisposition) =>
      _$this._contentDisposition = contentDisposition;

  MapBuilder<String, BuiltList<String>> _headers;
  MapBuilder<String, BuiltList<String>> get headers =>
      _$this._headers ??= new MapBuilder<String, BuiltList<String>>();
  set headers(MapBuilder<String, BuiltList<String>> headers) =>
      _$this._headers = headers;

  int _length;
  int get length => _$this._length;
  set length(int length) => _$this._length = length;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _fileName;
  String get fileName => _$this._fileName;
  set fileName(String fileName) => _$this._fileName = fileName;

  InlineObjectBuilder();

  InlineObjectBuilder get _$this {
    if (_$v != null) {
      _uuid = _$v.uuid;
      _favorita = _$v.favorita;
      _contentType = _$v.contentType;
      _contentDisposition = _$v.contentDisposition;
      _headers = _$v.headers?.toBuilder();
      _length = _$v.length;
      _name = _$v.name;
      _fileName = _$v.fileName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InlineObject other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InlineObject;
  }

  @override
  void update(void Function(InlineObjectBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InlineObject build() {
    _$InlineObject _$result;
    try {
      _$result = _$v ??
          new _$InlineObject._(
              uuid: uuid,
              favorita: favorita,
              contentType: contentType,
              contentDisposition: contentDisposition,
              headers: _headers?.build(),
              length: length,
              name: name,
              fileName: fileName);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'headers';
        _headers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'InlineObject', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

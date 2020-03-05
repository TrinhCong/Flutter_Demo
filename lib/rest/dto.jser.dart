// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$RestErrorDetailSerializer
    implements Serializer<RestErrorDetail> {
  @override
  Map<String, dynamic> toMap(RestErrorDetail model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'code', model.code);
    setMapValue(ret, 'type', model.type);
    setMapValue(ret, 'message', model.message);
    return ret;
  }

  @override
  RestErrorDetail fromMap(Map map) {
    if (map == null) return null;
    final obj = RestErrorDetail();
    obj.code = map['code'] as int;
    obj.type = map['type'] as String;
    obj.message = map['message'] as String;
    return obj;
  }
}

abstract class _$RestBaseSerializer implements Serializer<RestBase> {
  Serializer<RestErrorDetail> __restErrorDetailSerializer;
  Serializer<RestErrorDetail> get _restErrorDetailSerializer =>
      __restErrorDetailSerializer ??= RestErrorDetailSerializer();
  @override
  Map<String, dynamic> toMap(RestBase model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'status', model.status);
    setMapValue(
        ret,
        'errors',
        codeIterable(model.errors,
            (val) => _restErrorDetailSerializer.toMap(val as RestErrorDetail)));
    return ret;
  }

  @override
  RestBase fromMap(Map map) {
    if (map == null) return null;
    final obj = RestBase();
    obj.status = map['status'] as String;
    obj.errors = codeIterable<RestErrorDetail>(map['errors'] as Iterable,
        (val) => _restErrorDetailSerializer.fromMap(val as Map));
    return obj;
  }
}

abstract class _$CategorySerializer implements Serializer<Category> {
  @override
  Map<String, dynamic> toMap(Category model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'category_id', model.category_id);
    setMapValue(ret, 'category_name', model.category_name);
    setMapValue(ret, 'description', model.description);
    return ret;
  }

  @override
  Category fromMap(Map map) {
    if (map == null) return null;
    final obj = Category();
    obj.category_id = map['category_id'] as int;
    obj.category_name = map['category_name'] as String;
    obj.description = map['description'] as String;
    return obj;
  }
}

abstract class _$CategoryResponseSerializer
    implements Serializer<CategoryResponse> {
  Serializer<Category> __categorySerializer;
  Serializer<Category> get _categorySerializer =>
      __categorySerializer ??= CategorySerializer();
  Serializer<RestErrorDetail> __restErrorDetailSerializer;
  Serializer<RestErrorDetail> get _restErrorDetailSerializer =>
      __restErrorDetailSerializer ??= RestErrorDetailSerializer();
  @override
  Map<String, dynamic> toMap(CategoryResponse model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'data', _categorySerializer.toMap(model.data));
    setMapValue(ret, 'status', model.status);
    setMapValue(
        ret,
        'errors',
        codeIterable(model.errors,
            (val) => _restErrorDetailSerializer.toMap(val as RestErrorDetail)));
    return ret;
  }

  @override
  CategoryResponse fromMap(Map map) {
    if (map == null) return null;
    final obj = CategoryResponse();
    obj.data = _categorySerializer.fromMap(map['data'] as Map);
    obj.status = map['status'] as String;
    obj.errors = codeIterable<RestErrorDetail>(map['errors'] as Iterable,
        (val) => _restErrorDetailSerializer.fromMap(val as Map));
    return obj;
  }
}

abstract class _$CategoryListResponseSerializer
    implements Serializer<CategoryListResponse> {
  Serializer<Category> __categorySerializer;
  Serializer<Category> get _categorySerializer =>
      __categorySerializer ??= CategorySerializer();
  Serializer<RestErrorDetail> __restErrorDetailSerializer;
  Serializer<RestErrorDetail> get _restErrorDetailSerializer =>
      __restErrorDetailSerializer ??= RestErrorDetailSerializer();
  @override
  Map<String, dynamic> toMap(CategoryListResponse model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(
        ret,
        'data',
        codeIterable(
            model.data, (val) => _categorySerializer.toMap(val as Category)));
    setMapValue(ret, 'status', model.status);
    setMapValue(
        ret,
        'errors',
        codeIterable(model.errors,
            (val) => _restErrorDetailSerializer.toMap(val as RestErrorDetail)));
    return ret;
  }

  @override
  CategoryListResponse fromMap(Map map) {
    if (map == null) return null;
    final obj = CategoryListResponse();
    obj.data = codeIterable<Category>(map['data'] as Iterable,
        (val) => _categorySerializer.fromMap(val as Map));
    obj.status = map['status'] as String;
    obj.errors = codeIterable<RestErrorDetail>(map['errors'] as Iterable,
        (val) => _restErrorDetailSerializer.fromMap(val as Map));
    return obj;
  }
}

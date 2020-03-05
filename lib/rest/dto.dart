import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'dto.jser.dart';

/*============ REST BASE ===========*/

class RestErrorDetail {
  int code;
  String type;
  String message;

  RestErrorDetail({this.code, this.message, this.type});

  Map<String, dynamic> toJson() => serializer.toMap(this);

  static final serializer = RestErrorDetailSerializer();

  static RestErrorDetail fromMap(Map map) => serializer.fromMap(map);

  String toString() => toJson().toString();
}

@GenSerializer()
class RestErrorDetailSerializer extends Serializer<RestErrorDetail>
    with _$RestErrorDetailSerializer {}

class RestBase {
  String status;
  List<RestErrorDetail> errors;

  RestBase({this.status, this.errors = const []});

  Map<String, dynamic> toJson() => serializer.toMap(this);

  static final serializer = RestBaseSerializer();

  static RestBase fromMap(Map map) => serializer.fromMap(map);

  String toString() => toJson().toString();
}

@GenSerializer()
class RestBaseSerializer extends Serializer<RestBase>
    with _$RestBaseSerializer {}

/*============ USER ===========*/

class Category {
  int category_id;
  String category_name;
  String description;

  Category({this.category_id=0, this.category_name="", this.description=""});

  Map<String, dynamic> toJson() => serializer.toMap(this);

  static final serializer = CategorySerializer();

  static Category fromMap(Map map) => serializer.fromMap(map);

  String toString() => toJson().toString();
}

@GenSerializer()
class CategorySerializer extends Serializer<Category>
    with _$CategorySerializer {}
    
class CategoryResponse extends RestBase {
  Category data;

  CategoryResponse({this.data});

  Map<String, dynamic> toJson() => serializer.toMap(this);

  static final serializer = CategoryResponseSerializer();

  static CategoryResponse fromMap(Map map) => serializer.fromMap(map);

  String toString() => toJson().toString();
}

@GenSerializer()
class CategoryResponseSerializer extends Serializer<CategoryResponse>
    with _$CategoryResponseSerializer {}

class CategoryListResponse extends RestBase {
  List<Category> data;

  CategoryListResponse({this.data});

  Map<String, dynamic> toJson() => serializer.toMap(this);

  static final serializer = CategoryListResponseSerializer();

  static CategoryListResponse fromMap(Map map) => serializer.fromMap(map);

  String toString() => toJson().toString();
}
@GenSerializer()
class CategoryListResponseSerializer extends Serializer<CategoryListResponse>
    with _$CategoryListResponseSerializer {}
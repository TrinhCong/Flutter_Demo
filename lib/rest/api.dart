import 'dart:async';

import 'package:jaguar_resty/interceptor/interceptors.dart';
import 'package:jaguar_resty/jaguar_resty.dart' as resty;
import 'package:jaguar_resty/response/response.dart';
import 'package:jaguar_resty/routes/routes.dart';
import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/client/client.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:logging/logging.dart';

import 'dto.dart';

part 'api.jretro.dart';

class LogInterceptor extends Interceptor {
  static final _log = Logger('LogInterceptor');

  @override
  FutureOr<void> before(RouteBase route) {
    var query = '?';
    route.getQuery.forEach((key, value) => query += '$key=$value&');
    _log.fine('==> ${route.getUrl}$query');
    route.getHeaders.forEach((key, value) => _log.fine('==> $key: $value'));
    if (route is RouteWithBody) {
      _log.fine('\n${route.getBody()}');
    }
    return super.before(route);
  }

  @override
  FutureOr after(StringResponse response) {
    _log.fine('<== ${response.statusCode} ${response.request.url}');
    response.headers.forEach((key, value) => _log.fine('<== $key: $value'));
    _log.fine('\n${response.body}');
    return response;
  } 
}

class API {
  static resty.Route _route = resty.Route("http://192.168.31.120:9000")
      .before(LogInterceptor());
   static resty.Before logRequest() => (resty.RouteBase route) async {};

  static CategoryAPI _dataAPI;
  static CategoryAPI getCategoryAPI() {
    if (_dataAPI == null) {
      _dataAPI = new CategoryAPI(_route)
        ..jsonConverter = JsonRepo(serializers: [
          RestBaseSerializer()
        ]);
    }
    return _dataAPI;
  }

}

@GenApiClient(path: "/api/data")
class CategoryAPI extends ApiClient with _$CategoryAPIClient {
  final resty.Route base;
  CategoryAPI(this.base);

  @GetReq(path: "/getAll")
  Future<RestBase> getAll();
  
}

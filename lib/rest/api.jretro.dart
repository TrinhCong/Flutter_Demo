// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$CategoryAPIClient implements ApiClient {
  final String basePath = "/api/data";
  Future<RestBase> getAll() async {
    var req = base.get.path(basePath).path("/getAll");
    return req.go(throwOnErr: true).map(decodeOne);
  }
}

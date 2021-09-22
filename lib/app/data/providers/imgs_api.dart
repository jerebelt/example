import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';
import 'package:urbe_example/app/data/models/image.dart';

class ImgsAPI {
  final Dio.Dio _dio = Get.find<Dio.Dio>();

  Future<List<Img>> getImgs() async {
    final Dio.Response response = await _dio.get('https://picsum.photos/v2/list');
    return (response.data as List).map((e) => Img.fromJson(e)).toList();
  }

  Future<List<Img>> getImgsPerPage(int page) async {
    final Dio.Response response = await _dio.get(
      'https://picsum.photos/v2/list',
      queryParameters: {
        'page': page,
        'limit': 10,
      },
    );
    return (response.data as List).map((e) => Img.fromJson(e)).toList();
  }
}

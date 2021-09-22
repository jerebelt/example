import 'package:get/get.dart';
import 'package:urbe_example/app/data/models/image.dart';
import 'package:urbe_example/app/data/providers/auth_api.dart';
import 'package:urbe_example/app/data/providers/imgs_api.dart';
import 'package:urbe_example/app/data/providers/local_auth.dart';
import 'package:urbe_example/app/routes/app_routes.dart';

class HomeController extends GetxController {
  final ImgsAPI _imgsRepository = Get.find<ImgsAPI>();
  final LocalAuth _localAuth = Get.find<LocalAuth>();

  int _page = 1;
  int _totalPages = 1;
  bool _nextPage = true;
  bool _lastPage = false;
  bool loading = true;
  String username = '';

  List<Img> _imgs = [];
  List<Img> get imgs => _page == _totalPages ? _imgs.sublist((_page - 1) * 10) : _imgs.sublist((_page - 1) * 10, ((_page - 1) * 10) + 10);

  bool get nextPage => _page < _totalPages;
  bool get lastPage => _page > 1;

  nextImgs() {
    if (_page < _totalPages) _page++;
    update();
  }

  lastImgs() {
    if (_page > 1) _page--;
    update();
  }

  @override
  void onReady() {
    load();
  }

  Future<void> logOut() async {
    Get.back();
    await _localAuth.deleteSession();
    Get.offNamedUntil(AppRoutes.SPLASH, (_) => false);
  }

  Future<void> reload() async {
    _page = 1;
    _totalPages = 1;
    _nextPage = true;
    _lastPage = false;
    loading = true;
    _imgs = [];
    update();
    load();
  }

  Future<void> load() async {
    try {
      if (!loading) {
        loading = false;
        update();
      }
      username = await _localAuth.getSession();
      _imgs = await _imgsRepository.getImgs();
      _totalPages = (_imgs.length / 10).round();
      _nextPage = _totalPages > 1;
      loading = false;
      update();
    } catch (e) {
      print(e);
    }
  }
}

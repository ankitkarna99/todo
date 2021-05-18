import 'package:dio/dio.dart';
import 'package:todoapp/core/controllers/base_controller.dart';
import 'package:todoapp/core/services/dio_service.dart';

class PhotoModel {
  int id;
  String title;
  String url;

  PhotoModel({this.id, this.title, this.url});

  PhotoModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        url = json['url'];
}

class HomeController extends BaseController {
  final Dio dio = DioService().dio;

  List<PhotoModel> photos = [];

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    setBusy(true);
    clearError();
    try {
      final response = await dio.get("/photos");
      photos = (response.data as List).map<PhotoModel>((e) => PhotoModel.fromJson(e)).toList();
      // photos = PhotoModel.fromJson(response.data);
    } on DioError {
      setError("Something went wrong!");
    }
    setBusy(false);
  }
}

import 'package:get/get.dart';
import '../models/gif.dart';
import '../repository/repository.dart';

class HomePageController extends GetxController  with StateMixin<List<GifModel>>{ 

  final GifRepository _gifRepository;
  HomePageController(this._gifRepository);
  
  @override
  void onInit() {
    super.onInit();
    _gifRepository.findAll().then((resp){

      change(resp,status: RxStatus.success());

    },onError: (err){
      print(err);
      change(null,status: RxStatus.error(err.toString()));
    });
  }
}


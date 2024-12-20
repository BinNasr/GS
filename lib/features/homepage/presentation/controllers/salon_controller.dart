import 'package:get/get.dart';
import '../../data/models/salon_model.dart';
import '../../domain/repositories/salon_repository.dart';

class SalonController extends GetxController {
  final SalonRepository repository;

  SalonController(this.repository);

  var isLoading = true.obs;
  var salons = <Salon>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSalons();
  }

  Future<void> fetchSalons() async {
    isLoading.value = true;
    try {
      final data = await repository.fetchSalons();
      salons.value = data;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}

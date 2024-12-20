import 'package:get/get.dart';
import '../../domain/usecases/get_appointments_use_case.dart';
import '../../domain/entities/appointment.dart';
import '../../../../core/error/failures.dart';

class AppointmentsController extends GetxController {
  final GetAppointmentsUseCase getAppointmentsUseCase;

  AppointmentsController(this.getAppointmentsUseCase);

  var isLoading = false.obs; // To indicate loading state
  var appointments = <Appointment>[].obs; // To hold appointments
  var errorMessage = ''.obs; // To hold error messages

  Future<void> fetchAppointments() async {
    isLoading.value = true;

    final result = await getAppointmentsUseCase();

    result.fold(
      (failure) {
        // Handle failure case
        errorMessage.value = _mapFailureToMessage(failure);
        isLoading.value = false;
      },
      (data) {
        // Handle success case
        appointments.value = data;
        isLoading.value = false;
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is NetworkFailure) return 'Check your internet connection.';
    if (failure is ServerFailure) return 'Server error occurred. Please try again.';
    return 'Unexpected error occurred. Please try again.';
  }
}

import 'package:dartz/dartz.dart';
import '../entities/appointment.dart';
import '../../../../core/error/failures.dart';
import '../repositories/appointment_repository.dart';

class GetAppointmentsUseCase {
  final AppointmentRepository repository;

  GetAppointmentsUseCase(this.repository);

  Future<Either<Failure, List<Appointment>>> call() async {
    return await repository.getAppointments();
  }
}

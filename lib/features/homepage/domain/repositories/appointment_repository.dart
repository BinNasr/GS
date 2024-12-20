import '../entities/appointment.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class AppointmentRepository {
  Future<Either<Failure, List<Appointment>>> getAppointments();
}

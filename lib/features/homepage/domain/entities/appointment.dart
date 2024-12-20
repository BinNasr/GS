import 'package:equatable/equatable.dart';

class Appointment extends Equatable {
  final String id;
  final String date;
  final String time;
  final String service;
  final String specialist;
  final int customerId;

  const Appointment({
    required this.id,
    required this.date,
    required this.time,
    required this.service,
    required this.specialist,
    required this.customerId,
  });

  @override
  List<Object?> get props => [id, date, time, service, specialist, customerId];
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../domain/usecases/get_appointments_use_case.dart';
// import '../../controllers/appointments_controller.dart';
// import '../../../../../injection_container.dart'
//     as di; // Dependency injection container

// class AppointmentsPage extends StatelessWidget {
//   final AppointmentsController controller = Get.put(
//     AppointmentsController(di.sl<GetAppointmentsUseCase>()),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Appointments'),
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         if (controller.errorMessage.value.isNotEmpty) {
//           return Center(
//             child: Text(
//               controller.errorMessage.value,
//               style: const TextStyle(color: Colors.red),
//             ),
//           );
//         }
//         if (controller.appointments.isEmpty) {
//           return const Center(child: Text('No appointments available.'));
//         }
//         return ListView.builder(
//           itemCount: controller.appointments.length,
//           itemBuilder: (context, index) {
//             final appointment = controller.appointments[index];
//             return ListTile(
//               title: Text(appointment.service),
//               subtitle: Text(
//                   'Specialist: ${appointment.specialist} | Date: ${appointment.date}'),
//             );
//           },
//         );
//       }),
//     );
//   }
// }

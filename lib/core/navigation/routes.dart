// import 'package:beglorious/presentation/pages/home/home_screen.dart';
import 'package:get/get.dart';
import '../../features/homepage/presentation/pages/home/home_page.dart';
// import '../appointments/appointments_page.dart';
import '../../features/homepage/presentation/pages/profile/profile_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String appointments = '/appointments';
  static const String profile = '/profile';

  static final routes = [
    GetPage(name: home, page: () => HomePage()),
    // GetPage(name: appointments, page: () => AppointmentsPage()),
    GetPage(name: profile, page: () => ProfilePage()),
  ];
}

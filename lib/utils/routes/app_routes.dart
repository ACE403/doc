import 'package:get/get.dart';

import '../../features/dashboard/screens/dashboard.dart';
import 'routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => Dashboard()),

    // Add more GetPage entries as needed
  ];
}

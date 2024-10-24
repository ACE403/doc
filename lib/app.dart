import 'package:brezie/bindings/general_bindings.dart';
import 'package:brezie/splash.dart';
import 'package:brezie/utils/constants/colors.dart';
import 'package:brezie/utils/helpers/helper_functions.dart';
import 'package:brezie/utils/theme/theme.dart';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'utils/routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TappTheme.lightTheme,
      darkTheme: TappTheme.darktheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: Scaffold(
        backgroundColor: dark ? TColors.white : TColors.white,
        body: Center(child: Splash()),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

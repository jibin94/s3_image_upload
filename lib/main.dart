import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:s3_image_upload/screens/base_page/base_binding.dart';
import 'package:s3_image_upload/utils/colors.dart';
import 'package:s3_image_upload/utils/widgets.dart';

import 'utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    ScreenUtil.init(context);
    return GetMaterialApp(
      theme: ThemeData(
          primarySwatch: primarySwatchColor,
          scaffoldBackgroundColor: AppColors.pageBackground),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homePage,
      getPages: appPages,
      initialBinding: BaseBinding(),
    );
  }
}

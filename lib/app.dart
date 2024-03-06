import 'package:ebook/utils/constants/text_strings.dart';
import 'package:ebook/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'bottom_nav.dart';


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        )
    );
    return GetMaterialApp(
        theme: TAppTheme.lightTheme,
        themeMode: ThemeMode.system,
        darkTheme: TAppTheme.darkTheme,

        debugShowCheckedModeBanner: false,
        title: TTexts.appName,
        home: const Directionality( // add this
          textDirection: TextDirection.rtl,
          child: BottomNavigation(),
        )
    );
  }
}
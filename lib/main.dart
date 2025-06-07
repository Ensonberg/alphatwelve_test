import 'package:alphatwelve/core/colors/color_palette.dart';
import 'package:alphatwelve/core/local_storage/storage_impl.dart';
import 'package:alphatwelve/core/route/router.dart';
import 'package:alphatwelve/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.instance.initStorage();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      splitScreenMode: true,
      builder: (child, widget) {
        return MaterialApp.router(
          // title: F.title,
          debugShowCheckedModeBanner: false,
          title: "Alphatwelve",
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: "IBM Plex Sans",
            // brightness: Brightness.light,
            colorScheme: ColorPalette.lightColorScheme,
            // extensions: [lightCustomColors],
          ),
          // darkTheme: ThemeData(
          //   useMaterial3: true,
          //   brightness: Brightness.light,
          //   colorScheme: lightColorScheme,
          //   //  extensions: [darkCustomColors],
          // ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          routeInformationProvider: router.routeInformationProvider,
        );
      },
    );
  }
}

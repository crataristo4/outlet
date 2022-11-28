import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:outlet/business_logic/view_models/locale_provider.dart';
import 'package:outlet/route/route_generator.dart';
import 'package:outlet/ui/views/splash_screen/splash_screen.dart';
import 'package:outlet/ui/widgets/dismiss_keyboard.dart';
import 'package:outlet/utils/functions.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'business_logic/view_models/providers.dart';
import 'generated/l10n.dart';
import 'l10n/L10n.dart';

int? onboardingPrefs;
Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await Hive.initFlutter();
    await Hive.openBox('language');
    await setOnboarding();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) => runApp(EntryPoint()));
  } catch (e) {
    logger.e('error ${e.toString()}');
  }
}

Future<void> setOnboarding() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  onboardingPrefs = prefs.getInt("onboardingPrefs");
  await prefs.setInt("onboardingPrefs", 1);
}

class EntryPoint extends StatefulWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: listOfProvider(context),
        child: ChangeNotifierProvider<LocaleViewModel>(
            create: (context) => LocaleViewModel(),
            child: Consumer<LocaleViewModel>(
                builder: (context, provider, child) => ValueListenableBuilder<Box>(
                    valueListenable: Hive.box('language').listenable(),
                    builder: (context, box, widget) {
                      return DismissKeyboard(
                        child: MaterialApp(
                          localizationsDelegates: [
                            AppLocalizationDelegate(),
                            GlobalMaterialLocalizations.delegate,
                            GlobalCupertinoLocalizations.delegate,
                            GlobalWidgetsLocalizations.delegate,
                          ],
                          title: 'Outlet',
                          locale: Locale(box.get('locale', defaultValue: 'en')),
                          supportedLocales: L10n.all,
                          useInheritedMediaQuery: true,
                          theme: ThemeData(
                            visualDensity: VisualDensity.adaptivePlatformDensity,
                          ),
                          initialRoute: SplashScreenPage.routeName,
                          onGenerateRoute: RouteGenerator.generateRoute,
                          // home: FlutterDemo(storage: CounterStorage()),
                          debugShowCheckedModeBanner: false,
                          scrollBehavior: const CupertinoScrollBehavior(),
                        ),
                      );
                    }))));
  }
}

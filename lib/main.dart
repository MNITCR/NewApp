import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:homeworkauth/route/route.dart'; // Import RouteManager
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Sign-Up',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // localizationsDelegates: [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: [
      //   Locale('en'), // English
      //   Locale('km'), // Khmer
      // ],
      initialRoute: RouteManager.choiceScreenRoute,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}

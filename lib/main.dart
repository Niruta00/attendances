import 'package:attendu/core/routes/router_generator.dart';
import 'package:attendu/firebase_options.dart';
import 'package:attendu/locator.dart';
import 'package:attendu/model/app_db.dart';
import 'package:attendu/view/login_view/login_with_phone.dart';
import 'package:attendu/view/login_view/loginwithgoogle.dart';
import 'package:attendu/view/login_view/otp_verify.dart';
import 'package:attendu/view_model/college_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view_model/student_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => AppDb(),
          dispose: (context, AppDb appDb) => appDb.close(),
        ),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => StudentViewModel()),
        // ChangeNotifierProvider(create: (_) => PhoneLoginViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => Routegenerator.getRoute(settings),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginwithGoogle(),
      ),
    );
  }
}

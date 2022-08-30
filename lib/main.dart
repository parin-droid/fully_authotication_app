import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fully_authotication_app/providers/firebase_Provider.dart';
import 'package:fully_authotication_app/providers/index_provider.dart';
import 'package:fully_authotication_app/repositry/login_repositry.dart';
import 'package:fully_authotication_app/screens/drawer_page.dart';
import 'package:fully_authotication_app/utils/mytheme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseProvider(Repository())),
        ChangeNotifierProvider(create: (_) => MyTheme()),
        ChangeNotifierProvider(create: (_) => IndexProvider()),
      ],
      child: ValueListenableBuilder(
          valueListenable: toggleTheme,
          builder: (context, bool value, _) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme:
                  ThemeData(appBarTheme: AppBarTheme(color: Color(0xFFB459FE))),
              home: DrawerPage(),
            );
          }),
    );
  }
}

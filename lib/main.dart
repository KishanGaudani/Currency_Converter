import 'package:currency_convertor/modals/theme.dart';
import 'package:currency_convertor/pages/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'global.dart';

void main() async {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
        builder: (
          context,
          ModelTheme themeNotifier,
          child,
        ) {
          return MaterialApp(
            theme: themeNotifier.isDark
                ? ThemeData(
              brightness: Brightness.dark,
            )
                : ThemeData(
                brightness: Brightness.light,
                primaryColor: Colors.black,
            ),
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}

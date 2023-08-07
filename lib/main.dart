import 'package:flutter/material.dart';
import 'package:todo_app/config/routes/app_routes.dart';
import 'package:todo_app/presentation/pages/main_page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
      ),
      navigatorKey: rootNavigatorKey,
      onUnknownRoute: AppRoutes.onUnknownRoute,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: Routes.main,
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calenurse_app/routes.dart';
import 'package:calenurse_app/store/auth.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthStore()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calenurse App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4894FE)),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: routes,
    );
  }
}

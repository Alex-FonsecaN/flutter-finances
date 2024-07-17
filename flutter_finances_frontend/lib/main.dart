import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/Home/home_page.dart';
import 'providers/home_provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => HomeProvider())
    ],
    child:  MyApp()
    )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gastos Mensais',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
        textTheme: TextTheme(
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
          // Defina outros estilos de texto aqui
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}



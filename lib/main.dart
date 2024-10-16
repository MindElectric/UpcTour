import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upc_tour/screens/details_screen.dart';
import 'package:upc_tour/screens/home_screen.dart';
import 'package:upc_tour/services/lugares_service.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LugaresService(),
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UPC Tour',
      debugShowCheckedModeBanner: false,
      initialRoute: "home_screen",
      routes: {
        'home_screen': (context) => const HomeScreen(),
        'details_screen': (context) => const DetailsScreen()
      },
      theme: ThemeData.light().copyWith(
          appBarTheme:
              const AppBarTheme(color: Color.fromRGBO(196, 81, 99, 1))),
    );
  }
}

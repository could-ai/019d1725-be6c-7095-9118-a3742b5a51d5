import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/role_selection_screen.dart';
import 'screens/home_screen.dart';
import 'screens/search_screen.dart';
import 'screens/ride_selection_screen.dart';
import 'screens/driver/driver_home_screen.dart';
import 'screens/admin/admin_dashboard_screen.dart';

void main() {
  runApp(const UberCloneApp());
}

class UberCloneApp extends StatelessWidget {
  const UberCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيق حجز سيارات',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'SA'), // Arabic
      ],
      locale: const Locale('ar', 'SA'),
      theme: ThemeData(
        primaryColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: Colors.black,
          secondary: Colors.black87,
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Tahoma',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const RoleSelectionScreen(),
        '/rider_home': (context) => const HomeScreen(),
        '/search': (context) => const SearchScreen(),
        '/ride_selection': (context) => const RideSelectionScreen(),
        '/driver_home': (context) => const DriverHomeScreen(),
        '/admin_dashboard': (context) => const AdminDashboardScreen(),
      },
    );
  }
}

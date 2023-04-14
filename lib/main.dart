import 'package:flora_test/bloc/main_bloc.dart';
import 'package:flora_test/routes/routes.dart';
import 'package:flora_test/screens/choice.dart';
import 'package:flora_test/screens/date_of_birth.dart';
import 'package:flora_test/screens/summary.dart';
import 'package:flora_test/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainBloc(navigatorKey: _navigatorKey),
        ),
      ],
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        theme: createLightTheme(),
        initialRoute: '/',
        routes: {
          AppRoutes.choiceScreen: (context) => const ChoiceScreen(),
          AppRoutes.dateOfBirthScreen: (context) => const DateOfBirthScreen(),
          AppRoutes.summaryScreen: (context) => const SummaryScreen(),
        },
      ),
    );
  }
}

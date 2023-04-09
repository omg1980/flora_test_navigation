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

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainBloc(),
        ),
      ],
      child: MaterialApp(
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

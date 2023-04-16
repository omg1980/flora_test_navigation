import 'package:flora_test/bloc/navigation_bloc.dart';
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

  static final _navigationKey =
      GlobalKey<NavigatorState>(debugLabel: 'Debug label here');

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: _navigationKey,
        theme: createLightTheme(),
        // initialRoute: '/',
        routes: {
          AppRoutes.choiceScreen: (context) => const ChoiceScreen(),
          AppRoutes.dateOfBirthScreen: (context) => const DateOfBirthScreen(),
          AppRoutes.summaryScreen: (context) => const SummaryScreen(),
        },
        builder: (context, view) =>
            BlocListener<NavigationBloc, NavigationState>(
          listener: (context, state) {
            if (state is NavigationInitialState) {
              Navigator.of(_navigationKey.currentState!.context)
                  .pushReplacementNamed(AppRoutes.choiceScreen);
            } else if (state is SecondPageNavigationState) {
              Navigator.of(_navigationKey.currentState!.context)
                  .pushReplacementNamed(AppRoutes.dateOfBirthScreen);
            } else if (state is ThirdPageNavigationState) {
              Navigator.of(_navigationKey.currentState!.context)
                  .pushReplacementNamed(AppRoutes.summaryScreen);
            }
          },
          child: view,
        ),
      ),
    );
  }
}

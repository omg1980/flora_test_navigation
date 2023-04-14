import 'package:flora_test/bloc/main_bloc.dart';
import 'package:flora_test/routes/routes.dart';
import 'package:flora_test/widgets/choise_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChoiceScreen extends StatefulWidget {
  const ChoiceScreen({super.key});

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/choice-bg.png'),
          ),
        ),
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiseSection(
                  title: 'Track my period',
                  description: 'contraception and wellbeing',
                  onTap: () => context.read<MainBloc>().add(
                        const NavigateToScreen(
                          namedRoute: AppRoutes.dateOfBirthScreen,
                          data: {
                            'title': 'Track my period',
                          },
                        ),
                      ),
                ),
                ChoiseSection(
                  title: 'Get pregnant',
                  description: 'learn about reproductive health',
                  onTap: () => context.read<MainBloc>().add(
                        const NavigateToScreen(
                          namedRoute: AppRoutes.dateOfBirthScreen,
                          data: {
                            'title': 'Get pregnant',
                          },
                        ),
                      ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

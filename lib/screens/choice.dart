import 'package:flora_test/bloc/navigation_bloc.dart';
import 'package:flora_test/widgets/choice_section.dart';
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
    final navigationBloc = context.read<NavigationBloc>();

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/choice-bg.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChoiceSection(
              title: 'Track my period',
              description: 'contraception and wellbeing',
              onTap: () => navigationBloc
                  .openDateSelectionScreen(LogDataTypeTitle.period),
            ),
            ChoiceSection(
              title: 'Get pregnant',
              description: 'learn about reproductive health',
              onTap: () => navigationBloc
                  .openDateSelectionScreen(LogDataTypeTitle.getPregnant),
            ),
          ],
        ),
      ),
    );
  }
}

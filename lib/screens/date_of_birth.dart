import 'package:flora_test/bloc/main_bloc.dart';
import 'package:flora_test/screens/summary.dart';
import 'package:flora_test/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../routes/routes.dart';

class DateOfBirthScreen extends StatefulWidget {
  const DateOfBirthScreen({super.key});

  @override
  State<DateOfBirthScreen> createState() => _DateOfBirthScreenState();
}

class _DateOfBirthScreenState extends State<DateOfBirthScreen> {
  final int _initialDateIndex = 45;
  final int _initialDate = 1950;
  late int _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = _initialDate + _initialDateIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/date-of-birth-bg.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Log in your date of birth',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: SizedBox(
                height: 300,
                child: CupertinoPicker(
                  diameterRatio: 2,
                  itemExtent: 65.0,
                  squeeze: 1.0,
                  useMagnifier: true,
                  selectionOverlay: Container(),
                  onSelectedItemChanged: (selectedDate) {
                    setState(() {
                      _selectedDate = _initialDate + selectedDate;
                    });
                  },
                  scrollController: FixedExtentScrollController(
                    initialItem: _initialDateIndex,
                  ),
                  children: List<Widget>.generate(
                    73,
                    (index) => Center(
                      child: Text(
                        '${_initialDate + index}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: 40,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                elevation: 0.0,
                backgroundColor: AppColors.gradientPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SummaryScreen(),
                  ),
                );
              },
              child: BlocBuilder<MainBloc, MainState>(
                builder: (context, state) {
                  final Map<String, dynamic> additionalData = {};

                  if (state is MainOpenScreen) {
                    additionalData.addAll(state.data);
                  }

                  return InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      context.read<MainBloc>().add(
                            NavigateToScreen(
                              namedRoute: AppRoutes.summaryScreen,
                              data: {
                                ...additionalData,
                                'selectedDate': _selectedDate,
                              },
                            ),
                          );
                    },
                    child: SizedBox(
                      width: 190,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Text(
                            'Next',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColors.white,
                                ),
                          ),
                          Expanded(
                            child: IgnorePointer(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  elevation: 0.0,
                                  shape: const CircleBorder(),
                                  backgroundColor: AppColors.white,
                                ),
                                child: const Center(
                                  child: Icon(
                                    size: 30,
                                    Icons.chevron_right,
                                    color: AppColors.purple,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

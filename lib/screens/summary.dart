import 'package:flora_test/bloc/main_bloc.dart';
import 'package:flora_test/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.choiceScreen,
              (route) => false,
            );
          },
        ),
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state is MainOpenThirdPage) {
            final data = state.data;
            return ListView.builder(
              itemCount: data.keys.length,
              itemBuilder: (context, index) {
                String key = data.keys.elementAt(index);
                return ListTile(
                  leading: Text(key),
                  trailing: Text(data[key].toString()),
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                'Passing data error',
              ),
            );
          }
        },
      ),
    );
  }
}

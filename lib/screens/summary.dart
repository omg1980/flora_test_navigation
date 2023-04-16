import 'package:flora_test/bloc/navigation_bloc.dart';
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
    final navigationBloc = context.read<NavigationBloc>();

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: navigationBloc.openChoiceScreen,
        ),
      ),
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is ThirdPageNavigationState) {
            final data = state.toMap();
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

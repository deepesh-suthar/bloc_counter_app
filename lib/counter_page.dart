import 'dart:math';
import 'package:basic_bloc_app/bloc/counter_event.dart';
import 'package:basic_bloc_app/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();

    return Scaffold(
      // 1. Added the AppBar from the video
      appBar: AppBar(
        title: const Text('Bloc Counter'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Stack(
              // 2. Added center alignment and clip behavior
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                // 3. Changed 'i' to 'index' to match his code
                for (int index = 0; index < state.count; index++)
                  Positioned(
                    // 4. Used his exact random math (nextInt)
                    left: Random().nextInt(250).toDouble(),
                    top: Random().nextInt(400).toDouble(),
                    // 5. Wrapped the image in a SizedBox of 150x150
                    child: SizedBox(
                      height: 95,
                      width: 95,
                      child: Image.asset('assets/bloc.png'),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterIncrementPressed());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterDecrementPressed());
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterResetPressed());
            },
            child: const Icon(Icons.exposure_zero),
          ),
        ],
      ),
    );
  }
}
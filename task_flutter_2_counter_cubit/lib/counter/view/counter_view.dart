import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_flutter_2_counter_cubit/counter/counter.dart';

/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and notifies it in response to user input.
class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Counter Cubit')),
      body: Center(
        child: BlocConsumer<CounterCubit, int>(
          listener: (context, state) {
            // Tampilkan Snackbar jika nilai counter kelipatan 5
            if (state % 5 == 0 && state != 0) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('You got $state')),
              );
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$state', style: textTheme.displayMedium),
                // Menampilkan ikon kejutan ketika counter kelipatan 5
                if (state % 5 == 0 && state != 0)
                  const Icon(Icons.star, size: 50, color: Colors.amber),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_multiply_floatingActionButton'),
            child: const Icon(Icons.close), // Ikon untuk "x2"
            onPressed: () => context.read<CounterCubit>().multiplyByTwo(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrementByTwo_floatingActionButton'),
            child: const Icon(Icons.exposure_neg_2), // Ikon untuk "-2"
            onPressed: () => context.read<CounterCubit>().decrementByTwo(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_reset_floatingActionButton'),
            child: const Icon(Icons.refresh), // Ikon untuk reset
            onPressed: () => context.read<CounterCubit>().reset(),
          ),
        ],
      ),
    );
  }
}

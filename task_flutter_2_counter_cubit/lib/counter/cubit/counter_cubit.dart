import 'package:bloc/bloc.dart';

/// A [Cubit] which manages an [int] as its state.
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  /// Add 1 to the current state.
  void increment() => emit(state + 1);

  /// Subtract 1 from the current state.
  void decrement() => emit(state - 1);

  /// Multiply the current state by 2.
  void multiplyByTwo() => emit(state * 2);

  /// Subtract 2 from the current state.
  void decrementByTwo() => emit(state - 2);

  /// Reset the counter to 0.
  void reset() => emit(0);
}

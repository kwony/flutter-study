import 'package:bloc/bloc.dart';
import 'package:flutter_study/bloc/counter.dart';

abstract class CounterEvent {}
class CounterIncrPressed extends CounterEvent {}
class CounterDecrPressed extends CounterEvent {}

class CounterCubit extends Bloc<CounterEvent, int> {
  CounterCubit() : super(0) {
    on<CounterIncrPressed>((event, emit) => emit(state + 1));
    on<CounterDecrPressed>((event, emit) => emit(state - 1));
  }


  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

}



import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {

  @override
  List<Object> get props => [];

}

/////// this is  event /////

class IncrementCounter extends CounterEvent {}

class DecrementCounter extends CounterEvent {}
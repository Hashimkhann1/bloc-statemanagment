


import 'package:equatable/equatable.dart';

class SwitchState extends Equatable{

  final bool isSwitch;

  SwitchState({this.isSwitch = false});

  SwitchState copyWith({bool? isSwitch}){
    return SwitchState(
    isSwitch: isSwitch ?? this.isSwitch
    );
  }

  @override
  List<Object?> get props => [isSwitch];
}

import 'package:equatable/equatable.dart';

abstract class SliderEvent extends Equatable {

  SliderEvent();

  @override
  List<Object> get props => [];

}


class ChangeSliderPosition extends SliderEvent{
  final double slider;
  ChangeSliderPosition({required this.slider});

  @override
  List<Object> get props => [slider];
}
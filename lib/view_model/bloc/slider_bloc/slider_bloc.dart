



import 'package:bloc/bloc.dart';
import 'package:blockstatemanagment/view_model/bloc/slider_bloc/slider_event.dart';
import 'package:blockstatemanagment/view_model/bloc/slider_bloc/slider_state.dart';

class SliderBloc extends Bloc<SliderEvent , SliderState>{

  SliderBloc() : super(SliderState()){
    on<ChangeSliderPosition>(_changeSliderPosition);
  }

  void _changeSliderPosition(ChangeSliderPosition event , Emitter emit) {
    emit(state.copyWith(sliderValue: event.slider));
  }

}
import 'package:bloc/bloc.dart';
import 'package:blockstatemanagment/view_model/bloc/switch_bloc/switch_event.dart';
import 'package:blockstatemanagment/view_model/bloc/switch_bloc/switch_state.dart';


class SwitchBloc extends Bloc<SwitchEvent , SwitchState> {

  SwitchBloc():super(SwitchState()){
    on<EnableOrDisableNotification>(_enableOrDisaleNotification);
  }

  void _enableOrDisaleNotification(EnableOrDisableNotification event , Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

}
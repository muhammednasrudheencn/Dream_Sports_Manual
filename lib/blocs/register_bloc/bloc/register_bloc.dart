import 'package:bloc/bloc.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterInitianEvent>(registerinitaialevent);
  }

  Future<void> registerinitaialevent(
      RegisterInitianEvent event, Emitter<RegisterState> emit) async {
    if (event.name.isEmpty ||
        event.phone.isEmpty ||
        event.email.isEmpty ||
        event.courtname.isEmpty ||
        event.location.isEmpty ||
        event.discription.isEmpty) {
      emit(PopState());
    } else {
      emit(NvigateToHomeState());
    }
  }
}

part of 'register_bloc.dart';

sealed class RegisterEvent {}

class RegisterInitianEvent extends RegisterEvent {
  String name;
  String phone;
  String email;
  String courtname;
  String location;
  String discription;

  RegisterInitianEvent({
    required this.name,
    required this.phone,
    required this.email,
    required this.courtname,
    required this.location,
    required this.discription,
  });
}

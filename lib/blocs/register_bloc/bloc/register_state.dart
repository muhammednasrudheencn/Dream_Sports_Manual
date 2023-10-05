part of 'register_bloc.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

class NvigateToHomeState extends RegisterState {}

class PopState extends RegisterState {}

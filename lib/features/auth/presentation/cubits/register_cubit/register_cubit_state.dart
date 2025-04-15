part of 'register_cubit.dart';

@immutable
sealed class RegisterCubitState {}

final class RegisterCubitInitial extends RegisterCubitState {}
final class RegisterCubitLoading extends RegisterCubitState {}
final class RegisterCubitSuccess extends RegisterCubitState {
final UserCredential user;
  RegisterCubitSuccess(this.user);
 
}
final class RegisterCubitFailure extends RegisterCubitState {
  final String error;
  RegisterCubitFailure(this.error);
}

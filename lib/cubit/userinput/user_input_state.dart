part of 'user_input_cubit.dart';

@immutable
abstract class  UserInputState {}

class UserInputInitial extends UserInputState {}

class UserGridState extends UserInputState {}

class UserUpdateGridState extends UserInputState {
  final List<int> selected;
  UserUpdateGridState(this.selected);
}

class UserInputFactorState extends UserInputState {
  final int number;
  UserInputFactorState(this.number);
}

class UserInputErrorState extends UserInputState {
  final String error;
  UserInputErrorState(this.error);
}



// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'user_input_state.dart';

class UserInputCubit extends Cubit<UserInputState> {
  UserInputCubit() : super(UserInputInitial());

  void setError(String error) {
    emit(UserInputErrorState(error));
  }
  void setGridView() {
    emit(UserGridState());
  }
  void setRefresh(List<int> selected){
    emit(UserUpdateGridState(selected));
  }
  void setInputView() {
    emit(UserInputInitial());
  }
}

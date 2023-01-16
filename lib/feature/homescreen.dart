import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/utils/utils.dart';
import 'package:sample/cubit/userinput/user_input_cubit.dart';
import 'package:sample/feature/usergrid/usergridcreen.dart';
import 'package:sample/feature/userinput/userinputscreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => UserInputCubit(),
      child: BlocConsumer<UserInputCubit, UserInputState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        UserInputCubit userInputCubit = BlocProvider.of<UserInputCubit>(context);
        var title ="User Input";
        var error  = "";
        var isAnimate = state is UserGridState || state is UserUpdateGridState;
        if(state is UserInputErrorState) {
          error = state.error;
          title = "User Grid";
        }
        List<int> selectedNumbers = [];
        if(state is UserUpdateGridState){
          selectedNumbers = state.selected;
        }
        return Scaffold(
          appBar: AppBar(title: Text(title),),
          body: Center(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if(state is UserGridState || state is UserUpdateGridState) ...[
                    UserGridScreen(number: int.parse(myController.text),userInputCubit: userInputCubit,selectedNumbers: selectedNumbers,)
                  ] else ...[
                    UserInputScreen(error: error,myController:myController)
                  ],
                  AnimatedAlign(
                    alignment: isAnimate ? Alignment.topCenter : Alignment.topLeft,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    child: ElevatedButton(onPressed: (){
                      if(isAnimate){
                        userInputCubit.setInputView();
                        return;
                      }
                      var number = int.parse(myController.text);
                      var factors = Utils.factors(number);
                      if(factors.isEmpty) {
                        userInputCubit.setError("Enter Valid number");
                      } else {
                        userInputCubit.setGridView();
                      }
                    }, child:  Text(!isAnimate? "Next":"Back")),
                  )
                ],
              )
          ),
        );
      },
    ),);
  }

}
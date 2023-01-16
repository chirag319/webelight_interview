import 'package:flutter/material.dart';
import 'package:sample/core/utils/utils.dart';
import 'dart:math';
import 'package:sample/cubit/userinput/user_input_cubit.dart';

class UserGridScreen extends StatelessWidget {
  final int number;
  final UserInputCubit userInputCubit;
  final List<int> selectedNumbers;
  const UserGridScreen({super.key, required this.number, required this.userInputCubit,required this.selectedNumbers});

  @override
  Widget build(BuildContext context) {
    var factors = Utils.factors(number);
    var gridCount = factors.reduce(max);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: (Utils.getDeviceWidth(context) ~/ 150).toInt(),
                  childAspectRatio: 1/1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: List.generate(gridCount, (index) {
                    return GestureDetector(
                      onTap: () {
                        var selectedNumber = index +1;
                        if(factors.contains(selectedNumber)) {
                          if(!selectedNumbers.contains(selectedNumber)){
                            selectedNumbers.add(selectedNumber);
                            userInputCubit.setRefresh(selectedNumbers);
                          }
                        }
                      },
                      child: Center(
                        child: Container(
                          color: selectedNumbers.contains(index+1) ? Colors.green : Colors.redAccent,
                          width:  double.infinity,
                        ),
                      ),
                    );
                  })),
            ),
            const SizedBox(height: 16,),
            Text("Divisible of $number is ${Utils.factors(number).toString()}"),
            const SizedBox(height: 16,),
            Text("Factorial of $number is ${Utils.factorial(number).toString()}"),
          ],
        ),
      ),
    );
  }
}

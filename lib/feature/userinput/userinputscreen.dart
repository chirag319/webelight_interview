import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserInputScreen extends StatelessWidget {
  final String error;
  final TextEditingController myController;
  const UserInputScreen({super.key, required this.error, required this.myController});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: myController,
          decoration: InputDecoration(labelText: "Enter your number",errorText: error.isNotEmpty ? error : null),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ], // Only numbers can be entered
        ),
        const SizedBox(height: 16,),
      ],
    );
  }

}
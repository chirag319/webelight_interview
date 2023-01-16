
import 'package:flutter/cupertino.dart';

class Utils {
 static List<int> factors(N) {
   List<int> result = [];

    for (var i = 1; i <= N / i; ++i) {
      if (N % i == 0) {
        result.add(i);
        result.add((N / i).floor());
      }
    }
    return result;
  }

 static int factorial(N) {

   int result = 1;
   for (int i = 1; i <= N; i++) {
     result *= i;
   }
   return result;
 }
 static double getDeviceWidth(BuildContext context) {
   double width = MediaQuery.of(context).size.width;
   return width;
 }
}
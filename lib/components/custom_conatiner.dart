import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(right: MediaQuery.sizeOf(context).width * 0.8, top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.deepPurple.shade100,
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFa399b6),
            offset: Offset(6, 6),
            blurRadius: 8,
          ),
          BoxShadow(
            color: Color(0xFFffefff),
            offset: Offset(-6, -6),
            blurRadius: 12,
          ),
        ],
      ),
      child: Lottie.asset(
        'assets/lotties/arrow_right_blue.json',
      ),
    );
  }
}
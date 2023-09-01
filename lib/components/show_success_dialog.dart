import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showSuccessDialog(BuildContext context) {
  showDialog(
    useSafeArea: true,
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Lottie.asset(
                  "assets/lotties/alert_dialog_loading_animation.json",
                  height: 240,
                  width: 230
                ),
              ),
              const SizedBox(height: 10),
               Center(
                child: const Text(
                  "createdSuccessfully",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ).tr(),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    fixedSize: const Size(210, 45),
                  ),
                  child: const Text(
                    "done",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ).tr(),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

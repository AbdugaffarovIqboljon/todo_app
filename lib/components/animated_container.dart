import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomAnimatedContainer extends StatelessWidget {
  const CustomAnimatedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(right: MediaQuery.sizeOf(context).width * 0.2, top: 20),
      padding: EdgeInsets.only(right: MediaQuery.sizeOf(context).width * 0.02),
      height: 50,
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(35),
          topRight: Radius.circular(35),
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        border: Border.all(color: Colors.deepPurpleAccent),
        color: Colors.deepPurple.shade100,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Lottie.asset(
            'assets/lotties/arrow_right_blue.json',
          ),
          Lottie.asset(
            'assets/lotties/arrow_right_blue.json',
          ),
          Lottie.asset(
            'assets/lotties/arrow_right_blue.json',
          ),
          Lottie.asset(
            'assets/lotties/arrow_right_blue.json',
          ),
          const Spacer(flex: 8),
          PopupMenuButton<Locale>(
            color: Colors.deepPurple.shade100,
            elevation: 12,
            tooltip: 'languages'.tr(),
            shadowColor: Colors.deepPurple,
            onSelected: context.setLocale,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            itemBuilder: (context) {
              return const [
                PopupMenuItem(
                    value: Locale('uz', 'UZ'), child: Text("🇺🇿 UZ")),
                PopupMenuItem(
                    value: Locale('en', 'US'), child: Text("🇺🇸 EN")),
                PopupMenuItem(
                    value: Locale('ru', 'RU'), child: Text("🇷🇺 RU")),
              ];
            },
            icon: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                border: Border.all(color: Colors.red),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.language,
                color: Colors.blueGrey,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

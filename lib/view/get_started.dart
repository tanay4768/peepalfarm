import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:peepalfram/utils/ui/sizeconstraints/display_config.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: DisplayConfig.eight * 100.h,
        width: DisplayConfig.threeSixty.w,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/getstarted.png",
                ),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            const Spacer(),
            Container(
              padding: EdgeInsets.only(
                  top: DisplayConfig.twelve.h,
                  bottom: DisplayConfig.twelve.h,
                  left: DisplayConfig.twenty.w,
                  right: DisplayConfig.twenty.w),
              height: DisplayConfig.eight * 22.h,
              width: DisplayConfig.threeSixty.w,
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(DisplayConfig.twentyFour.h),
                    topRight: Radius.circular(DisplayConfig.twentyFour.h)),
              ),
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  SizedBox(
                    height: DisplayConfig.ten.h,
                  ),
                  Text(
                    "Be Kind. Be Humane. Be Change.",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: DisplayConfig.twenty.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.offNamed("/login");
                    },
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: const Text("Get Started"),
                  ),
                  SizedBox(
                    height: DisplayConfig.sixteen.h,
                  ),
                  Text(
                    "Every step you take can amplify voice of voiceless",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

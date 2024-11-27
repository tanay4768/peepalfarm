import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peepalfram/utils/ui/sizeconfig.dart';

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
        height: SizeConfig.eight * 100,
        width: SizeConfig.threeSixty,
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
                  top: SizeConfig.twelve,
                  bottom: SizeConfig.twelve,
                  left: SizeConfig.twenty,
                  right: SizeConfig.twenty),
              height: SizeConfig.eight * 22,
              width: SizeConfig.threeSixty,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(SizeConfig.twentyFour),
                    topRight: Radius.circular(SizeConfig.twentyFour)),
              ),
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.ten,
                  ),
                  Text(
                    "Be Kind. Be Humane. Be Change.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: SizeConfig.twenty,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.offNamed("/login");
                    },
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: const Text("Get Started"),
                  ),
                  SizedBox(
                    height: SizeConfig.sixteen,
                  ),
                  Text(
                    "Every step you take can amplify voice of voiceless",
                    style: Theme.of(context).textTheme.bodySmall,
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

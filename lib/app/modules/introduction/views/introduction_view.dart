import 'package:chatkhuldi/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Berinteraksi dengan mudah",
          body: "Kamu hanya perlu dirumah saja untuk mendapatkan teman baru.",
          image: Container(
            width: Get.width * 0.6,
            height: Get.width * 0.6,
            child: Center(
              child: Lottie.asset("assets/lottie/main-laptop-duduk.json"),
            ),
          ),        
        ),
        PageViewModel(
          title: "Temukan Sahabat baru",
          body:
              "Jika kamu memang jodoh karena aplikasi ini, kami sanget bahagia.",
          image: Container(
            width: Get.width * 0.6,
            height: Get.width * 0.6,
            child: Center(
              child: Lottie.asset("assets/lottie/ojek.json"),
            ),
          ),         
        ),
        PageViewModel(
          title: "Aplikasi bebas biaya",
          body:
              "kamu tidak perlu khawatir tagihan bulananmu melonjak, aplikasi ini bebas biaya apapun",
          image: Container(
            width: Get.width * 0.6,
            height: Get.width * 0.6,
            child: Center(
              child: Lottie.asset("assets/lottie/payment.json"),
            ),
          ),         
        ),
        PageViewModel(
          title: "Gabung sekarang juga",
          body:
              "Daftarkan diri kamu untuk menjadi bagian dari kami. kami akan menghubungkanmu dengan 100 teman lainnya",
          image: Container(
            width: Get.width * 0.6,
            height: Get.width * 0.6,
            child: Center(
              child: Lottie.asset("assets/lottie/register.json"),
            ),
          ),         
        )
      ],
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Text("Next",style: TextStyle(fontWeight: FontWeight.bold),),
      done: const Text("Login", style: TextStyle(fontWeight: FontWeight.w700)),
      onDone: () => Get.offAllNamed(Routes.LOGIN),      
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Theme.of(context).colorScheme.secondary,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    ));
  }
}

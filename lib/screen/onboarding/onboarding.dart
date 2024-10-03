// onboarding.dart
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/screen/auth/Login.dart';
import 'package:storease_mobileapp_dev/screen/home.dart';
import 'package:storease_mobileapp_dev/method/secure_storage.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final SecureStorage _secureStorage = SecureStorage();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: MyColor.onBoardColor),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Expanded(
                flex: 14,
                child: PageView.builder(
                  itemCount: demoData.length,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemBuilder: (context, index) => OnboardContent(
                    illustration: demoData[index]["illustration"],
                    title: demoData[index]["title"],
                    subtitle: demoData[index]["subtitle"],
                    text: demoData[index]["text"],
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  demoData.length,
                  (index) => DotIndicator(isActive: index == currentPage),
                ),
              ),
              const Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: () async {
                    // Mark onboarding as completed in secure storage
                    await _secureStorage.writeSecureData(
                      dotenv.env["KEY_SPLASH"] ?? 'onBoardingCompleted',
                      'true',
                    );

                    // Check for token and navigate accordingly
                    String? token =
                        await _secureStorage.readSecureData(dotenv.env["KEY_TOKEN"] ?? 'token');

                    if (token != null && token.isNotEmpty) {
                      // Token exists, navigate to HomePage
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) =>Home()),
                      );
                    } else {
                      // No token, navigate to LoginPage
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) =>Login()),
                      );
                    }
                  },
                  child: Text("Get Started".toUpperCase()),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

// Demo data for our Onboarding screen
List<Map<String, dynamic>> demoData = [
  {
    "illustration": "images/image_onboard1.png",
    "title": "Selamat Datang di Storease",
    "subtitle": "Perencana Pernikahan Terbaik",
    "text":
        "Kami menyediakan berbagai paket pernikahan yang bisa Anda sesuaikan dengan pilihan Anda semudah dalam genggaman.",
  },
  {
    "illustration": "images/image_onboard2.png",
    "title": "Free delivery offers",
    "subtitle": "Kebutuhan Pernikahan Anda",
    "text":
        "Dengan Storease anda bisa rencanakan event dengan mudah, telusuri vendor terdekat dengan mudah hanya dalam satu aplikasi.",
  },
  {
    "illustration": "images/image_onboard3.png",
    "title": "Yuk, Wujudkan Pernikahan Impianmu Bersama Kami!",
    "subtitle": "",
    "text":
        "Buat akun agar Anda dapat menikmati fitur unggulan kami. Perencanaan pernikahan semudah dalam genggaman.",
  },
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.illustration,
    required this.title,
    this.subtitle,
    required this.text,
  });

  final String? illustration, title, text, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(illustration!, height: 100, width: 100),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title!,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        if (subtitle != null && subtitle!.isNotEmpty)
          Text(
            subtitle!,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        const SizedBox(height: 8),
        Text(
          text!,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
    this.activeColor = MyColor.colorMain,
    this.inActiveColor = const Color(0xFF868686),
  });

  final bool isActive;
  final Color activeColor, inActiveColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 5,
      width: isActive ? 16 : 8,
      decoration: BoxDecoration(
        color: isActive ? activeColor : inActiveColor.withOpacity(0.25),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}

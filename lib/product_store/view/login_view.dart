import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_pro/app/constants.dart';
import 'package:store_pro/product_store/view/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween<double>(begin: 0, end: 100).animate(_controller)
      ..addListener(() {
        setState(() {
        });
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            child: Image.asset(
              "assets/rain_backg.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
              color: Colors.black.withOpacity(0.5),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterLogo(
                  size: _animation.value,
                ),
                const SizedBox(height: 16),
                AnimatedOpacity(
                  duration: const Duration(seconds: 2),
                  opacity: _animation.value/100,
                  child: const Text(
                    'Welcome to Store Pro',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                ElevatedButton(
                  onPressed: () {
                    Constants.prefs!.setBool("isLoggedIn", true);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeView()
                      ),
                      (route) => false
                    );
                  },
                   child: const Text('Login')
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:minelibs2/screens/auth/choices/index.dart';
import 'package:minelibs2/screens/auth/choices/login.dart';
import 'package:minelibs2/screens/auth/choices/signup.dart';
import 'package:minelibs2/utils/app.utils.dart';

class ChooseOptionScreen extends StatefulWidget {
  const ChooseOptionScreen({super.key});

  @override
  State<ChooseOptionScreen> createState() => _ChooseOptionScreenState();
}

class _ChooseOptionScreenState extends State<ChooseOptionScreen> with SingleTickerProviderStateMixin {
  late int currentIndex = 1;
  late PageController _controller;
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: currentIndex);
    
    // Initialisation de l'AnimationController
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    // Animation d'opacité
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    // Animation de glissement
    _slideAnimation = Tween<Offset>(begin: Offset(0, 0.1), end: Offset(0, 0)).animate(_animationController);

    // Démarrer l'animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight(context) * .08,
            ),
            Center(
              child: Container(
                width: screenWidth(context) * .9,
                height: screenHeight(context) * .53,
                decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(125))),
              ),
            ),
            SizedBox(
              height: screenHeight(context) * .03,
            ),
            SizedBox(
              width: screenWidth(context),
              height: screenHeight(context) * .36,
              child: PageView(
                controller: _controller,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ChoiceSignUp(pageController: _controller),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: FadeTransition(
                          opacity: _opacityAnimation,
                          child: Text(
                            'Support accross',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight(context) * .02,
                      ),
                      SlideTransition(
                        position: _slideAnimation,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                            style: Theme.of(context).textTheme.displaySmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight(context) * .01,
                      ),
                      FluButton(
                          width: screenWidth(context),
                          height: screenHeight(context) * .08,
                          backgroundColor: promoteColor,
                          onPressed: () {
                            _controller.nextPage(
                                duration: Duration(seconds: 1),
                                curve: Curves.easeInOut);
                          },
                          child: Text(
                            'Login',
                            style: Theme.of(context).textTheme.headlineMedium,
                          )),
                      SizedBox(
                        height: screenHeight(context) * .02,
                      ),
                      FluButton(
                          width: screenWidth(context),
                          height: screenHeight(context) * .08,
                          backgroundColor: buttonColor,
                          onPressed: () {
                            _controller.previousPage(
                                duration: Duration(seconds: 1),
                                curve: Curves.easeInOut);
                          },
                          child: Text(
                            'Sign up',
                            style: Theme.of(context).textTheme.headlineMedium,
                          )),
                    ],
                  ),
                  ChoiceLogin(pageController: _controller),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

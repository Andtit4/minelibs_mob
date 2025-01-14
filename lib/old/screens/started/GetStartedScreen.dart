/* import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:minelibs2/screens/auth/ChooseAuthOptionScreen.dart';
import 'package:minelibs2/screens/started/steps/step_one.dart';
import 'package:minelibs2/screens/started/steps/step_three.dart';
import 'package:minelibs2/screens/started/steps/step_two.dart';
import 'package:minelibs2/utils/app.utils.dart';
import 'package:minelibs2/utils/transition.utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen>
    with SingleTickerProviderStateMixin {
  late int currentIndex = 0;
  PageController _controller = PageController();
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: currentIndex);
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _opacityAnimation = Tween<double>(
      begin: 1.0, // Opacité initiale
      end: 0.0, // Opacité finale
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose(); // Libérer les ressources de l'animation
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight(context) * .45,
              ),
              SizedBox(
                height: screenHeight(context) * .4,
                width: screenWidth(context),
                child: PageView(
                  controller: _controller,
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  children: [StepOne(), StepTwo(), StepThree()],
                ),
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  axisDirection: Axis.horizontal,
                  effect: const ExpandingDotsEffect(
                      dotWidth: 6,
                      dotHeight: 6,
                      dotColor: Color.fromARGB(52, 255, 255, 255),
                      activeDotColor: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentIndex == 0
                      ? SizedBox()
                      : FluButton(
                          backgroundColor: Colors.transparent,
                          onPressed: () {
                            if (currentIndex == 1) {
                              // _controller.jumpToPage(0);
                              _controller.previousPage(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.easeInOut);
                            } else if (currentIndex == 2) {
                              // _controller.jumpToPage(1);
                              _controller.previousPage(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.easeInOut);
                            } else {}
                          },
                          child: FluIcon(
                            FluIcons.arrowLeft,
                            style: FluIconStyles.broken,
                            color: Colors.white,
                          )),
                  currentIndex == 2
                      ? AnimatedBuilder(
                          animation: _opacityAnimation,
                          builder: ((context, child) {
                            return Opacity(
                              opacity: _opacityAnimation.value,
                              child: FluButton(
                                  backgroundColor: promoteColor,
                                  width: screenWidth(context) * .3,
                                  onPressed: () async {
                                    await splashShow();
                                    PageTransition.fadeTransitionRemplacement(
                                        context, ChooseOptionScreen());
                                  },
                                  child: Text(
                                    'Get Started',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  )),
                            );
                          }),
                        )
                      : FluButton(
                          backgroundColor: buttonColor,
                          onPressed: () {
                            _controller.nextPage(
                              duration: Duration(
                                  milliseconds: 500), // Durée de l'animation
                              curve: Curves
                                  .easeInOutCubic, // Courbe d'animation moderne
                            );
                            if (currentIndex == 2) {
                              _animationController.forward();
                            }
                          },
                          child: FluIcon(
                            FluIcons.arrowRight,
                            style: FluIconStyles.broken,
                            color: Colors.white,
                          )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
 */
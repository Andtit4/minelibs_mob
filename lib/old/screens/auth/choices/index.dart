import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:minelibs2/old/utils/app.utils.dart';

class ChoicesMain extends StatefulWidget {
  const ChoicesMain({super.key, required int index});

  @override
  State<ChoicesMain> createState() => _ChoicesMainState();
}

class _ChoicesMainState extends State<ChoicesMain> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Support accross',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        SizedBox(
          height: screenHeight(context) * .02,
        ),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco ',
          style: Theme.of(context).textTheme.displaySmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: screenHeight(context) * .01,
        ),
        FluButton(
            width: screenWidth(context),
            height: screenHeight(context) * .08,
            backgroundColor: promoteColor,
            onPressed: () {},
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
            onPressed: () {},
            child: Text(
              'Sign up',
              style: Theme.of(context).textTheme.headlineMedium,
            )),
      ],
    );
  }
}

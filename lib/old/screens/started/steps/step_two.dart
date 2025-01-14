/* import 'package:flutter/material.dart';
import 'package:minelibs2/utils/app.utils.dart';

class StepTwo extends StatefulWidget {
  const StepTwo({super.key});

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: screenHeight(context) * .1,
        ),
        Text(
          'Support accross',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ipsum dolor',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              ' emet si vis',
              style: Theme.of(context).textTheme.displayMedium,
            )
          ],
        ),
        SizedBox(height: screenHeight(context) * .02,),
        AnimatedOpacity(
          opacity: 1.0,
          duration: Duration(seconds: 1),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
} */
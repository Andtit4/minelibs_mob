import 'package:flutter/material.dart';
import 'package:minelibs2/utils/app.utils.dart';

class CategorieListPart extends StatelessWidget {
  const CategorieListPart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context),
      height: screenHeight(context) * .09,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Row(),
      ),
    );
  }
}
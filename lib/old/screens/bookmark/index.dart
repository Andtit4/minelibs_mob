import 'dart:math';

import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:minelibs2/old/models/bookModel.dart';
import 'package:minelibs2/old/screens/DetailScreen.dart';
import 'package:minelibs2/old/utils/app.utils.dart';
import 'package:minelibs2/old/utils/transition.utils.dart';
import 'package:onyxsio_grid_view/onyxsio_grid_view.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  List<BookModel> books = BookModel.getAll();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              width: screenWidth(context),
              height: screenHeight(context) * .85,
              child: OnyxsioGridView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: books.length,
                physics: const BouncingScrollPhysics(),
                staggeredTileBuilder: (index) =>
                    const OnyxsioStaggeredTile.fit(2),
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                shrinkWrap: false,
                itemBuilder: (context, index) => OnyxsioGridTile(
                  index: index,
                  heightList: List.generate(
                      books.length, (index) => Random().nextInt(300) + 200),
                  child: AnimatedContainer(
                    duration:
                        Duration(milliseconds: 300), // Durée de l'animation
                    curve: Curves.easeInOut,
                    child: SizedBox(
                      width: screenWidth(context),
                      height: screenHeight(context) * .2,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GestureDetector(
                          onTap: () {
                            PageTransition.fadeTransition(
                                context, DetailScreen(book: books[index]));
                          },
                          child: Hero(
                            tag: books[index].img,
                            child: AnimatedScale(
                              scale: 1.0, // Échelle initiale
                              duration: Duration(milliseconds: 200),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                clipBehavior: Clip.hardEdge,
                                width: screenWidth(context) * .4,
                                height: screenHeight(context) * .3,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(30)),
                                child: FluImage(
                                  books[index].img,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

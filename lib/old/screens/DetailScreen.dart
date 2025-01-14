import 'dart:ui';

import 'package:flukit/flukit.dart';
import 'package:flukit/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:minelibs2/old/models/bookModel.dart';
import 'package:minelibs2/old/screens/read.dart';
import 'package:minelibs2/old/screens/services/savedBook.dart';
import 'package:minelibs2/old/utils/app.utils.dart';
import 'package:minelibs2/old/utils/transition.utils.dart';
import 'package:palette_generator/palette_generator.dart'; // Ajoutez cette ligne

class DetailScreen extends StatefulWidget {
  final BookModel book;
  const DetailScreen({super.key, required this.book});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Color dominantColor = Colors.transparent; // Ajoutez cette variable
  // late int idForQuery = 0;

  @override
  void initState() {
    super.initState();
    _getDominantColor();
  }

  Future<void> _getDominantColor() async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      NetworkImage(widget.book.img), // Utilisez l'image du livre
    );
    setState(() {
      dominantColor = paletteGenerator.dominantColor?.color ??
          Colors.transparent; // Mettez à jour la couleur dominante
    });
  }

  Future<void> _saveBook() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? bookList =
        prefs.getStringList('book_list') ?? []; // Récupérez la liste existante
    String bookInfo =
        '${widget.book.title},${widget.book.author},${widget.book.img},${widget.book.bookLink}';
    bookList.add(bookInfo);
    await prefs.setStringList(
        'book_list', bookList); // Enregistrez la liste mise à jour
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight(context) * .03,
            ),
            Stack(
              children: [
                Container(
                  width:
                      double.infinity, // Modifié pour occuper toute la largeur
                  height: screenHeight(context) * .4,
                  decoration: BoxDecoration(
                    /* gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        // widget.book.color
                        //     .withOpacity(0.8), // Couleur foncée en bas
                        // widget.book.color
                        //     .withOpacity(0.3), // Couleur moins foncée en haut
                      ],
                    ), */
                    // borderRadius: BorderRadius.circular(30),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Flou
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black
                          .withOpacity(0), // Transparent pour le flou
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: screenWidth(context) * .3,
                  child: Hero(
                      tag: widget.book.img,
                      child: Container(
                          width: screenWidth(context) * .35,
                          height: screenHeight(context) * .3,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(30)),
                          child: FluImage(widget.book.img))),
                ),
                Positioned(
                  top: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FluButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          backgroundColor: Colors.transparent,
                          child: const FluIcon(
                            FluIcons.arrowLeft,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '1200 FCFA',
                        style: TextStyle(
                            color: promoteColor, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.book.title,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.book.author,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  FluButton(
                      onPressed: () {},
                      backgroundColor: promoteColor,
                      cornerRadius: 99,
                      width: 50,
                      child: const FluIcon(
                        FluIcons.bookmark,
                        style: FluIconStyles.bulk,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            Container(
              width: screenWidth(context),
              height: screenHeight(context) * .14,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: inputColorBlack,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Text(
                        'Rating',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          FluIcon(
                            FluIcons.star,
                            style: FluIconStyles.bulk,
                            color: Colors.grey,
                            size: 16,
                          ),
                          Text(
                            '4.5',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                  FluLine(
                    width: 1,
                    height: screenHeight(context) * .1,
                    color: Colors.grey,
                  ),
                   Column(
                    children: [
                      Text(
                        'Number of Pages',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${widget.book.pageNumber}',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  FluLine(
                    width: 1,
                    height: screenHeight(context) * .1,
                    color: Colors.grey,
                  ),
                  const Column(
                    children: [
                      Text(
                        'Language',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Fr',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth(context),
              height: screenHeight(context) * .2,
              padding: EdgeInsets.all(14),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Text(
                  widget.book.description,
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ),
            ),
            FluButton(
                onPressed: () async {
                  int idCount =
                      await BookDatabase().countBooksById(widget.book.id);

                  if (idCount == 0) {
                    await BookDatabase().insertBook(widget.book);
                  }

                  PageTransition.fadeTransition(
                      context, ReadBookScreen(book: widget.book));
                },
                backgroundColor: promoteColor,
                width: screenWidth(context),
                child: Text(
                  'Lire',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}

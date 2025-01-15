import 'dart:ui';

import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minelibs2/core/theme/colors.dart';
import 'package:minelibs2/domain/entities/book_info.dart';
import 'package:minelibs2/presentation/controllers/read_controller.dart';

class ReadScreen extends GetView<ReadController> {
  final BookInfo book;
  const ReadScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * .03,
          ),
          FluButton(
              onPressed: () {
                Navigator.pop(context);
              },
              backgroundColor: Colors.transparent,
              child: const FluIcon(
                FluIcons.arrowLeft,
                color: Colors.white,
              )),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              width: Get.width,
              height: Get.height * .3 ,
              child: Stack(
                children: [
                  
                  /* BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Flou
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black
                            .withOpacity(0), // Transparent pour le flou
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ), */
                  Positioned(
                    top: 30,
                    left: Get.width * .3,
                    child: Hero(
                        tag: book.img,
                        child: Container(
                            width: Get.width * .35,
                            height: Get.height * .25,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(30)),
                            child: FluImage(book.img))),
                  ),
                  /* Positioned(
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
                  ), */
                ],
              ),
            ),
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
                          color: AppColors.promoteColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      book.title,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      book.author,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                FluButton(
                    onPressed: () {},
                    backgroundColor: AppColors.promoteColor,
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
            width: Get.width,
            height: Get.height * .14,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: AppColors.inputColorBlack,
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
                  height: Get.height * .1,
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
                      '${book.pageNumber}',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                FluLine(
                  width: 1,
                  height: Get.height * .1,
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
            width: Get.width,
            height: Get.height * .2,
            padding: EdgeInsets.all(14),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Text(
                book.description,
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ),
          ),
          FluButton(
              onPressed: () async {
                /* int idCount =
                    await BookDatabase().countBooksById(widget.book.id);
      
                if (idCount == 0) {
                  await BookDatabase().insertBook(widget.book);
                } */
      
               /*  PageTransition.fadeTransition(
                    context, ReadBookScreen(book: widget.book)); */
              },
              backgroundColor: AppColors.promoteColor,
              width: Get.width,
              child: Text(
                'Lire',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    ); 
  }
}

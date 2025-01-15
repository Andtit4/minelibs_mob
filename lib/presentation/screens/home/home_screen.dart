import 'dart:math';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minelibs2/core/theme/colors.dart';
import 'package:minelibs2/domain/entities/book_info.dart';
import 'package:minelibs2/presentation/controllers/home_controller.dart';
import 'package:onyxsio_grid_view/onyxsio_grid_view.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      FluAvatar(
                        defaultAvatarType: FluAvatarTypes.memojis,
                        circle: true,
                        size: 42,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'John Doe',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              controller.greeting.value,
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),

                  // Ajout de la barre de recherche avec animation
                ],
              ),
              SizedBox(
                height: 20,
              ),
              controller.isSearchBarVisible.value
                  ? FluTextField(
                      hint: 'Rechercher',
                      height: Get.height * .08,
                      hintColor: Colors.grey,
                      fillColor: AppColors.inputColorBlack,
                      prefix: const FluIcon(
                        FluIcons.search,
                        color: Colors.grey,
                      ),
                    )
                  : SizedBox.shrink(),
              /* AnimatedOpacity(
                opacity: controller.isSearchBarVisible.value ? 1.0 : 0.0,
                duration: Duration(milliseconds: 300),
                child: 
                    ? FluTextField(
                        hint: 'Rechercher',
                        height: Get.height * .08,
                        hintColor: Colors.grey,
                        fillColor: AppColors.inputColorBlack,
                        prefix: const FluIcon(
                          FluIcons.search,
                          color: Colors.grey,
                        ),
                      )
                    : SizedBox
                        .shrink(), // Utilisation de SizedBox.shrink() pour un conteneur vide
              ),
           */
              SizedBox(
                height: 20,
              ),
              Container(
                width: Get.width,
                height: Get.height * .33,
                decoration: BoxDecoration(
                    color: AppColors.promoteColor,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: Get.width * .15,
                        height: Get.height * .01,
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.4),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Continue Reading',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          FluButton(
                            onPressed: () {},
                            backgroundColor: Colors.transparent,
                            child: Text(
                              '...',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: Get.width * .3,
                          height: Get.height * .2,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: FluImage(
                            controller.bookHeader.first.img,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.bookHeader.first.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              controller.bookHeader.first.author,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            RatingBar.builder(
                              itemSize: 18,
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: controller.bookHeader.first.stars,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => FluIcon(
                                FluIcons.star,
                                style: FluIconStyles.bulk,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('70%'),
                            SizedBox(
                              width: Get.width * .4,
                              height: 3,
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.white.withOpacity(.4),
                                color: Colors.white,
                                value: .7,
                              ),
                            ),
                            Text(
                              '2h de lecture',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.2),
                                  fontSize: 12),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * .03,
              ),
              DefaultTabController(
                  length: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ButtonsTabBar(
                          buttonMargin: EdgeInsets.only(right: 20, bottom: 10),
                          unselectedBackgroundColor: Colors.transparent,
                          labelStyle: GoogleFonts.poppins(color: Colors.white),
                          unselectedLabelStyle:
                              GoogleFonts.poppins(color: Colors.grey),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25)),
                          height: Get.height * .08,
                          contentPadding: const EdgeInsets.all(10),
                          tabs: const [
                            Tab(
                              text: 'Trendings',
                            ),
                            Tab(
                              text: 'News',
                            ),
                            Tab(
                              text: 'Bests',
                            ),
                            Tab(
                              text: 'Epics',
                            ),
                            Tab(
                              text: 'Lorem',
                            )
                          ])
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: Get.width,
                  height: Get.height * .4,
                  child: OnyxsioGridView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: controller.books.length,
                    physics: const BouncingScrollPhysics(),
                    staggeredTileBuilder: (index) =>
                        const OnyxsioStaggeredTile.fit(2),
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => OnyxsioGridTile(
                      index: index,
                      heightList: List.generate(controller.books.length,
                          (index) => Random().nextInt(300) + 200),
                      child: AnimatedContainer(
                        duration:
                            Duration(milliseconds: 300), // Durée de l'animation
                        curve: Curves.easeInOut,
                        child: SizedBox(
                          width: Get.width,
                          height: Get.height * .3,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: GestureDetector(
                              onTap: () {
                                /* PageTransition.fadeTransition(context,
                                            DetailScreen(book: books[index])); */
                              },
                              child: Hero(
                                tag: controller.books[index].img,
                                child: AnimatedScale(
                                  scale: 1.0, // Échelle initiale
                                  duration: Duration(milliseconds: 200),
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    clipBehavior: Clip.hardEdge,
                                    width: Get.width * .4,
                                    height: Get.height * .3,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: FluImage(
                                      controller.books[index].img,
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
              SizedBox(
                height: Get.height * .03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension on RxList<BookInfo> {
  String get image => first.img;
}

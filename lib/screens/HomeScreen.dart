import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minelibs2/models/bookModel.dart';
import 'package:minelibs2/screens/DetailScreen.dart';
import 'package:minelibs2/utils/app.utils.dart';
import 'package:minelibs2/utils/transition.utils.dart';
import 'dart:math'; // Importation nécessaire pour utiliser Random
import 'package:onyxsio_grid_view/onyxsio_grid_view.dart'; // Importer le package

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BookModel> books = BookModel.getAll();
  late bool _isSearchVisible = false; // Ajout d'une variable d'état

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: 1.0, // Opacité initiale
        duration:
            Duration(seconds: 2), // Durée de la transition en millisecondes
        curve: Curves.easeInOut,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight(context) * .03,
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
                        FluBadge(
                          child: FluButton(
                            onPressed: () {},
                            backgroundColor: inputColorBlack,
                            // cornerRadius: 222,
                            height: screenHeight(context) * .065,
                            width: screenWidth(context) * .143,
                            child: FluIcon(
                              FluIcons.shop,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                    FluButton(
                      onPressed: () {
                        setState(() {
                          _isSearchVisible =
                              !_isSearchVisible; // Toggle de la visibilité
                        });
                      },
                      backgroundColor: inputColorBlack,
                      child: FluIcon(FluIcons.search, color: Colors.grey),
                    ),
                    // Ajout de la barre de recherche avec animation
                  ],
                ),
                SizedBox(
                  height: defaultVerticalSpacer(context),
                ),
                AnimatedOpacity(
                  opacity: _isSearchVisible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 300),
                  child: _isSearchVisible
                      ? FluTextField(
                          hint: 'Rechercher',
                          height: screenHeight(context) * .08,
                          hintColor: Colors.grey,
                          fillColor: inputColorBlack,
                          prefix: const FluIcon(
                            FluIcons.search,
                            color: Colors.grey,
                          ),
                        )
                      : SizedBox
                          .shrink(), // Utilisation de SizedBox.shrink() pour un conteneur vide
                ),
                /* SizedBox(
                  width: screenWidth(context),
                  child: FluTextField(
                    suffix: FluButton(
                        onPressed: () {},
                        backgroundColor: Colors.transparent,
                        child: FluIcon(FluIcons.microphone,
                            style: FluIconStyles.bulk, color: Colors.grey)),
                    hint: 'Rechercher',
                    height: screenHeight(context) * .08,
                    hintColor: Colors.grey,
                    fillColor: inputColorBlack,
                    prefix: const FluIcon(
                      FluIcons.search,
                      color: Colors.grey,
                    ),
                  ),
                ), */
                SizedBox(
                  height: defaultVerticalSpacer(context),
                ),
                Container(
                  width: screenWidth(context),
                  height: screenHeight(context) * .33,
                  decoration: BoxDecoration(
                      color: promoteColor,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          width: screenWidth(context) * .15,
                          height: screenHeight(context) * .01,
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
                            width: screenWidth(context) * .3,
                            height: screenHeight(context) * .2,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: FluImage(
                              "https://m.media-amazon.com/images/M/MV5BNzMwOGQ5MWItNzE3My00ZDYyLTk4NzAtZWIyYWI0NTZhYzY0XkEyXkFqcGc@._V1_.jpg",
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'One Punch Man',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Text(
                                'Yusuke Murata',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              RatingBar.builder(
                                itemSize: 18,
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
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
                                width: screenWidth(context) * .4,
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
                  height: screenHeight(context) * .03,
                ),
                DefaultTabController(
                    length: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ButtonsTabBar(
                            buttonMargin:
                                EdgeInsets.only(right: 20, bottom: 10),
                            unselectedBackgroundColor: Colors.transparent,
                            labelStyle:
                                GoogleFonts.poppins(color: Colors.white),
                            unselectedLabelStyle:
                                GoogleFonts.poppins(color: Colors.grey),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            height: screenHeight(context) * .08,
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
                /* Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trending Books',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FluButton(
                      onPressed: () {},
                      backgroundColor: Colors.transparent,
                      child: Text(
                        '...',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    )
                  ],
                ), */
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: screenWidth(context),
                    height: screenHeight(context) * .4,
                    child: OnyxsioGridView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: books.length,
                      physics: const BouncingScrollPhysics(),
                      staggeredTileBuilder: (index) =>
                          const OnyxsioStaggeredTile.fit(2),
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => OnyxsioGridTile(
                          index: index,
                          heightList: List.generate(
                              books.length,
                              (index) =>
                                  Random().nextInt(300) +
                                  200), 
                          child: 

                           AnimatedContainer(
                          duration: Duration(
                              milliseconds: 300), // Durée de l'animation
                          curve: Curves.easeInOut,
                          child: SizedBox(
                            width: screenWidth(context),
                            height: screenHeight(context) * .3,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child:  GestureDetector(
                                onTap: (){
                                  PageTransition.fadeTransition(
                                  context, DetailScreen(book: books[index]));
                                },
                                child: Hero(
                                        tag: books[index].img,
                                        child: AnimatedScale(
                                          scale: 1.0, // Échelle initiale
                                          duration: Duration(milliseconds: 200),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            clipBehavior: Clip.hardEdge,
                                            width: screenWidth(context) * .4,
                                            height: screenHeight(context) * .3,
                                            decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: FluImage(books[index].img, fit: BoxFit.fitHeight,),
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                          ),
                    )),
                /* SizedBox(
                  width: screenWidth(context),
                  height: screenHeight(context) * .4,
                  child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Nombre de colonnes
                          childAspectRatio: 1, // Ratio d'aspect par défaut
                        ),
                        itemCount: books.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: randomHeights[index], // Appliquer la hauteur aléatoire
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue, // Couleur d'exemple
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(child: Text(books[index].title)), // Exemple de contenu
                          );
                        },
                      ),
                ), */
               /*  AnimatedContainer(
                  duration: Duration(milliseconds: 300), // Durée de l'animation
                  curve: Curves.easeInOut,
                  child: SizedBox(
                    width: screenWidth(context),
                    height: screenHeight(context) * .3,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: books.map((e) {
                          return GestureDetector(
                            onTap: () {
                              /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(book: e), // Nouvelle page
                                ),
                              ); */
                              PageTransition.fadeTransition(
                                  context, DetailScreen(book: e));
                            },
                            child: Hero(
                              tag: e.img,
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
                                  child: FluImage(e.img),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ), */
                SizedBox(
                  height: screenHeight(context) * .03,
                ),

                /* CarouselSlider(
                    items: books.map((e) {
                      return Container(
                        width: screenWidth(context) * .7,
                        // height: screenHeight(context) * .0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: FluImage(e.img),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 350,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      // onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,
                    )) */
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minelibs2/old/models/bookModel.dart';
import 'package:minelibs2/old/screens/DetailScreen.dart';
import 'package:minelibs2/old/screens/services/savedBook.dart';
import 'package:minelibs2/old/utils/app.utils.dart';
import 'package:minelibs2/old/utils/transition.utils.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({super.key});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  List<BookModel> books = [];
  List<String>? bookList;
  late int? nbBookSaved = 0;

  /* _getSavedBook() async {
    final prefs = await SharedPreferences.getInstance();

    List<String>? bookList = await prefs.getStringList('book_list');
    setState(() {
      nbBookSaved = bookList?.length;
    });
    if (bookList != null) {
      print('book saved $nbBookSaved, books: ${bookList[1]}');
    }
  } */

  @override
  void initState() {
    super.initState();
    _getTotalBooksCount();
    _loadBooks();
  }

  _getTotalBooksCount() async {
    final count = await BookDatabase().getTotalBooksCount();
    setState(() {
      nbBookSaved = count;
    });
    print('books $nbBookSaved');
  }

  Future<void> _loadBooks() async {
    books = await BookDatabase().getBooks();
    setState(() {});
  }

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
                height: screenHeight(context) * .03,
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
                              backgroundColor: Colors.white,
                              child: FluIcon(
                                FluIcons.arrowRight,
                                color: promoteColor,
                              ))
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
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
                              '2h left',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.8),
                                  fontSize: 10),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: defaultVerticalSpacer(context),
              ),
              /* Container(
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
                    const Column(
                      children: [
                        Text(
                          'Number of Pages',
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '121',
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
              ), */
              SizedBox(
                height: defaultVerticalSpacer(context),
              ),
              (nbBookSaved == 0)
                  ? Center(
                      child: Text('Aucun livre en cours de lecture'),
                    )
                  : SizedBox(
                      width: screenWidth(context),
                      height: screenHeight(context) * .48,
                      child: ListView.builder(
                        itemCount: books.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: screenWidth(context),
                            height: screenHeight(context) * .2,
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 20, 20, 20),
                                // gradient: LinearGradient(
                                //   // {{ edit_1 }} Ajout d'un gradient
                                //   colors: [
                                //     // e.color.withOpacity(
                                //     //     0.4), // Couleur plus foncée
                                //     // e.color
                                //     //     .withOpacity(0), // Couleur d'origine
                                //   ],
                                //   begin: Alignment.bottomCenter,
                                //   end: Alignment.topCenter,
                                // ),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Container(
                                    clipBehavior: Clip.hardEdge,
                                    margin: EdgeInsets.only(right: 10),
                                    width: screenWidth(context) * .2,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: FluImage(books[index].img)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: screenWidth(context) * .4,
                                      child: Text(
                                        books[index].title,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      books[index].author,
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(.5)),
                                    ),
                                    Row(
                                      children: [
                                        FluIcon(
                                          FluIcons.star,
                                          style: FluIconStyles.bulk,
                                          color: Colors.orange,
                                        ),
                                        Text('4.5')
                                      ],
                                    ),
                                    SizedBox(
                                      width: screenWidth(context) * .6,
                                      height: 3,
                                      child: LinearProgressIndicator(
                                        backgroundColor:
                                            Colors.white.withOpacity(.4),
                                        color: Colors.white,
                                        value: books[index].pageRead /
                                            books[index].pageNumber,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      )

                      /*  children: bookList?.map((e) {
                            return Container(
                              width: screenWidth(context),
                              height: screenHeight(context) * .2,
                              margin: EdgeInsets.only(bottom: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    // {{ edit_1 }} Ajout d'un gradient
                                    colors: [
                                      e.color.withOpacity(
                                          0.4), // Couleur plus foncée
                                      e.color
                                          .withOpacity(0), // Couleur d'origine
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Container(
                                      clipBehavior: Clip.hardEdge,
                                      margin: EdgeInsets.only(right: 10),
                                      width: screenWidth(context) * .2,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: FluImage(e.img)),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: screenWidth(context) * .4,
                                        child: Text(
                                          e.title,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        e.author,
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(.5)),
                                      ),
                                      Row(
                                        children: [
                                          FluIcon(
                                            FluIcons.star,
                                            style: FluIconStyles.bulk,
                                            color: Colors.orange,
                                          ),
                                          Text('4.5')
                                        ],
                                      ),
                                      SizedBox(
                                        width: screenWidth(context) * .6,
                                        height: 3,
                                        child: LinearProgressIndicator(
                                          backgroundColor:
                                              Colors.white.withOpacity(.4),
                                          color: Colors.white,
                                          value: .7,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          }).toList(), */

                      ),
            ],
          ),
        ),
      ),
    );
  }
}

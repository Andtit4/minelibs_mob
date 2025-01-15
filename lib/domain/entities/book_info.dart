class BookInfo {
 int id;
  String title;
  String author;
  String year;
  String img;
  String description;
  // Color color;
  String bookLink;
  int pageNumber;
  int pageRead;
  int stars;




  BookInfo({
required this.id,
      required this.author,
      required this.description,
      required this.img,
      required this.title,
      required this.year,
      // required this.color,
      required this.bookLink,
      required this.pageNumber,
      required this.pageRead,
      required this.stars
  });
}
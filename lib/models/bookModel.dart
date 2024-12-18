import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BookModel {
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

  BookModel(
      {required this.id,
      required this.author,
      required this.description,
      required this.img,
      required this.title,
      required this.year,
      // required this.color,
      required this.bookLink,
      required this.pageNumber,
      required this.pageRead});
  Future<Color> getDominantColor() async {
    // Charger l'image
    final imageProvider = NetworkImage(img);
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    return paletteGenerator.dominantColor?.color ??
        Colors.grey; // Retourne la couleur dominante ou gris par défaut
  }

  static List<BookModel> getAll() => [
        BookModel(
            id: 1,
            author: 'Withney O.',
            description:
                "Familiar bad boy–meets–good girl—but it's complicated—romance. A teen from a rough neighborhood is taken in by a wealthy family and falls for their daughter. Six months ago, 17-year-old Trice's abusive father shot him, killed his mother, and then committed suicide.",
            img:
                'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1560794474i/44674899.jpg',
            // color: Color(0xff2fbaa3),
            title: 'A love hate Thing',
            year: '1979',
            bookLink: 'https://core.ac.uk/download/pdf/225138024.pdf',
            pageNumber: 121,
            pageRead: 0),
        BookModel(
            id: 2,
            author: 'Alan Trotter',
            description:
                "Dans une ville de durs à cuire, peuplée d'escrocs, d'escrocs et de rackets, se cachent deux durs à cuire : Box et _____. Ce sont le genre d'hommes capables d'obtenir des excuses et des réparations, de vous donner une leçon effrayante. Ils réfléchissent rarement à deux fois et posent très peu de questions.Jusqu'à ce qu'un soir, autour d'une table de poker, ils rencontrent un écrivain de pulp aux idées folles et un détective privé sans scrupules.",
            img: 'https://m.media-amazon.com/images/I/41OS-lQMS1L._SX195_.jpg',
            title: 'Muscle Travel',
            // color: Color(0xfff08a41),
            year: '1979',
            bookLink:
                'https://www.rbrhs.org/site/handlers/filedownload.ashx?moduleinstanceid=3696&dataid=5723&FileName=100-workouts-vol1.pdf',
            pageNumber: 20,
            pageRead: 0),
        BookModel(
            id: 3,
            author: 'Michelle Victoria',
            description:
                " Fred, le monstre solitaire » est un livre pour enfants réconfortant qui suit le voyage attachant d'un monstre solitaire nommé Fred. Vivant tout seul dans une grotte solitaire, Fred aspire à l'amitié et à la compagnie. Avec courage dans son cœur, il décide de s'aventurer dans le monde, d'aller à l'école dans l'espoir de se faire des amis. À travers des illustrations colorées et un récit touchant, ce conte délicieux enseigne aux jeunes lecteurs le pouvoir de la gentillesse, la beauté de l'amitié et la magie de tendre la main aux autres.",
            img:
                'https://payload.cargocollective.com/1/8/266648/14213661/Lionel-1_2000_c.jpg',
            title: 'Fred The Lonely Monster',
            // color: Color(0xffffda21),
            year: '1979',
            bookLink:
                'https://cdn.oxfordowl.co.uk/2017/09/04/11/19/33/189/ort_ss_lonelymonster_tns.pdf',
            pageNumber: 50,
            pageRead: 0),
        BookModel(
            id: 4,
            author: 'Mariama Bâ',
            description:
                "Une si longue lettre est un roman épistolaire de l'écrivaine sénégalaise Mariama Bâ, publié en 1979. L'histoire est racontée à travers une série de lettres écrites par Ramatoulaye, une femme sénégalaise, à sa meilleure amie Aïssatou, après la mort de son mari Modou. Les lettres reflètent les émotions, les luttes et les défis auxquels Ramatoulaye est confrontée en tant que femme dans la société patriarcale du Sénégal.Le roman explore les thèmes de la polygamie, du mariage, de la maternité, de la religion, et de l'éducation des femmes. Ramatoulaye partage ses pensées sur sa propre vie, sur ses relations avec Modou et Aïssatou, ainsi que sur les traditions et les normes sociales qui influencent sa vie et celle des femmes autour d'elle. À travers son récit, Ramatoulaye cherche à trouver son propre chemin vers l'autonomie et l'émancipation, tout en défiant les contraintes imposées par la société.",
            img:
                'https://murya-by-retissia.com/wp-content/uploads/2019/05/l_une-si-longue-lettre-de-mariama-ba-1.jpg',
            title: 'Une si longue lettre',
            // color: Color(0xffffffff),
            year: '1979',
            bookLink: 'https://excerpts.numilog.com/books/9782850493447.pdf',
            pageNumber: 50,
            pageRead: 0),
      ];

  static fromJson(String e) {}

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'year': year,
      'img': img,
      'description': description,
      // 'color': color,
      'bookLink': bookLink,
      'pageNumber': pageNumber,
      'pageRead': pageRead
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
        id: map['id'],
        author: map['author'],
        description: map['description'],
        img: map['img'],
        title: map['title'],
        year: map['year'],
        // color: map['color'],
        bookLink: map['bookLink'],
        pageNumber: map['pageNumber'],
        pageRead: map['pageRead']);
  }
}

import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BookModel {
  String title;
  String author;
  String year;
  String img;
  String description;
  Color color;

  BookModel(
      {required this.author,
      required this.description,
      required this.img,
      required this.title,
      required this.year, required this.color});
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
            author: 'Withney O.',
            description:
                "Familiar bad boy–meets–good girl—but it's complicated—romance. A teen from a rough neighborhood is taken in by a wealthy family and falls for their daughter. Six months ago, 17-year-old Trice's abusive father shot him, killed his mother, and then committed suicide.",
            img:
                'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1560794474i/44674899.jpg',
                color: Color(0xff2fbaa3),
            title: 'A love hate Thing',
            year: '1979'),
        BookModel(
            author: 'Alan Trotter',
            description:
                "Dans une ville de durs à cuire, peuplée d'escrocs, d'escrocs et de rackets, se cachent deux durs à cuire : Box et _____. Ce sont le genre d'hommes capables d'obtenir des excuses et des réparations, de vous donner une leçon effrayante. Ils réfléchissent rarement à deux fois et posent très peu de questions.Jusqu'à ce qu'un soir, autour d'une table de poker, ils rencontrent un écrivain de pulp aux idées folles et un détective privé sans scrupules.",
            img: 'https://m.media-amazon.com/images/I/41OS-lQMS1L._SX195_.jpg',
            title: 'Muscle Travel',
            color: Color(0xfff08a41),
            year: '1979'),
        BookModel(
            author: 'Michelle Victoria',
            description:
                " Fred, le monstre solitaire » est un livre pour enfants réconfortant qui suit le voyage attachant d'un monstre solitaire nommé Fred. Vivant tout seul dans une grotte solitaire, Fred aspire à l'amitié et à la compagnie. Avec courage dans son cœur, il décide de s'aventurer dans le monde, d'aller à l'école dans l'espoir de se faire des amis. À travers des illustrations colorées et un récit touchant, ce conte délicieux enseigne aux jeunes lecteurs le pouvoir de la gentillesse, la beauté de l'amitié et la magie de tendre la main aux autres.",
            img:
                'https://payload.cargocollective.com/1/8/266648/14213661/Lionel-1_2000_c.jpg',
            title: 'Fred The Lonely Monster',
            color: Color(0xffffda21),
            year: '1979'),
        BookModel(
            author: 'Mariama Bâ',
            description:
                "Une si longue lettre est un roman épistolaire de l'écrivaine sénégalaise Mariama Bâ, publié en 1979. L'histoire est racontée à travers une série de lettres écrites par Ramatoulaye, une femme sénégalaise, à sa meilleure amie Aïssatou, après la mort de son mari Modou. Les lettres reflètent les émotions, les luttes et les défis auxquels Ramatoulaye est confrontée en tant que femme dans la société patriarcale du Sénégal.Le roman explore les thèmes de la polygamie, du mariage, de la maternité, de la religion, et de l'éducation des femmes. Ramatoulaye partage ses pensées sur sa propre vie, sur ses relations avec Modou et Aïssatou, ainsi que sur les traditions et les normes sociales qui influencent sa vie et celle des femmes autour d'elle. À travers son récit, Ramatoulaye cherche à trouver son propre chemin vers l'autonomie et l'émancipation, tout en défiant les contraintes imposées par la société.",
            img:
                'https://murya-by-retissia.com/wp-content/uploads/2019/05/l_une-si-longue-lettre-de-mariama-ba-1.jpg',
            title: 'Une si longue lettre',
            color: Color(0xffffffff),
            year: '1979'),
      ];
}

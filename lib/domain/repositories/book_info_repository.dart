
import 'package:minelibs2/domain/entities/book_info.dart';

abstract class BookInfoRepository {
  List<BookInfo> getBookInfoForHome();
  List<BookInfo> getBooksForHome();


}
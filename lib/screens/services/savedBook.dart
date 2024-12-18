// lib/database/book_database.dart
import 'package:minelibs2/models/bookModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BookDatabase {
  static final BookDatabase _instance = BookDatabase._internal();
  factory BookDatabase() => _instance;

  static Database? _database;

  BookDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'books.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE books(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, author TEXT, year TEXT, img TEXT, description TEXT, bookLink TEXT)',
        );
      },
    );
  }

  Future<void> insertBook(BookModel book) async {
    final db = await database;
    await db.insert(
      'books',
      book.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<BookModel>> getBooks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('books');
    return List.generate(maps.length, (i) {
      return BookModel.fromMap(maps[i]);
    });
  }

  Future<void> updateBook(BookModel book) async {
    final db = await database;
    await db.update(
      'books',
      book.toMap(),
      where: 'id = ?',
      whereArgs: [book.id],
    );
  }

  Future<void> deleteBook(int id) async {
    final db = await database;
    await db.delete(
      'books',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> getTotalBooksCount() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('books');
    return maps.length;
  }

  Future<int> countBooksById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('books', where: 'id = ?', whereArgs: [id]);
    return maps.length;
  }
}

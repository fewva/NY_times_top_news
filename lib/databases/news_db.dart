import 'package:nt_top_news/models/archive_article.dart';
import 'package:nt_top_news/models/article_abstract.dart';
import 'package:sqflite/sqflite.dart';

class NewsDB {

  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await createDatabase();

    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();
    return await openDatabase(
      dbPath + "news.db",
      version: 1,
      onCreate: (Database database, int version) async {
        await database.execute('''
          Create table IF NOT EXISTS Articles (
            short_url TEXT PRIMARY KEY,
            cover_url TEXT,
            title TEXT,
            abstract TEXT,
            section TEXT,
            subsection TEXT,
            byline TEXT,
            updated_date DATE
          )
          ''');
      },
    );
  }


  Future <List<ArchiveArticle>> getArticles() async {
    final db = await database;
    
    final List _l = await db.rawQuery('SELECT * FROM Articles ORDER BY updated_date DESC;');
    return _l.map((e) => ArchiveArticle.fromJSON(e)).toList();
  }

  Future<int> insertArticle(ArchiveArticle a) async {
    final db = await database;
    return await db.insert(
      "Articles", a.toJSON(),
      conflictAlgorithm: ConflictAlgorithm.ignore
    );
  }

  Future <void> insertArticles(List <Article> l) async {
    final db = await database;
    for (var article in l) {
      db.insert(
        "Articles", ArchiveArticle.fromArticle(article).toJSON(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
    }
  }

}
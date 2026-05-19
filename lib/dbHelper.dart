import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  static Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'playlist.db');

    return await openDatabase(
      path,
      version: 1,

      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE playlist(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            artist TEXT,
            image TEXT
          )
        ''');
      },
    );
  }

  static Future<void> insertPlaylist(
    String title,
    String artist,
    String image,
  ) async {
    final db = await database;

    await db.insert(
      'playlist',
      {
        'title': title,
        'artist': artist,
        'image': image,
      },
    );
  }

  static Future<List<Map<String, dynamic>>> getPlaylist() async {
    final db = await database;

    return await db.query('playlist');
  }
}
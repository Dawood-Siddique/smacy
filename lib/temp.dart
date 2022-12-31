import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = 'localhost',
                user = 'root',
                password = 'Aventrader123',
                db = 'DreamHome';
  static int port = 3306;

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: password,
      db: db,
      useCompression: false,
      useSSL: false,
      timeout: const Duration(seconds: 10),
    );
    return await MySqlConnection.connect(settings);
  }
}
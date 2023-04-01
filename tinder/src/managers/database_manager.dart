
import 'package:mysql1/mysql1.dart';

class DatabaseManager {
    late MySqlConnection connexion;

    void setConnexion(MySqlConnection conn) => connexion = conn; 
}
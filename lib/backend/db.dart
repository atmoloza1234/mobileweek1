import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DBLocal {
  var dbname = "TCT";

  Future<Database> conDB() async {
    dynamic direc = await getApplicationDocumentsDirectory();
    // print(direc);
    var location = join(direc.path, this.dbname); //path
    // print(location);

    //สร้าง DB File
    var createDB = databaseFactoryIo;
    var db = await createDB.openDatabase(location);
    //  print(db);

    return db;
  }

  Future<void> regis(username, email, password, repassword) async {
    //print('$username $email $password $repassword');
    //สร้าง DB หรือ Open DB
    var db = await this.conDB();
    //กำหนด Store
    var store = intMapStoreFactory.store('username');
    //print(store);

    var user = await store.add(db, {
      'username': username,
      'email': email,
      //'password': hash(password), //ต้องมีการขอรหัสก่อนถึงจะรู้รหัสผ่าน
      'password': password,
      'repassword': repassword,
    });

    print(user);

    await store.find(db).then((value) {
      print(value);
    }).catchError((error) {
      print(error);
    });

    db.close();
  }

  Future<bool> login(username, password) async {
    var db = await this.conDB();
    var store = intMapStoreFactory.store('username');

    var user = await store.find(db);
    print(user);
    for (var item in user) {
      // print(item['username']);

      if (item['username'] == username && item['password'] == password) {
        return true;
      }
    }

    return false;
  }
}

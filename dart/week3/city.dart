import 'country.dart';
import 'problem.dart';
//การสืบทอด
class City extends Country with Problems {
  City() : super("Tokyo","");

  void callSuper() {
    print("เมืองหลวง : " + super.city);
    super.callHello();
  }
  @override //คลาสที่มีเหมือนกัน
  String callAnimal(){
    return "Kangaroo";
  }
}
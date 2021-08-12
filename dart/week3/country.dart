class Country { //สร้างclass
  var country = "Japan";
  var city;
  var _animal = "Kangaroo";
  static var color = "Brown";

  //เรียกใช้ Constructor แบบสั้น
   Country(this.city, this._animal);

  //เรียกใช้ Redirect Constructor 
   Country.jeen(String city , String animal) : this(city, animal);

  //เรียกใช้ Method
  void callHello(){
    print(" Oni ji va ");
  }

  String callAnimal(){
   return this._animal;
  }

}
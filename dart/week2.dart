void main() {
  //print(callGen(2000));
  //print(callColor());
  // เรียกใช้ funtion callWeb
  callWeb("Google",protocal: "https",port : 443);
}

//การเขียนเงื่อนไขแบบ shot-hand
// การ return ภายในบรรทัดเดียว
//String callGen(int year) => (year >= 1996) ? "Gen Z" : "Gen Y";
//void callGen(int year){
//var year = 2000;
/*if(year >= 1996){
    print("Gen Z");
  }  else {
    print("Gen Y");
  }
}*/
// การเช็คเงื่อนไข         ture              false
// return (year >= 1996) ? "Gen Z" : "Gen Y";
//return x;


//การเขียน for in และ return ข้อมูลใน list
/*int callColor([String newColor = "white"]) {
  //          index         0    1
  List<dynamic> color = ["red", "blue", "green"];

  color.add(newColor);

  for (var item in color) {
    print(item);
  }
  return color.length;
}*/

//การเขียนการเชื่อมต่อเว็บและ port แบบการใช้ Arrow Function 
void callWeb(String web ,{int port = 80, String protocal = "http"}) => print("$protocal $web : $port");

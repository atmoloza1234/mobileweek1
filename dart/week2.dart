void main() {
  //print(callGen(2000));
  //print(callColor());
  callWeb("Google",protocal: "https",port : 443);
}

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

/*int callColor([String newColor = "white"]) {
  //          index         0    1
  List<dynamic> color = ["red", "blue", "green"];

  color.add(newColor);

  for (var item in color) {
    print(item);
  }
  return color.length;
}*/

void callWeb(String web ,{int port = 80, String protocal = "http"}) => print("$protocal $web : $port");

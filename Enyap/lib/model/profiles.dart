class Profiles{
  int id;
  String name;
  String surname;
  String nickname;
  String phone;
  String password;

  Profiles({this.name,this.surname,this.nickname,this.phone,this.password});
  Profiles.withId({this.id,this.name,this.surname,this.nickname,this.phone,this.password});

  Map<String,dynamic> toMap(){
    var map=Map<String,dynamic>();
    map["name"]=name;
    map["surname"]=surname;
    map["nickname"]=nickname;
    map["phone"]=phone;
    map["password"]=password;
    if(id != null){
      map["id"]=id;
    }
    return map;
  }
   Profiles.fromObject(dynamic o){
    this.id=int.tryParse(o["id"].toString());
    this.name=o["name"];
    this.surname=o["surname"];
    this.nickname=o["nickname"];
    this.phone=o["phone"];
    this.password=o["password"];
    
  }


}
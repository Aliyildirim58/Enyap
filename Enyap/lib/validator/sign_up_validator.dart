class PersonValidationMixin{
  String Validatefirstname(String value){
    if(value.length<2 || value.length>20){
       return "2 harften az ve 20 Harften fazla olamaz";
    }
  }
  String Validatelastname(String value){
    if(value.length<2 || value.length>20){
       return "2 harften az ve 20 Harften fazla olamaz";
    }
  }
  String Validatenickname(String value){
    if(value.length<2 || value.length>15){
       return "2 harften az ve 15 Harften fazla olamaz";
    }
  }
  String Validatephone(String value){
    if( value.length!=11){
       return "Telefon 11 haneden az veya fazla olamaz";
    }
  }
  String Validatepassword(String value){
    if(value.length<2 || value.length>15){
       return "2 harften az ve 15 Harften fazla olamaz";
    }
  }
}
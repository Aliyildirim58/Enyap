import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/data/Dbhelper.dart';
import 'package:loginpage/model/profiles.dart';
import 'package:loginpage/validator/sign_up_validator.dart';
import 'package:loginpage/screens/login_page.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with PersonValidationMixin {
  var status = "";

  var dbHelper = Dbhelper();

  var name = TextEditingController();

  var surname = TextEditingController();

  var nickname = TextEditingController();

  var phone = TextEditingController();

  var password = TextEditingController();

  var durum = "";

  var formKey = GlobalKey<FormState>();

  _showDialog(BuildContext context) {
    CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: Text('Kayıt Durumu'),
      content: Text('$status'),
      actions: [
        CupertinoDialogAction(
          child: Text('Tamam'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
      ],
    );

    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ENYAP KAYIT OL",
        ),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(45.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  buildFirstNameField(),
                  SizedBox(
                    height: 10.0,
                  ),
                  buildLastNameField(),
                  SizedBox(
                    height: 10.0,
                  ),
                  buildNickNameField(),
                  SizedBox(
                    height: 10.0,
                  ),
                  buildPhoneField(),
                  SizedBox(
                    height: 10.0,
                  ),
                  buildPasswordField(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                          addprofiles(context);
                        }
                      },
                      child: Text(
                        "Kayıt Ol",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blueGrey,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  addprofiles(BuildContext context) async {
    var result = await dbHelper.insert(Profiles(
        name: name.text,
        surname: surname.text,
        nickname: nickname.text,
        phone: phone.text,
        password: password.text));
    if (result != null) {
      status = "Başarılı";
      return _showDialog(context);
    } else {
      status = "Başarısız";
      return _showDialog(context);
    }
  }

  buildFirstNameField() {
    return TextFormField(
      controller: name,
      validator: Validatefirstname,
      decoration: InputDecoration(
        hintText: "İsim",
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(),
        ),
      ),
    );
  }

  buildLastNameField() {
    return TextFormField(
      controller: surname,
      validator: Validatelastname,
      decoration: InputDecoration(
        hintText: "Soyisim",
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(),
        ),
      ),
    );
  }

  buildNickNameField() {
    return TextFormField(
      controller: nickname,
      validator: Validatenickname,
      decoration: InputDecoration(
        hintText: "Kullanıcı Adı",
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(),
        ),
      ),
    );
  }

  buildPhoneField() {
    return TextFormField(
      controller: phone,
      validator: Validatephone,
      decoration: InputDecoration(
        hintText: "Telefon",
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(),
        ),
      ),
    );
  }

  buildPasswordField() {
    return TextFormField(
      controller: password,
      validator: Validatepassword,
      decoration: InputDecoration(
        hintText: "Şifre",
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:loginpage/screens/home_page.dart';
import 'package:loginpage/screens/sign_up.dart';
import 'package:loginpage/validator/sign_in_validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> with SigninValidationMixin {
  var nickname = TextEditingController();
  var password = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.blue[500],
            Colors.purple[500],
            Colors.purple[500],
            Colors.purple[500],
            Colors.blue[500],
            Colors.blue[300],
          ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset("assets/logod.png"),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                  Colors.blueGrey[900],
                  Colors.blueGrey[600],
                  Colors.blueGrey[300],
                ]),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60)),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 18.0,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(175, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              buildNickname(),
                              buildPassword(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      buildSignin(),
                      SizedBox(
                        height: 5.0,
                      ),
                      buildSignup(),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Center(
                          child: Text(
                            "Sosyal Medya ",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          buildfacebooklogo(),
                          buildinstagramlogo(),
                          buildtwitterlogo(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  buildNickname() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.blueGrey[400]))),
      child: TextFormField(
        controller: nickname,
        validator: Validatenickname,
        decoration: InputDecoration(
          hintText: "Kullanıcı Adı",
          hintStyle: TextStyle(color: Colors.blueGrey[400]),
          border: InputBorder.none,
        ),
      ),
    );
  }

  buildPassword() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(),
      child: TextFormField(
        controller: password,
        validator: Validatepassword,
        decoration: InputDecoration(
          hintText: "Şifre",
          hintStyle: TextStyle(color: Colors.blueGrey[400]),
          border: InputBorder.none,
        ),
      ),
    );
  }

  buildSignin() {
    return Container(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.7,
        // ignore: deprecated_member_use
        child: RaisedButton(
          color: Colors.green,
          onPressed: () {
            if (formKey.currentState.validate()) {
              formKey.currentState.save();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
              
            }
          },
          child: Text(
            "Giriş Yap",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  buildSignup() {
    return Container(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.7,
        // ignore: deprecated_member_use
        child: RaisedButton(
          color: Colors.blueAccent,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Signup()));
          },
          child: Text(
            "Kayıt Ol",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  buildfacebooklogo() {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child:
          // ignore: deprecated_member_use
          IconButton(
        icon: Image.asset("assets/facebook.png"),
        onPressed: () {},
      ),
    );
  }

  buildinstagramlogo() {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child:
          // ignore: deprecated_member_use
          IconButton(
        icon: Image.asset("assets/ınstagram.png"),
        onPressed: () {},
      ),
    );
  }

  buildtwitterlogo() {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child:
          // ignore: deprecated_member_use
          IconButton(
        icon: Image.asset("assets/twitter.png"),
        onPressed: () {},
      ),
    );
  }
}

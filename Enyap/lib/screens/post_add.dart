import 'package:flutter/material.dart';
import 'package:loginpage/state/cartstate.dart';
import 'package:loginpage/model/cart.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class Postadd extends StatefulWidget {
  @override
  _PostaddState createState() => _PostaddState();
}

class _PostaddState extends State<Postadd> {
  var txttitle = TextEditingController();
  var txtdescription = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: Text(
          "Gönderi Oluşturma",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(35),
            child: Container(
              child: Column(
                children: [
                  buildtitle(),
                  SizedBox(
                    height: 20,
                  ),
                  builddescription(),
                  SizedBox(
                    height: 30,
                  ),
                  buildsavebutton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildtitle() {
    return TextFormField(
      controller: txttitle,
      decoration: InputDecoration(
          hintText: "Başlık",
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(),
          )),
    );
  }

  builddescription() {
    return TextFormField(
      controller: txtdescription,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
          hintText: " Gönderi İçeriği",
          contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 100),
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(),
          )),
    );
  }

  buildsavebutton() {
    return ElevatedButton(
      onPressed: () async {
        var state = Provider.of<Cartstate>(context, listen: false);
        state.add(Cart(txttitle.text, txtdescription.text));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      },
      child: Text("Kaydet", style: TextStyle(color: Colors.white)),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  String profile_name = "Aylin";
  String profile_surname = "Yılmazer";
  String profile_nickname = "Aylin34";
  String profile_contact = "Aylin_Gitarist34@hotmail.com";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple,
        title: Text(
          "PROFİL",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.purple[100],
        ),
        child: Center(
          child: buildprofiles(),
        ),
      ),
    );
  }

  buildprofiles() {
    return Column(
      children: [
        SizedBox(
          height: 80,
        ),
        CircleAvatar(
          backgroundImage: AssetImage("assets/3.jpg"),
          radius: 60,
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
          color: Colors.purple[700],
          thickness: 0.7,
          indent: 120,
          endIndent: 120,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "İsim",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "$profile_name",
          style: TextStyle(
              color: Colors.purple[600],
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Soyisim",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          "$profile_surname",
          style: TextStyle(
              color: Colors.purple[600],
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Kullanıcı Adı",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "$profile_nickname",
          style: TextStyle(
              color: Colors.purple[600],
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "İletişim Bilgileri",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "$profile_contact",
          style: TextStyle(
              color: Colors.purple[600],
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
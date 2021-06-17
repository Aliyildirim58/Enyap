import 'package:flutter/material.dart';
import 'package:loginpage/screens/login_page.dart';
import 'package:loginpage/state/cartstate.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<Cartstate>(
          create: (context) => Cartstate(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    ));
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/screens/post_details.dart';
import 'package:loginpage/state/cartstate.dart';
import 'package:provider/provider.dart';

class FlowPage extends StatefulWidget {
  @override
  _FlowPage createState() => _FlowPage();
}

class _FlowPage extends State<FlowPage> {
  int _value = 2;
  var Imagelist = ['assets/3.jpg', 'assets/2.jpg', 'assets/1.jpg'];
  var NicknameList = ['Aylin34', 'Egeeee', 'Mehmet41'];
  List LikeList = [0, 0, 0];
  int temp;

  @override
  Widget build(BuildContext context) {
    return Consumer<Cartstate>(builder: (context, state, a) {
      var carts = state.carts;
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "ENYAP ANA SAYFA",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        backgroundColor: Colors.purple[100],
        body: ListView.builder(
          itemCount: state.carts.length,
          itemBuilder: (BuildContext context, int index) {
            var cart = carts[index];
            return Padding(
              padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
              child: Container(
                child: Column(
                  children: [
                    Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details()));
                        },
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage(Imagelist[index]),
                                    radius: 50,
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(2, 0, 2, 0),
                                    child: Text(
                                      cart.title,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 100,
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    NicknameList[index].toString(),
                                    style: TextStyle(
                                        color: Colors.purple,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.purple[700],
                              thickness: 0.7,
                              indent: 20,
                              endIndent: 20,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 20),
                                  child: Text(
                                    cart.description,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    softWrap: false,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              //Like Button
                              onPressed: () {
                                temp = index;
                                likenumber();
                              },
                              icon: Icon(Icons.favorite_border),
                            ),
                            Text(LikeList[index].toString()),
                          ],
                        ),
                        IconButton(
                          //Comment Button
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Details()));
                          },
                          icon: Icon(Icons.chat_bubble_outline),
                        ),
                        DropdownButton(
                            value: _value,
                            items: [
                              DropdownMenuItem(
                                child: Text("Çözüldü"),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("Çözülmedi"),
                                value: 2,
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            })
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }

  void likenumber() {
    setState(() {
      LikeList[temp]++;
    });
  }
}

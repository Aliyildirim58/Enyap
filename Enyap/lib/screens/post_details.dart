import 'package:flutter/material.dart';
import 'package:loginpage/state/cartstate.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var comment_controller = TextEditingController();
  var comment_list = [''];
  var comment_counter = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<Cartstate>(builder: (context, state, a) {
      var carts = state.carts;
      var cart = carts[0];
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "ENYAP",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40),
              child: Card(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/3.jpg'),
                            radius: 50,
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                            child: Text(
                              cart.title,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
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
                            "Aylin34",
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
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                          child: Text(
                            cart.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 15,
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
              child: TextFormField(
                controller: comment_controller,
                decoration: InputDecoration(
                    hintText: "Yorumunuz",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1.0),
                      borderSide: BorderSide(),
                    )),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () async {
                  commentadd();
                },
                child: Text("Gönder")),
            commentbuilder()
          ],
        ),
      );
    });
  }

  commentbuilder() {
    return Expanded(
      child: ListView.builder(
          itemCount: comment_counter,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: Card(
                child: Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 3,
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/3.jpg'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Aylin34",
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(comment_list[index + 1])
                  ],
                ),
              ),
            );
          }),
    );
  }

  commentadd() {
    setState(() {
      comment_counter++;
      comment_list.add(comment_controller.text);
    });
  }
}

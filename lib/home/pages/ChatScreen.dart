import 'package:chat_app_ui/home/utils/chatRoom.dart';
import 'package:flutter/material.dart';

dynamic chatter;

class Chatter extends StatefulWidget {
  final chatterId;
  Chatter({this.chatterId});

  @override
  _ChatterState createState() => _ChatterState();
}

class _ChatterState extends State<Chatter> {
  @override
  Widget build(BuildContext context) {
    getChatterProfile(widget.chatterId).whenComplete(() => print('completed'));
    print(chatter);
    // Future.wait([
    //   ]).then((value){
    //   chatter=value[0];
    //   print(chatter);
    // }).whenComplete((){

    // });
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16, top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    // chatter = null;
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "${chatter['profilePic']}"),
                  maxRadius: 30,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "${chatter['name']}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.settings,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 162,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              // height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      autocorrect: true,
                      minLines: 1,
                      maxLines: 3,
                      style: TextStyle(fontSize: 17),
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

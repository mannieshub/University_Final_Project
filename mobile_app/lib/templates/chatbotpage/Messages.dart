import "package:flutter/material.dart";

class MessagesScreen extends StatefulWidget {
  final List messages;
  const MessagesScreen({Key? key, required this.messages}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return ListView.separated(
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.all(10),
              child: widget.messages[index]['isUserMessage']
                  ? Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 14),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(
                                  20,
                                ),
                                topRight: Radius.circular(0),
                                bottomRight: Radius.circular(
                                    widget.messages[index]['isUserMessage']
                                        ? 20
                                        : 20),
                                topLeft: Radius.circular(widget.messages[index]
                                        ['isUserMessage']
                                    ? 20
                                    : 20),
                              ),
                              color: widget.messages[index]['isUserMessage']
                                  ? Color(0xFFD9D9D9)
                                  : Color(0xFFD9D9D9).withOpacity(0.8)),
                          constraints: BoxConstraints(maxWidth: w * 2 / 3),
                          child: Text(
                            widget.messages[index]['message'].text.text[0],
                            style: TextStyle(
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.bold),
                          )),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 20),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/user-icon.png'),
                        ),
                      ),
                    ])
                  : Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 20),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/user-icon1.png'),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 14),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(
                                  20,
                                ),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(
                                    widget.messages[index]['isUserMessage']
                                        ? 0
                                        : 20),
                                topLeft: Radius.circular(widget.messages[index]
                                        ['isUserMessage']
                                    ? 20
                                    : 0),
                              ),
                              color: widget.messages[index]['isUserMessage']
                                  ? Color(0xFFD9D9D9)
                                  : Color(0xFFD9D9D9).withOpacity(0.8)),
                          constraints: BoxConstraints(maxWidth: w * 2 / 3),
                          child: Text(
                            widget.messages[index]['message'].text.text[0],
                            style: TextStyle(
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.bold),
                          ))
                    ]));
        },
        separatorBuilder: (_, i) => Padding(padding: EdgeInsets.only(top: 10)),
        itemCount: widget.messages.length);
  }
}

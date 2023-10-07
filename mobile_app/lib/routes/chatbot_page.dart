//chatbot + dialogflow
import 'package:mobile_app/templates/chatbotpage/Messages.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

//โรคหลอดเลือดหัวใจคืออะไร

class chatUI extends StatefulWidget {
  const chatUI({super.key});

  @override
  State<chatUI> createState() => _chatUIState();
}

class _chatUIState extends State<chatUI> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];
  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFFEBA37A),
          title: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFEBE9A),
                    textStyle:
                        TextStyle(fontSize: 15), // เปลี่ยนสีปุ่มเป็นสีแดง
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Back',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                  ),
                ),
                Text(
                  "HeartBot",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                ),
                Text(
                  "     ",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        body: Container(
            child: Column(
          children: [
            Expanded(child: MessagesScreen(messages: messages)),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                color: Color(0xFFD9D9D9),
                child: Row(children: [
                  Expanded(
                      child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.black),
                  )),
                  IconButton(
                      onPressed: () {
                        sendMessage(_controller.text);
                        _controller.clear();
                      },
                      icon: Icon(Icons.send)) //message color
                ]))
          ],
        )));
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}

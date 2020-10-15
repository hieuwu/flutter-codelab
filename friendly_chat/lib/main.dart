import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // NEW
import 'package:flutter/cupertino.dart'; // NEW

void main() {
  runApp(MyApp());
}

final ThemeData kIOSTheme = ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FriendlyChatApp();
  }
}

class FriendlyChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FriendlyChat',
      theme: defaultTargetPlatform == TargetPlatform.iOS // NEW
          ? kIOSTheme // NEW
          : kDefaultTheme, // NEW
      home: ChatScreen(),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});
  final AnimationController animationController;
  final String text;
  String _name = 'Your Name';
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0, // NEW
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                child: Text(_name[0]),
              )),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(_name, style: Theme.of(context).textTheme.headline4),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Text(text),
              )
            ]),
          )
        ]),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key key,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final FocusNode _focusNode = FocusNode();
  bool _isComposing = false;
  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      // NEW
      _isComposing = false; // NEW
    });
    ChatMessage message = ChatMessage(
      text: text,
      animationController: AnimationController(
        // NEW
        duration: const Duration(milliseconds: 450), // NEW
        vsync: this, // NEW
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    _focusNode.requestFocus();
    message.animationController.forward();
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                onSubmitted: _isComposing ? _handleSubmitted : null,
                decoration:
                    InputDecoration.collapsed(hintText: 'Send a message'),
                focusNode: _focusNode,
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 14.0),
                child: Theme.of(context).platform == TargetPlatform.iOS
                    ? // MODIFIED
                    CupertinoButton(
                        // NEW
                        child: Text('Send'), // NEW
                        onPressed: _isComposing // NEW
                            ? () =>
                                _handleSubmitted(_textController.text) // NEW
                            : null,
                      )
                    : // NEW
                    IconButton(
                        // MODIFIED
                        icon: const Icon(Icons.send),
                        onPressed: _isComposing
                            ? () => _handleSubmitted(_textController.text)
                            : null,
                      ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friendly Chat"),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: Container(
          child: Column(
            // MODIFIED
            children: [
              // NEW
              Flexible(
                // NEW
                child: ListView.builder(
                  // NEW
                  padding: EdgeInsets.all(8.0), // NEW
                  reverse: true, // NEW
                  itemBuilder: (_, int index) => _messages[index], // NEW
                  itemCount: _messages.length, // NEW
                ), // NEW
              ), // NEW
              Divider(height: 1.0), // NEW
              Container(
                // NEW
                decoration:
                    BoxDecoration(color: Theme.of(context).cardColor), // NEW
                child: _buildTextComposer(), //MODIFIED
              ), // NEW
            ], // NEW
          ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS // NEW
              ? BoxDecoration(
                  // NEW
                  border: Border(
                    // NEW
                    top: BorderSide(color: Colors.grey[200]), // NEW
                  ), // NEW
                ) // NEW
              : null),
    );
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}

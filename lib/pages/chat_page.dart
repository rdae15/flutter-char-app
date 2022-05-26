// ignore_for_file: prefer_is_empty

import 'dart:io';
import 'package:chat_app/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  final List<ChatMessage> _messages = [
   
  ];
  bool _writing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        title: Column(
          children: [
            CircleAvatar(
              child: const Text('Te', style: TextStyle(fontSize: 12),),
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
            ),
            const SizedBox( height: 3),
            const Text('Test 1', style: TextStyle(color: Colors.black87, fontSize: 12),)
          ],
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, i) => _messages[i],
            )
          ),
          const Divider(height: 1),
          Container(
            color: Colors.white,
            height: 50,
            child: _inputChat(),
          ),
        ],
      ),
    );
  }

  _inputChat(){
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: ( texto){
                  setState(() {
                    if(texto.trim().length > 0 ) {
                      _writing = true;
                    } else {
                      _writing = false;
                    }
                  });
                },
                decoration: const InputDecoration.collapsed(
                  hintText: 'Enviar Mensaje',
                ),
                focusNode: _focusNode,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS
              ? CupertinoButton(
                child: const Text('Enviar'), 
                onPressed: _writing ? () => _handleSubmit(_textController.text.trim()) : null,
              )
              : Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child:  IconTheme(
                  data: const IconThemeData(color: Colors.blue),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: const Icon(Icons.send),
                    onPressed: _writing ? () => _handleSubmit(_textController.text.trim()) : null,
                  ),
                ),
              ), 
            ),
          ],
        ),
      ),
    );


  }
  _handleSubmit(String text){
    if (text.length == 0) return;
    print(text);
    _textController.clear();
    _focusNode.requestFocus();
    final newMessage = ChatMessage(
      text: text, 
      uid: '123',
      animationController: AnimationController(vsync: this, duration: const Duration(milliseconds: 200)),
      );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();
    setState(() {
      _writing = false;
    });
  }
  @override
  // Limpia los animation  controller 
  void dispose() {
    for(ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}
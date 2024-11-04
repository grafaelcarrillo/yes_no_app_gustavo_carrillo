import 'package:flutter/material.dart';
import 'package:yes_no_app_gustavo_carrillo/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_gustavo_carrillo/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_gustavo_carrillo/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/5231/5231019.png'),
          ),
        ),
        title: const Text('My Love'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(itemBuilder: (context, index){
                return (index % 2 == 0)
                ? const HerMessageBubble()
                : const MyMessageBubble();

              }
              
              )
            ),

            //Caja de Texto de Mensajes
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}





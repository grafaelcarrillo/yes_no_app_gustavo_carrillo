import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_gustavo_carrillo/domain/entities/message.dart';
import 'package:yes_no_app_gustavo_carrillo/presentation/providers/chat_provider.dart';
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
            backgroundImage: NetworkImage('https://64.media.tumblr.com/290b596a1f081d054e48c13708fc462e/68f124b705c636ba-cc/s500x750/93e16339c583251e232b6190476ef8f2b043ed14.png'),
          ),
        ),
        //Titulo envuelto en una columna, es decir el Title del AppBar es un Column
        title: const Column(
          //Permite alinear el texto a la izquierda
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Texto 'My Love' con sus características
            Text('My Love', style: TextStyle(fontSize: 20),),
            //Separación de los Textos('My Love' y 'En Línea')
            SizedBox(height: 2),
            //Texto 'En línea' con sus características
            Text('En línea', style: TextStyle(fontSize: 12, color: Colors.grey),)
          ],
        ),
        
        
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                //Sirve para enlazar chatScrollControler con el controller necesario de la ListView
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length, 
                itemBuilder: (context, index){
                //Instancia de message que sabrá de quién es el mensaje
                final message = chatProvider.messageList[index];
                  
                return (message.fromWho == FromWho.hers)
                ?  HerMessageBubble(message: message,)
                :  MyMessageBubble(message:message,);

              }
              
              ),
            ),
            //Caja de Texto de Mensajes
            MessageFieldBox(onValue: chatProvider.sendMessage),
          ],
        ),
      ),
    );
  }
}





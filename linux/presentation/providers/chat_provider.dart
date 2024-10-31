import 'package:flutter/material.dart';
import 'package:yes_no_app_gustavo_carrillo/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  List<Message> messageList = [
    Message(text: 'Hola Ader', fromwho: FromWho.me),
    Message(text: '¿Lloras porque reprobaste métodos?', fromwho: FromWho.me)

  ];

  //Controlador para manejar la posición del scroll
  final ScrollController chatScrollControler = ScrollController();
  //Envíar un mensaje
  Future<void> sendMessage(String text) async {
    //El mensaje siempre va a ser 'me' porque yo lo envío
    final newMessage = Message(text: text, fromwho: FromWho.me);
    //Esta línea de código agrega un nuevo mensaje a la lista messageList
    messageList.add(newMessage);
    //Notifica si algo de provider cambio para que se guarde en el estado
    notifyListeners();
    // mueve el scrooll
    moveScrollToBottom();

  }
  //El Future es como una promesa
  //Mover el srooll al último mensaje
  Future<void> moveScrollToBottom() async{
  //Un pequeño atraso en la animación para garantizar que siempre se verá aún cuando se envíen mensajes cortos y rápidos
  await Future.delayed(const Duration(seconds: 1));
  chatScrollControler.animateTo(chatScrollControler.position.maxScrollExtent, duration: const Duration(microseconds: 300), curve: Curves.easeOut);
  }
}
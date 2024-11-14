import 'package:flutter/material.dart';
import 'package:yes_no_app_gustavo_carrillo/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app_gustavo_carrillo/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "Hello, my love", fromWho: FromWho.me, timestamp: DateTime.now()),
    Message(text: "Good night", fromWho: FromWho.me, timestamp: DateTime.now())
  ];

  //Controlador para manejar la velocidad del scroll
  final ScrollController chatScrollController = ScrollController();
  //Instancia de la clase GetYesNoAnswer
  final getYesNoAnswer = GetYesNoAnswer();

  //Enviar un mensaje
  Future<void> sendMessage(String text) async {
    // No envía el mensaje si está vacío
    if (text.isEmpty) {
    return; }
    
    //El mensaje siempre va a ser "me" porque yo lo envío
    final newMessage = Message(text: text, fromWho: FromWho.me, timestamp: DateTime.now());
    
    //Agrega un elemento a la lista "messageList"
    messageList.add(newMessage);
    
    //Condición de final de mensaje con un '?'
    if(text.endsWith('?')){
      herReply();
    }
    print("Cantidad de mensajes en la lista: ${messageList.length}");
    
    //Notifica si algo de provider cambió para que se guarde en el estado
    notifyListeners();
    //Mueve el scroll
    moveScrollToBottom();
  }
    //Mover el scroll al ultimo mensaje
    Future<void> moveScrollToBottom() async {
      //if (chatScrollController.hasClients){
      //Un pequeño atraso en la animacion para garantizar que siempre
      //se vera aún cuando se envien mensajes cortos y rápidos
      await Future.delayed(const Duration(milliseconds: 500));
      chatScrollController.animateTo(
        //Offset: posición de la animación
        //maxScrollExtent determina a lo máximo que el scroll puede dar
        chatScrollController.position.maxScrollExtent, 
        //Duraición de la animación
        duration: const Duration(milliseconds: 300), 
        //Rebote al final de la animación
        curve: Curves.easeOut);
        //}
    
  }
  
  //Responder automáticamente con un mensaje
  Future<void> herReply() async{
    //Obtener el mensaje de la petición
    final herMessage = await getYesNoAnswer.getAnswer();
    //Añadir el mensaje de mi crush a la lista
    messageList.add(herMessage);
    //Notifica si algo de provider cambió para el estado
    notifyListeners();
    //Mueve el scroll hasta el último mensaje recibido
    moveScrollToBottom();
  }
}
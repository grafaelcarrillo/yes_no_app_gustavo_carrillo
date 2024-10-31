import 'package:dio/dio.dart';
import 'package:yes_no_app_gustavo_carrillo/domain/entities/message.dart';

class GetYesNoAnswer {

  //Se crea instancia (objeto) de la clase Dio para manejar las peticiones http
  final _dio = Dio();

  //Obtener la respuesta
  Future<Message> getAnswer() async{
    //Almacenar la petición GET en una variable
    final respounse = await _dio.get('https://yesno.wtf/api');

    //Generar el error
    throw UnimplementedError();

  }
}
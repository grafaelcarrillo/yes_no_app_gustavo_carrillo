import 'package:dio/dio.dart';
import 'package:yes_no_app_gustavo_carrillo/domain/entities/message.dart';
import 'package:yes_no_app_gustavo_carrillo/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {

  //Se crea instancia (objeto) de la clase Dio para manejar las peticiones http
  final _dio = Dio();

  //Obtener la respuesta
  Future<Message> getAnswer() async{
    //Almacenar la petición GET en una variable
    final response = await _dio.get('https://yesno.wtf/api');
    //Almacenar la data de la respuesta en una variable
    final yesNoModel = YesNoModel.fromJsonMap(response.data);
    //Devolver la instancia de 'Message' creada en el modelo
    return yesNoModel.toMessageEntity();

  }
}
//El modelo define qué datos debe tener la aplicación. Investigar MVC
//Modelo = datos; Vista = Pantalla; Controlador = lógica o cómo va a funcionar
//

class YesNoModel {
  //Atributos de la clase
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({required this.answer, required this.forced, required this.image});
}
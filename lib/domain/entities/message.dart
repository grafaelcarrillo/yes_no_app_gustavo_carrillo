import 'package:intl/intl.dart';

enum FromWho { me, hers }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  // Campo para la hora del mensaje, hora y fecha de envío del mensaje
  final DateTime timestamp;

  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
    //Lo hace obligatorio para cada mensaje
    required this.timestamp,
  });
  //Método para obtener la hora con formato que inicializa 'time' con la hora actual
  String get formattedTimestamp{
    return DateFormat('hh:mm a').format(timestamp);
  }
}

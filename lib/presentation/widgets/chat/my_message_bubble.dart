import 'package:flutter/material.dart';
import 'package:yes_no_app_gustavo_carrillo/domain/entities/message.dart';


class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 3),
        
        //Nueva fila para la hora y las palomitas (Row)
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              //Imprime la hora
              message.formattedTimestamp,
              //Especificaciones de la hora (formato)
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            //Espacio entre la hora y las palomitas
            const SizedBox(width: 5), 
            //Palomitas de visto, a un lado de la hora
            const Icon(
              //Nombre del ícono
              Icons.done_all,
              //Tamaño del ícono
              size: 16,
              // Color de las palomitas (azul para "visto")
              color: Colors.blue, 
            ),
          ],
        ),
        const SizedBox(height: 3)
      ],
    );
  }
}
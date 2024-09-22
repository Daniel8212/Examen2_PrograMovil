import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/ticket_provider.dart';

class EditTicketPage extends StatefulWidget {
  final String ticketId;

  const EditTicketPage({required this.ticketId, super.key});

  @override
  _EditTicketPageState createState() => _EditTicketPageState();
}

class _EditTicketPageState extends State<EditTicketPage> {
  late TextEditingController flightNumberController;
  late TextEditingController airlineController;
  // Otros controladores para el resto de los campos

  @override
  void initState() {
    super.initState();
    final provider = context.read<TicketAvionProvider>();
    final ticket = provider.tickets.firstWhere((t) => t.id == widget.ticketId);

    flightNumberController = TextEditingController(text: ticket.flightNumber);
    airlineController = TextEditingController(text: ticket.airline);
    // Inicializa otros controladores con los valores del ticket actual
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Editar Ticket')),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: flightNumberController,
            decoration: const InputDecoration(
              labelText: 'Número de vuelo',  // Etiqueta para el campo
              border: OutlineInputBorder(), // Borde del campo
            ),
          ),
          const SizedBox(height: 10),  // Espacio entre el TextField y los siguientes elementos
          // Puedes agregar más widgets aquí
        ],
      ),
    ),
  );
}
}
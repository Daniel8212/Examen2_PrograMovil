import 'package:examen_programovil_2/features/ticket_avion/domain/entities/ticket_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../provider/ticket_provider.dart';
import '../../data/models/ticket_model.dart';

class AddTicketPage extends StatelessWidget {
  final flightNumberController = TextEditingController();
  final airlineController = TextEditingController();

  AddTicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Ticket')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: flightNumberController,
              decoration: const InputDecoration(labelText: 'Número de vuelo'),
            ),
            TextField(
              controller: airlineController,
              decoration: const InputDecoration(labelText: 'Aerolínea'),
            ),
            ElevatedButton(
              onPressed: () {
                final ticket = Ticket(
                  id: '',
                  flightNumber: flightNumberController.text,
                  airline: airlineController.text,
                  passengerInfo: 'Pasajero',
                  origin: 'Origen',
                  destination: 'Destino',
                  seat: 'Asiento',
                  flightClass: 'Clase',
                );
                context.read<TicketAvionProvider>().addTicket(ticket as TicketEntity);
                context.pop();
              },
              child: const Text('Guardar Ticket'),
            ),
          ],
        ),
      ),
    );
  }
}

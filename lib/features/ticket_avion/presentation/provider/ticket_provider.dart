import 'package:examen_programovil_2/features/ticket_avion/domain/entities/ticket_entity.dart';
import 'package:examen_programovil_2/features/ticket_avion/domain/usecases/ticket_usecase.dart';
import 'package:flutter/material.dart';

class TicketAvionProvider with ChangeNotifier {
  final TicketUseCase ticketUseCase;
  var _tickets = <TicketEntity>[];

  TicketAvionProvider(this.ticketUseCase);

  List<TicketEntity> get tickets => _tickets;

  Future<void> fetchTickets() async {
    _tickets = await ticketUseCase.fetchTickets();
    notifyListeners();
  }

  Future<void> addTicket(TicketEntity ticket) async {
    await ticketUseCase.addTicket(ticket);
    fetchTickets(); // Vuelve a cargar la lista de tickets
  }

  Future<void> updateTicket(String id, TicketEntity ticket) async {
    await ticketUseCase.updateTicket(id, ticket);
    fetchTickets();
  }

  Future<void> deleteTicket(String id) async {
    await ticketUseCase.deleteTicket(id);
    fetchTickets();
  }
}

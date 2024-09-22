import 'package:examen_programovil_2/features/ticket_avion/data/models/ticket_model.dart';

import '../../data/repositories/ticket_repository.dart';
import '../entities/ticket_entity.dart';

class TicketUseCase {
  final TicketRepository repository;

  TicketUseCase(this.repository);

  Future<List<TicketEntity>> fetchTickets() async {
    final tickets = await repository.fetchTickets();
    return tickets.map((ticket) => TicketEntity(
      id: ticket.id,
      flightNumber: ticket.flightNumber,
      airline: ticket.airline,
      passengerInfo: ticket.passengerInfo,
      origin: ticket.origin,
      destination: ticket.destination,
      seat: ticket.seat,
      flightClass: ticket.flightClass,
    )).toList();
  }

  Future<void> addTicket(TicketEntity ticket) async {
    await repository.addTicket(ticket as Ticket);
  }

  Future<void> updateTicket(String id, TicketEntity ticket) async {
    await repository.updateTicket(id, ticket as Ticket);
  }

  Future<void> deleteTicket(String id) async {
    await repository.deleteTicket(id);
  }
}

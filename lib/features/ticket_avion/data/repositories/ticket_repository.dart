import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/ticket_model.dart';

class TicketRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('TicketAvion');

  Future<List<Ticket>> fetchTickets() async {
    var snapshot = await collection.get();
    return snapshot.docs.map((doc) => Ticket.fromFirestore(doc)).toList();
  }

  Future<void> addTicket(Ticket ticket) async {
    await collection.add(ticket.toFirestore());
  }

  Future<void> updateTicket(String id, Ticket ticket) async {
    await collection.doc(id).update(ticket.toFirestore());
  }

  Future<void> deleteTicket(String id) async {
    await collection.doc(id).delete();
  }
}

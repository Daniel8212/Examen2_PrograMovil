import 'package:cloud_firestore/cloud_firestore.dart';

class Ticket {
  final String id;
  final String flightNumber;
  final String airline;
  final String passengerInfo;
  final String origin;
  final String destination;
  final String seat;
  final String flightClass;

  Ticket({
    required this.id,
    required this.flightNumber,
    required this.airline,
    required this.passengerInfo,
    required this.origin,
    required this.destination,
    required this.seat,
    required this.flightClass,
  });

  factory Ticket.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return Ticket(
      id: doc.id,
      flightNumber: data['flightNumber'],
      airline: data['airline'],
      passengerInfo: data['passengerInfo'],
      origin: data['origin'],
      destination: data['destination'],
      seat: data['seat'],
      flightClass: data['flightClass'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'flightNumber': flightNumber,
      'airline': airline,
      'passengerInfo': passengerInfo,
      'origin': origin,
      'destination': destination,
      'seat': seat,
      'flightClass': flightClass,
    };
  }
}

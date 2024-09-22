class TicketEntity {
  final String id;
  final String flightNumber;
  final String airline;
  final String passengerInfo;
  final String origin;
  final String destination;
  final String seat;
  final String flightClass;

  TicketEntity({
    required this.id,
    required this.flightNumber,
    required this.airline,
    required this.passengerInfo,
    required this.origin,
    required this.destination,
    required this.seat,
    required this.flightClass,
  });
}

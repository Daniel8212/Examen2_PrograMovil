import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../provider/ticket_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TicketAvionProvider>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tickets de Avión'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.push('/add-ticket'),
          )
        ],
      ),
      body: provider.tickets.isEmpty
        ? const Center(child: Text('No hay tickets'))
        : ListView.builder(
            itemCount: provider.tickets.length,
            itemBuilder: (context, index) {
              final ticket = provider.tickets[index];
              return ListTile(
                title: Text(ticket.flightNumber),
                subtitle: Text('${ticket.airline} - ${ticket.passengerInfo}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    provider.deleteTicket(ticket.id);
                  },
                ),
                onTap: () {
                  context.push('/edit-ticket/${ticket.id}');
                },
              );
            },
          ),
    );
  }
}

import 'package:go_router/go_router.dart';
import 'features/ticket_avion/presentation/pages/home_page.dart';
import 'features/ticket_avion/presentation/pages/add_ticket_page.dart';
import 'features/ticket_avion/presentation/pages/edit_ticket_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(path: '/add-ticket', builder: (context, state) => AddTicketPage()),
      GoRoute(
        path: '/edit-ticket/:id',
        builder: (context, state) => EditTicketPage(ticketId: state.params['id']!),
      ),
    ],
  );
}

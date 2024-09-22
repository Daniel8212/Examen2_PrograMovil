import 'package:examen_programovil_2/features/ticket_avion/data/repositories/ticket_repository.dart';
import 'package:examen_programovil_2/features/ticket_avion/domain/usecases/ticket_usecase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/firebase_config.dart';
import 'features/ticket_avion/presentation/provider/ticket_provider.dart';
import 'router.dart';  

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);

  final ticketRepository = TicketRepository();
  final ticketUseCase = TicketUseCase(ticketRepository);

  runApp(MyApp(ticketUseCase: ticketUseCase));
}

class MyApp extends StatelessWidget {
  final TicketUseCase ticketUseCase;

  const MyApp({Key? key, required this.ticketUseCase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TicketAvionProvider(ticketUseCase)),
      ],
      child: MaterialApp.router(
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
        title: 'Ticket Avión CRUD',
      ),
    );
  }
}

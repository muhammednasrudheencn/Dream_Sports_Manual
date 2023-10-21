import 'package:dream_sports_turf_owner/blocs/bloc/splashbloc_bloc.dart';
import 'package:dream_sports_turf_owner/screens/start/screen_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const DreamSportsTurfOwners());
}

class DreamSportsTurfOwners extends StatelessWidget {
  const DreamSportsTurfOwners({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashblocBloc()..add(InitialEvent()),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Play'),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}

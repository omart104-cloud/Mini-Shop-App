import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'blocs/blocs.dart';
import 'data/services/api_service.dart';
import 'presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MiniShopApp());
}

class MiniShopApp extends StatelessWidget {
  const MiniShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService(baseUrl: 'https://dummyjson.com');

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductCubit(apiService: apiService)),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: MaterialApp(
        title: 'Mini Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

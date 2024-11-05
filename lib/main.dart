// lib/main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:orange_potion/screens/cart_screen.dart';
import 'package:orange_potion/screens/product_detail_screen.dart';
import 'package:orange_potion/screens/product_list_screen.dart';
import 'package:orange_potion/screens/profile_screen.dart';
import 'package:provider/provider.dart';
import './providers/products_provider.dart';
import './providers/cart_provider.dart';
import './screens/auth_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    debugPrint('Firebase 초기화 성공');
  } catch (e) {
    debugPrint('Firebase 초기화 오류: $e');
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Orange Potion',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          colorScheme: const ColorScheme.light(
            primary: Colors.orange,
            secondary: Colors.orangeAccent,
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
        ),
        home: const AuthScreen(),
        routes: {
          '/product-list': (_) => const ProductListScreen(),
          '/product-detail': (_) => const ProductDetailScreen(),
          '/cart': (_) => const CartScreen(),
          '/profile': (_) => ProfileScreen(),
        },
      ),
    );
  }
}
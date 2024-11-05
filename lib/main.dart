// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/products_provider.dart';
import './providers/cart_provider.dart';
import './screens/home_screen.dart';
import './screens/cart_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/product_list_screen.dart';
import './screens/profile_screen.dart';

void main() {
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
      child: MaterialApp(    // const 제거
        title: 'Orange Potion',
        theme: ThemeData(    // const 제거
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
        home: const HomeScreen(),
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
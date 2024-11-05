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
      child: MaterialApp(
        title: 'Orange Potion',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          colorScheme: const ColorScheme.light().copyWith(
            primary: Colors.orange,
            secondary: Colors.orangeAccent,
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
          ),
        ),
        home: HomeScreen(),
        routes: {
          '/product-list': (_) => ProductListScreen(),
          '/product-detail': (_) => ProductDetailScreen(),
          '/cart': (_) => CartScreen(),
          '/profile': (_) => ProfileScreen(),
        },
      ),
    );
  }
}
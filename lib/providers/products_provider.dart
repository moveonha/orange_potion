// lib/providers/products_provider.dart
import 'package:flutter/foundation.dart';
import '../models/product.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: '오렌지 포션',
      description: '체력을 회복시켜주는 오렌지 포션입니다.',
      price: 15000,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      id: 'p2',
      title: '블루 포션',
      description: '마나를 회복시켜주는 블루 포션입니다.',
      price: 20000,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    // 더 많은 상품 추가
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((item) => item.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
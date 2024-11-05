// lib/providers/products_provider.dart
import 'package:flutter/foundation.dart';
import '../models/product.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: '상품1',
      description: 'test description',
      price: 15000,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      id: 'p2',
      title: '상품2',
      description: '마나를 회복시켜주는 블루 포션입니다.',
      price: 20000,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    // 더 많은 상품 추가 가능
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((item) => item.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere(
      (product) => product.id == id,
      orElse: () => throw Exception('상품을 찾을 수 없습니다.'),
    );
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
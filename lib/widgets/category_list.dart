
// lib/widgets/category_list.dart
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        children: const [
          CategoryChip(label: '전체'),
          CategoryChip(label: '신상품'),
          CategoryChip(label: '베스트'),
          CategoryChip(label: '특가'),
          CategoryChip(label: '기획전'),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;

  const CategoryChip({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FilterChip(
        label: Text(label),
        selected: false,
        onSelected: (bool selected) {
          // Provider를 통해 카테고리 필터링 구현
        },
      ),
    );
  }
}
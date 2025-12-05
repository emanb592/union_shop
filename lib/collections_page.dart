import 'package:flutter/material.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const collections = [
      {'title': 'Hoodies', 'image': 'https://via.placeholder.com/300x200?text=Hoodies'},
      {'title': 'T-Shirts', 'image': 'https://via.placeholder.com/300x200?text=T-Shirts'},
      {'title': 'Accessories', 'image': 'https://via.placeholder.com/300x200?text=Accessories'},
      {'title': 'Stationery', 'image': 'https://via.placeholder.com/300x200?text=Stationery'},
      {'title': 'SALE', 'image': 'https://via.placeholder.com/300x200?text=SALE'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Collections')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: collections.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 cards per row
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 4 / 3,
          ),
          itemBuilder: (context, i) {
            final item = collections[i];
            return GestureDetector(
              onTap: () {
                // 
                // Navigator.pushNamed(context, '/collection', arguments: item['title']);
              },
              child: Card(
                elevation: 2,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.network(
                        item['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        item['title']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class SalePage extends StatelessWidget {
  const SalePage({super.key});

  @override
  Widget build(BuildContext context) {
    const saleItems = [
      {'title': 'UPSU Hat', 'price': '£5.00', 'image': 'https://media.istockphoto.com/id/1451763647/photo/blue-baseball-cap.jpg?s=612x612&w=0&k=20&c=OhaJCq02EKoc0G11ULclrVj8UwS0DyK2AY6l56I3NUw='},
      {'title': 'Hoodie', 'price': '£15.00', 'image': 'https://media.istockphoto.com/id/1142211733/photo/front-of-sweatshirt-with-hood-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=inMPwtP-ebqhXD9_A3bHETPkyC37x0rFNSLYgf6rLMM='},
      {'title': 'UPSU T-shirt', 'price': '£15.00', 'image': 'https://www.earthuniform.com/cdn/shop/files/TMO_CLASSIC_TEE_PURPLE_FRONT_1445x.jpg?v=1717680780'},
      {'title': 'UPSU Beanie', 'price': '£10.00', 'image': 'https://media.istockphoto.com/id/2151757920/photo/violet-winter-autumn-hat-cap-on-invisible-mannequin-isolated-on-white.jpg?s=612x612&w=0&k=20&c=Ehf4Op5kVEVDBPyfV8OL7Y60IZpZgIcKVtf9xwcpB-c='},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Sale')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: saleItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,       // 2 cards per row
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 4 / 3, // adjust as needed
          ),
          itemBuilder: (context, i) {
            final item = saleItems[i];
            return Card(
              elevation: 2,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  // 
                  // Navigator.pushNamed(context, '/product', arguments: item);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.network(item['image']!, fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['title']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 6),
                          Text(item['price']!, style: const TextStyle(fontSize: 14, color: Colors.red)),
                        ],
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
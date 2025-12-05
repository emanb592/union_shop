import 'package:flutter/material.dart';

class HeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HeaderAppBar({super.key, required void Function() onHome, required Null Function() onShop, required Null Function() onContact, required Future<Object?> Function() onAbout, required Null Function() onSearch});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final isMobile = c.maxWidth < 600;
        if (isMobile) {
          // Compact mobile header
          return AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0.5,
            titleSpacing: 8,
            title: Row(
              children: [
                Image.network(
                  'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                  height: 28,
                ),
                const Spacer(),
                // Collapsed "Menu" for nav
                PopupMenuButton<String>(
                  offset: const Offset(0, 8),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Menu', style: TextStyle(color: Colors.black)),
                  ),
                  onSelected: (v) {
                    switch (v) {
                      case 'home':
                        Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
                        break;
                      case 'collections':
                        Navigator.pushNamed(context, '/collections');
                        break;
                      case 'sale':
                        Navigator.pushNamed(context, '/sale');
                        break;
                      case 'about':
                        Navigator.pushNamed(context, '/about');
                        break;
                      case 'contact':
                        // 
                        break;
                    }
                  },
                  itemBuilder: (context) => const [
                    PopupMenuItem(value: 'home', child: Text('Home')),
                    PopupMenuItem(value: 'collections', child: Text('Shop / Collections')),
                    PopupMenuItem(value: 'sale', child: Text('Sale')),
                    PopupMenuItem(value: 'about', child: Text('About')),
                    PopupMenuItem(value: 'contact', child: Text('Contact')),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.black),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.person_outline, color: Colors.black),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
          );
        }

        // Desktop/tablet header
        return AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.5,
          titleSpacing: 16,
          title: Row(
            children: [
              Image.network(
                'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                height: 32,
              ),
              const SizedBox(width: 16),
              Wrap(
                spacing: 20,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false),
                    child: const Text('Home'),
                  ),
                  PopupMenuButton<String>(
                    offset: const Offset(0, 8),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Shop'),
                    ),
                    onSelected: (v) {
                      if (v == 'collections') Navigator.pushNamed(context, '/collections');
                      if (v == 'sale') Navigator.pushNamed(context, '/sale');
                    },
                    itemBuilder: (context) => const [
                      PopupMenuItem(value: 'collections', child: Text('All Collections')),
                      PopupMenuItem(value: 'sale', child: Text('Sale')),
                    ],
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/about'),
                    child: const Text('About'),
                  ),
                  TextButton(
                    onPressed: () {}, // Contact
                    child: const Text('Contact'),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(icon: const Icon(Icons.search, color: Colors.black), onPressed: () {}),
              IconButton(icon: const Icon(Icons.person_outline, color: Colors.black), onPressed: () {}),
              IconButton(icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black), onPressed: () {}),
            ],
          ),
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/about_us_page.dart';
import 'package:union_shop/collections_page.dart';
import 'package:union_shop/sale_page.dart';
// ignore: unused_import
import 'home_screen.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        '/collections': (context) => const CollectionsPage(),
        '/sale': (context) => const SalePage(),
        '/about': (context) => const AboutUsPage(),
        '/product': (context) => const ProductPage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ensure page background matches
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              height: 200,
              color: Colors.white,
              child: Column(
                children: [
                  // Top banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    
                    color: const Color(0xFF4d2963),
                    child: const Text(
                      'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  // Main header
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center, // center items vertically
                        children: [
                          GestureDetector(
                            onTap: () {
                              navigateToHome(context);
                            },
                            child: Image.network(
                              'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                              height: 30,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  width: 18,
                                  height: 18,
                                  child: const Center(
                                    child: Icon(Icons.image_not_supported,
                                        color: Colors.grey),
                                  ),
                                );
                              },
                            ),
                          ),

                          const SizedBox(width: 16),

                          // Buttons block
                          Column(
                            mainAxisSize: MainAxisSize.min, // keep column tight to its content
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                spacing: 20,      // horizontal gap between buttons
                                runSpacing: 8,    // vertical gap if they wrap
                                children: [
                                  TextButton(onPressed: () => navigateToHome(context), child: const Text('Home')),
                                  PopupMenuButton<String>(
                                    child: const Text('Shop'),
                                    onSelected: (value) {
                                      if (value == 'collections') {
                                        Navigator.pushNamed(context, '/collections');
                                      } else if (value == 'sale') {
                                        Navigator.pushNamed(context, '/sale');
                                      }
                                    },
                                    itemBuilder: (context) => const [
                                      PopupMenuItem(value: 'collections', child: Text('All Collections')),
                                      PopupMenuItem(value: 'sale', child: Text('Sale')),
                                    ],
                                  ),
                                  TextButton(onPressed: placeholderCallbackForButtons, child: const Text('The Print Shack')),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 20,
                                runSpacing: 8,
                                children: [
                                  TextButton(onPressed: () => Navigator.pushNamed(context, '/sale'), child: const Text('SALE!')),
                                  TextButton(onPressed: () => Navigator.pushNamed(context, '/about'), child: const Text('About')),
                                  TextButton(onPressed: placeholderCallbackForButtons, child: const Text('UPSU.net')),
                                ],
                              ),
                            ],
                          ),

                          // Push the icon group to the far right
                          const Spacer(),

                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 600),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.search,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.person_outline,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.shopping_bag_outlined,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.menu,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Hero Section
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  ),
                  // Content overlay
                  Positioned(
                    left: 30,
                    right: 30,
                    top: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'THE UNION SHOP',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Welcome to the The University of Portsmouth's very own Union Shop!",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            height: 1.5,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 2
                        
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: placeholderCallbackForButtons,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text(
                            'BROWSE PRODUCTS',
                            style: TextStyle(fontSize: 14, letterSpacing: 2, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Products Section
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const Text(
                      'PRODUCTS SECTION',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 50),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: const [
                        ProductCard(
                          title: 'UPSU Hats',
                          price: '£5.00',
                          imageUrl:
                              'https://media.istockphoto.com/id/1451763647/photo/blue-baseball-cap.jpg?s=612x612&w=0&k=20&c=OhaJCq02EKoc0G11ULclrVj8UwS0DyK2AY6l56I3NUw=',
                        ),
                        ProductCard(
                          title: 'UPSU Hoodie',
                          price: '£15.00',
                          imageUrl:
                              'https://media.istockphoto.com/id/1142211733/photo/front-of-sweatshirt-with-hood-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=inMPwtP-ebqhXD9_A3bHETPkyC37x0rFNSLYgf6rLMM=',
                        ),
                        ProductCard(
                          title: 'UPSU T-shirt',
                          price: '£0.00',
                          imageUrl:
                              'https://www.earthuniform.com/cdn/shop/files/TMO_CLASSIC_TEE_PURPLE_FRONT_1445x.jpg?v=1717680780',
                        ),
                        ProductCard(
                          title: 'UPSU Beanie',
                          price: '£10.00',
                          imageUrl:
                              'https://media.istockphoto.com/id/2151757920/photo/violet-winter-autumn-hat-cap-on-invisible-mannequin-isolated-on-white.jpg?s=612x612&w=0&k=20&c=Ehf4Op5kVEVDBPyfV8OL7Y60IZpZgIcKVtf9xwcpB-c=',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Footer
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(24),
                    child: const Text(
                      'Opening Hours\n\n❄️Winter Break \n  Closures Dates❄️\n\n Closing 4pm\n 19/12/2025\n\n Reopening 10am\n05/01/2026\n\n Last past date:\n 12pm onn18/12/2025\n\n ----------------------------------\n\n (Term Time)\n\n Monday - Friday 10am - 4pm\n\n (Outside of Term Time / Consolidation Weeks) \n\n Monday - Friday 10am - 3pm\n\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(24),
                    child: const Text(
                      'Help and\nInformation\n\nSearch\n\nTerms &\nConditions of Sale\nPolicy',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,     // bolder text
                        height: 1.6,                     // line height
                        letterSpacing: 0.3,  
                        fontStyle: FontStyle.italic            // subtle spacing
                      ),
                    ),
                  ),
                ),
                // New third container
                Expanded(
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(24),
                    child: const Text(''),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                maxLines: 2,
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

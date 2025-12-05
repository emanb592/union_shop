import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        actions: [
          TextButton(
            onPressed: () => navigateToHome(context),
            child: const Text('Home', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Who We Are',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              'We are the University Union Shop, dedicated to supporting students with official merchandise, essentials, and community-driven initiatives.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'Our Mission',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Text(
              'To provide affordable, high-quality products while reinvesting profits into student services and activities.',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 24),
            Text(
              'Contact',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Text(
              'Email: shop@union.example\nPhone: +44 1234 567890\nAddress: Student Union Building, Campus Road',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}


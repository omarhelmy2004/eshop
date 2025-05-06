import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Help & Support',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.help_outline, color: Colors.green),
            title: const Text('FAQs'),
            subtitle: const Text('Find answers to common questions'),
            onTap: () {
              // Handle FAQs
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.contact_support, color: Colors.green),
            title: const Text('Contact Support'),
            subtitle: const Text('Get in touch with our team'),
            onTap: () {
              // Handle contact support
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline, color: Colors.green),
            title: const Text('About Us'),
            subtitle: const Text('Learn more about our company'),
            onTap: () {
              // Handle about us
            },
          ),
        ],
      ),
    );
  }
}

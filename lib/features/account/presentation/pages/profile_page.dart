import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static String id = 'ProfilePage';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showOrderHistory = true;

  void toggleView() {
    setState(() {
      showOrderHistory = !showOrderHistory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(fontSize: 24)), // Increased size
        backgroundColor: Colors.green,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Order History', style: TextStyle(fontSize: 18)), // Increased size
                Switch(
                  value: showOrderHistory,
                  onChanged: (value) {
                    toggleView();
                  },
                ),
                const Text('Email', style: TextStyle(fontSize: 18)), // Increased size
              ],
            ),
            Expanded(
              child: showOrderHistory ? const OrderHistory() : const EmailInfo(),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle logout logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(200, 60), // Increased size
              ),
              child: const Text('Logout', style: TextStyle(fontSize: 20)), // Increased size
            ),
          ],
        ),
      ),
    );
  }
}

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        ListTile(
          title: Text('Order #12345', style: TextStyle(fontSize: 18)), // Increased size
          subtitle: Text('Date: 2023-01-01\nTotal: \$100.00', style: TextStyle(fontSize: 16)), // Increased size
        ),
        ListTile(
          title: Text('Order #12346', style: TextStyle(fontSize: 18)), // Increased size
          subtitle: Text('Date: 2023-02-01\nTotal: \$150.00', style: TextStyle(fontSize: 16)), // Increased size
        ),
        // Add more orders here
      ],
    );
  }
}

class EmailInfo extends StatelessWidget {
  const EmailInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Email: user@example.com', style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          Text('Change your email in account settings.', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
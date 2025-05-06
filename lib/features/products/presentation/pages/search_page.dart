import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.products, required this.categories});

  final List<String> products;
  final List<String> categories;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    final filteredProducts = selectedFilter == 'All' || selectedFilter == 'Products'
        ? widget.products
            .where((product) => product.toLowerCase().contains(query.toLowerCase()))
            .toList()
        : [];
    final filteredCategories = selectedFilter == 'All' || selectedFilter == 'Categories'
        ? widget.categories
            .where((category) => category.toLowerCase().contains(query.toLowerCase()))
            .toList()
        : [];
    // Placeholder: Update logic if products have a brand property in the future

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search...',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: query.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                setState(() {
                                  query = '';
                                });
                              },
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        query = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: selectedFilter,
                  items: const [
                    DropdownMenuItem(value: 'All', child: Text('All')),
                    DropdownMenuItem(value: 'Products', child: Text('Products')),
                    DropdownMenuItem(value: 'Categories', child: Text('Categories')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedFilter = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: filteredProducts.isEmpty && filteredCategories.isEmpty
                  ? const Center(
                      child: Text(
                        'No results found',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView(
                      children: [
                        if (filteredProducts.isNotEmpty) ...[
                          const Text(
                            'Products',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          ...filteredProducts.map((product) => Card(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                child: ListTile(
                                  title: Text(product),
                                  leading: const Icon(Icons.shopping_bag),
                                ),
                              )),
                        ],
                        if (filteredCategories.isNotEmpty) ...[
                          const SizedBox(height: 16),
                          const Text(
                            'Categories',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          ...filteredCategories.map((category) => Card(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                child: ListTile(
                                  title: Text(category),
                                  leading: const Icon(Icons.category),
                                ),
                              )),
                        ],
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

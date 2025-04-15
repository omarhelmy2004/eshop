import 'package:eshop/core/presentation/widgets/logo.dart';
import 'package:eshop/core/presentation/widgets/search_bar.dart';
import 'package:eshop/features/products/presentation/cubit/product_cubit.dart';
import 'package:eshop/features/products/presentation/pages/wishlist_page.dart';
import 'package:eshop/features/products/presentation/widgets/horizontal_products_grid.dart';
import 'package:eshop/features/products/presentation/widgets/promo_banner.dart';
import 'package:eshop/features/products/presentation/pages/selected_category_page.dart';
import 'package:eshop/features/products/presentation/widgets/category_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Fetch products when the page is initialized
    context.read<ProductCubit>().getAllProducts();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Logo(),
            SizedBox(width: 15), // Adjust spacing between Logo and SearchBar
            Expanded(
              child: SizedBox(
                height: 40,
                child: CustomSearchBar(
                    enColor: Colors.green, foColor: Colors.black),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border_rounded,
                size: 28), // Adjust icon size
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WishlistPage(),
                ),
              );
            },
          ),
          const SizedBox(width: 10), // Add spacing after the favorite icon
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoaded) {
  return ListView(
    children: [
      // Add promotional banner
      SizedBox(
        height: 170,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: const [
                PromoBanner(
                  discount: '30% OFF',
                  title: 'On Headphones',
                  subtitle: 'Exclusive Sales',
                  image:
                      'https://static.vecteezy.com/system/resources/thumbnails/044/283/776/small_2x/white-headphone-on-transparent-background-image-png.png',
                ),
                PromoBanner(
                  discount: '50% OFF',
                  title: 'On Speakers',
                  subtitle: 'Limited Time Offer',
                  image:
                      'https://static.vecteezy.com/system/resources/thumbnails/044/283/776/small_2x/white-headphone-on-transparent-background-image-png.png',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  2, // Number of banners
                  (index) =>
                      IndicatorDot(isActive: index == _currentPage),
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 20), // Add spacing after the banner
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CategoryButton(
              label: 'Electronics',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectedCategoryPage(
                        categoryName: 'Technology'),
                  ),
                );
              },
            ),
            const SizedBox(width: 10),
            CategoryButton(
              label: 'Men\'s clothing',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectedCategoryPage(
                        categoryName: 'Fashion'),
                  ),
                );
              },
            ),
            const SizedBox(width: 10),
            CategoryButton(
              label: 'Jewelery',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectedCategoryPage(
                        categoryName: 'Sports'),
                  ),
                );
              },
            ),
            const SizedBox(width: 10),
            CategoryButton(
              label: 'Women\'s clothing',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectedCategoryPage(
                        categoryName: 'Superman'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      const SizedBox(
          height: 20), // Add spacing after the category buttons
  
      const Padding(
        padding: EdgeInsets.only(bottom: 9.0),
        child: Text('Recommended for you',
            style:
                TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
      ),
       SizedBox(
         height: 250,
         child: HorizontalProductsGrid(
           productsList: (state.productsList..shuffle()).take(20).toList(),
         ),
       ),
      const SizedBox(
          height: 40), // Add spacing after the category buttons
  
      const Padding(
        padding: EdgeInsets.only(bottom: 9.0),
        child: Text('Hot Sale',
            style:
                TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
      ),
       SizedBox(height: 250, child: HorizontalProductsGrid(productsList: state.productsList.where((product) => product.onSale == true).toList(),)),
      const SizedBox(
          height: 40), // Add spacing after the category buttons
  
      const Padding(
        padding: EdgeInsets.only(bottom: 9.0),
        child: Text('Most Popular',
            style:
                TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
      ),
       SizedBox(height: 250, child: HorizontalProductsGrid(productsList: state.productsList.where((product) => product.popular == true).toList(),)),
    ],
  );
            } else if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductError) {
              return Center(child: Text(state.error));
            } else {
              return const Center(child: Text('No products available'));
}
          },
        ),
      ),
    );
  }
}

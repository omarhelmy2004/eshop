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
import 'search_page.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
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
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(
                    products: ['Laptop', 'Smartphone', 'Tablet', 'Headphones'],
                    categories: ['Electronics', 'Accessories', 'Furniture'],
                  ),
                ),
              );
            },
          ),
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
                  GestureDetector(child:  PromoBannerSection(),
                    onTap: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  SelectedCategoryPage(
                            categoryName: 'audio',
                            productslist: state.productsList, // Pass the relevant products list
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20), // Add spacing after the banner
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CategoryButton(
                          label: 'TV',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  SelectedCategoryPage(
                                    categoryName: 'TV', productslist: state.productsList,),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 10),
                        CategoryButton(
                          label: 'Audio',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  SelectedCategoryPage(
                                    categoryName: 'Audio', productslist: state.productsList),
                              ),
                            );
                          },
                        ),
                       
                        const SizedBox(width: 10),
                        CategoryButton(
                          label: 'Mobile',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  SelectedCategoryPage(
                                    categoryName: 'Mobile', productslist: state.productsList),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 10),
                        CategoryButton(
                          label: 'Gaming',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  SelectedCategoryPage(
                                    categoryName: 'Gaming', productslist: state.productsList),
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
                  SizedBox(
                      height: 250,
                      child: HorizontalProductsGrid(
                          productsList: state.productsList
                              .where((product) => product.onSale == true)
                              .toList())),
                  const SizedBox(
                      height: 40), // Add spacing after the category buttons

                  const Padding(
                    padding: EdgeInsets.only(bottom: 9.0),
                    child: Text('Most Popular',
                        style:
                            TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                      height: 250,
                      child: HorizontalProductsGrid(
                          productsList: state.productsList
                              .where((product) => product.popular == true)
                              .toList())),
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

class PromoBannerSection extends StatefulWidget {
  const PromoBannerSection({super.key});

  @override
  State<PromoBannerSection> createState() => _PromoBannerSectionState();
}

class _PromoBannerSectionState extends State<PromoBannerSection> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                (index) => IndicatorDot(isActive: index == _currentPage),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

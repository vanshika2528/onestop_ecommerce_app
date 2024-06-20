import 'package:onestop/controllers/navigation_controller.dart';
import 'package:onestop/controllers/pageView_controller.dart';
import 'package:onestop/controllers/product_controller.dart';
// import 'cart_screen.dart';
import 'productDetails_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
// import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
} 

class _HomeScreenState extends State<HomeScreen> {
  final ProductController productController = Get.put(ProductController());
  final PageViewController pageViewController = Get.put(PageViewController());
  final NavController navController = Get.put(NavController());
  final List<String> pageImages = [
    'assets/images/shopping.webp',
    'assets/images/advjew.webp',
    'assets/images/fashion1.jpg',
  ];
  final ScrollController _scrollController = ScrollController();
    
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      if (pageViewController.showPageView.value) {
        pageViewController.togglePageView(false);
      }
    // } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
    //   if (!pageViewController.showPageView.value) {
    //     pageViewController.togglePageView(true);
    //   }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Default is 56.0
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff000428), Color(0xff004e92)],
          stops: [0, 1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
          ),
        child: AppBar(
        title:  Row(
          mainAxisSize: MainAxisSize.min, // Use min to prevent the Row from taking more space than needed
          children: <Widget>[
            //  Image.asset(
            //   'assets/images/logo.jpg',
            //   fit: BoxFit.contain,
            //   height: 32,
            // ),

            SizedBox(width: 8), // Space between logo and text
            Text(
              'OneStop',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
         iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent, 
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {
              Get.toNamed('wish');
            },
          ),
        ],
      ),
    ),
  ),
      body:SafeArea(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(() {
            return pageViewController.showPageView.value
                ? Column(
                  children: [  
                const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                  child:Center(
                      child: Text('Find Your Style',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 28,
                      ),),
                        ),),
                    ],
                  ), 
                Container( // Wrap FractionallySizedBox in a Container with a definite height
                height: MediaQuery.of(context).size.height * 0.38, 
                child: FractionallySizedBox(
                  heightFactor: 1.0,
                  child: PageView.builder( // 30% of screen height for the PageView
                      itemCount: pageImages.length,
                      itemBuilder: (context, index) {
                        return FractionallySizedBox(
                        widthFactor: 0.8,
                        child:Container(
                          // height: double.infinity,
                          // width: double.infinity,
                          margin: EdgeInsets.all(10.0), // Add some margin around each page
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0), // Add border radius
                            image: DecorationImage(
                              image: AssetImage(pageImages[index]),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        );
                      },
                    ),      
                  )
                ),],
                )
                : const SizedBox.shrink();
          }),
          Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            
            ),
      
           child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Divider(color: Colors.grey),
              const Padding(
                padding: const EdgeInsets.only(left: 8.0), // Add some padding to align the text properly
                child: Text('Categories',
                 style: TextStyle(
                      fontSize: 18, // Example size
                      fontWeight: FontWeight.bold, // Example weight
                      color: Colors.black, // Text color
                    ),),
              ),
              SizedBox(height: 3,),
               SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      categoryButton(context, 'All', 'all','assets/images/all.jpg'), const SizedBox(width:10.0,),
                      categoryButton(context, 'Men', 'men\'s clothing','assets/images/menn.jpg'),const SizedBox(width:10.0,),
                      categoryButton(context, 'Women', 'women\'s clothing','assets/images/women.jpg'),const SizedBox(width:10.0,),
                      categoryButton(context, 'Jewellery', 'jewelery','assets/images/jewellery.webp'),const SizedBox(width:10.0,),
                      categoryButton(context, 'Electronics', 'electronics','assets/images/electonics.jpg'),
                    ],
                  ),
                ),
              // Divider(color: Colors.grey)
            ],
          ),
          ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               Padding(
                padding: const EdgeInsets.only(left:20.0),
                child: Text('Featured Product',
                 style: TextStyle(
                      fontSize: 18, // Example size
                      fontWeight: FontWeight.bold, // Example weight
                      color: Colors.black, // Text color
                    ),),
              ),
              ],
             ),
               const SizedBox(height:15.0,),
                Expanded(
                child: Obx(() {
                  if (productController.isLoading.value) {
                    return const Center(
                        child: CircularProgressIndicator(
                            color: Color.fromARGB(255, 233, 1, 129)));
                  } else if (productController.productList.isEmpty) {
                    return Center(child: Text('Failed to load products'));
                  } else {
                    return Container(
                      padding: EdgeInsets.all(.0),
                    child:GridView.builder(
                      controller: _scrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: (screenWidth > 600) ? 3 : 2, // Change crossAxisCount based on screen width
                        childAspectRatio: 2 / 3,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      itemCount: productController.filteredProductList.length,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        var product = productController.filteredProductList[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => ProductDetails(product: product));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15.0),
                                          // border:Border.all(color: Colors.black),
                                              boxShadow: [
                                            BoxShadow(
                                              color: Colors.blue.withOpacity(0.05),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3), // changes position of shadow
                                            ),
                                          ],
                                  ),
                          
                            child: Card(
                              color: Colors.white,
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0), // Add padding around the image
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10.0), // Give the image rounded corners
                                        child: Image.network(
                                          product.image,
                                          height: screenHeight * 0.5,
                                          width: screenHeight * 0.5,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Padding(
                                    padding: EdgeInsets.all(screenWidth * 0.02),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.title,
                                          style: TextStyle(fontSize: screenWidth * 0.035),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "Price: ₹${product.price.toString()}",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: screenWidth * 0.04,
                                          ),
                                        ),
                                        Text(
                                          "Rating: ${product.rating.rate.toString()}",
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: screenWidth * 0.035,
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: _buildStarIcons(product.rating.rate),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ),
                        );
                      },
                    ),
                    );
                  }
                }),
              ),
        ],
      ),
      ),
                    bottomNavigationBar: Obx(() {
                      return BottomNavigationBar(
                        currentIndex: navController.selectedIndex.value,
                        onTap: (index) {
                          navController.changePage(index);
                          switch (index) {
                            case 0:
                              Get.offNamed('home');
                              break;
                            case 1:
                              Get.toNamed('cart');
                              break;
                            case 2:
                              Get.toNamed('profile');
                              break;
                          }
                        },
                        items: [
                          BottomNavigationBarItem(
                            icon: Icon(Icons.home),
                            label: 'Home',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.shopping_cart),
                            label: 'Cart',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.person),
                            label: 'Profile',
                          ),
                        ],
                      );
                    }),

    );
  }
  Widget categoryButton(BuildContext context, String title, String category,String imagePath) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
    child: Obx(() {
      return GestureDetector(
        onTap: () {
          productController.filterProducts(category);
          print(category);
        },
       child: Column(
            children: [
              Container(
                height: 90, // Adjusted height for better visibility
                width: 90, // Adjusted width for better visibility
                margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: productController.selectedCategory.value == category ?const Color.fromARGB(255, 20, 86, 128) : Colors.grey,
                    width: 2.0,
                  ),
                  color: productController.selectedCategory.value == category
                      ? Color.fromARGB(255, 255, 255, 255)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color:productController.selectedCategory.value == category? const Color.fromARGB(255, 20, 86, 128).withOpacity(0.5): Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10), // Removed symmetric padding
                child: ClipRRect( // Adding ClipRRect to prevent image overflow
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagePath,
                    height: 80, // Adjusted height of the image
                    width: 80, // Adjusted width of the image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
           

         SizedBox(height: 10), 
         Text(
                title,
                style: TextStyle(
                  fontSize:  productController.selectedCategory.value == category 
                  ? MediaQuery.of(context).size.width * 0.045
                  : MediaQuery.of(context).size.width * 0.040,
                  fontWeight: FontWeight.bold,
                  color: productController.selectedCategory.value == category
                      ?  Color.fromARGB(255, 20, 86, 128)
                      : const Color.fromARGB(255, 4, 4, 4),
                ),
              ),
          ],
        ),
      );
    }),
  );
}


  List<Widget> _buildStarIcons(double rating) {
    List<Widget> stars = [];
    int fullStars = rating.floor();
    for (int i = 0; i < fullStars; i++) {
      stars.add(Icon(
        Icons.star,
        color: Colors.amber,
        size: 16.0,
      ));
    }
    if (rating - fullStars > 0) {
      stars.add(Icon(
        Icons.star_half,
        color: Colors.amber,
        size: 16.0,
      ));
    }
    while (stars.length < 5) {
      stars.add(Icon(
        Icons.star_border,
        color: Colors.amber,
        size: 16.0,
      ));
    }
    return stars;
  }
}


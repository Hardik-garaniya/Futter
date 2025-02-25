import 'package:flutter/material.dart';

import 'main.dart';


class Task13to16 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Image Tasks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageTasksScreen(),
    );
  }
}

class ImageTasksScreen extends StatefulWidget {
  @override
  _ImageTasksScreenState createState() => _ImageTasksScreenState();
}

class _ImageTasksScreenState extends State<ImageTasksScreen> {
  String _imageUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeT6M_bRXZQhX-iY6mcznH1olScwJc2tOdeQ&s';

  List<String> imageUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdoDhWKuCjJkIZuIH5bQ6mRUVYippjtjw1cw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdoDhWKuCjJkIZuIH5bQ6mRUVYippjtjw1cw&s',

  ];


  int _carouselIndex = 0;
  final List<String> carouselImages = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdoDhWKuCjJkIZuIH5bQ6mRUVYippjtjw1cw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRMHEcXaQtkalVkXKH6f6-y_ojrjUiAutjew&s',

  ];

  @override
  void initState() {
    super.initState();
    // Start the image carousel auto slide
    Future.delayed(Duration(seconds: 3), _autoSlideCarousel);
  }

  void _autoSlideCarousel() {
    setState(() {
      _carouselIndex = (_carouselIndex + 1) % carouselImages.length;
    });
    Future.delayed(Duration(seconds: 3), _autoSlideCarousel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Task 13 To 16'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => myapp()));
          },
        ),
        backgroundColor: Colors.grey,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Image.network(_imageUrl),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _imageUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRMHEcXaQtkalVkXKH6f6-y_ojrjUiAutjew&s';
                  });
                },
                child: Text('Change Image'),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Photo Gallery (GridView):', style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      imageUrls[index],
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Image from Assets (BoxFit Examples):', style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/flower1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/flower2.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/flower3.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Image Carousel:', style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    itemCount: carouselImages.length,
                    controller: PageController(viewportFraction: 1),
                    onPageChanged: (index) {
                      setState(() {
                        _carouselIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.network(carouselImages[_carouselIndex]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

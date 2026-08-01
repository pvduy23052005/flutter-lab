import 'package:flutter/material.dart';
import 'package:flutter_lab_4/models/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> products = [
    Product(
      id: '1',
      title: 'Product 1',
      price: 100,
      description: 'product 1',
      imageUrl: 'https://picsum.photos/201',
    ),
    Product(
      id: '2',
      title: 'Đồng hồ thông minh',
      price: 1290.000,
      description: 'product 2',
      imageUrl: 'https://picsum.photos/201',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => {}, icon: Icon(Icons.menu)),
        title: const Text("Sản phẩm", style: TextStyle(color: Colors.white)),
        actions: [IconButton(onPressed: () => {}, icon: Icon(Icons.search))],
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: products.length,
          itemBuilder: (BuildContext context, index) {
            final product = products[index];
            return ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(17)),
              ),
              leading: SizedBox(
                width: 80,
                height: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(product.imageUrl, fit: BoxFit.cover),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${product.price}',
                    style: TextStyle(color: Colors.blue),
                  ),
                  Text(
                    product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              trailing: MouseRegion(
                hitTestBehavior: HitTestBehavior.opaque,
                cursor: SystemMouseCursors.click,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Icon(Icons.chevron_right),
                ),
              ),
              onTap: () {},
            );
          },
          separatorBuilder: (context, index) => const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFEEEEEE), // Màu xám nhạt tinh tế
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

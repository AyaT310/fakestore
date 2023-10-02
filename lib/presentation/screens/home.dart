import 'package:flutter/material.dart';
import 'package:untitled/controller/product_controller.dart';
import 'package:untitled/data/models/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final ProductRepo productRepo = ProductRepo();
  // late List<Products> allProducts;
  final ProductController _controller = ProductController();

  @override
  void initState() {
    super.initState();
    _controller.getData();
    // allProducts = productRepo.getProduct() as List<Products>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 201, 201, 201),
      appBar: AppBar(
        title: const Text("Products"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<Products>?>(
          future: _controller.futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width,
                      maxHeight: MediaQuery.of(context).size.height,
                    ),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: .85,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 120,
                                child: Image.network(
                                  _controller.data?[index].image ?? '',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              ListTile(
                                  title: Text(
                                    "${(_controller.data?[index].price ?? '').toString()} \$",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Column(
                                    children: [
                                      Text(
                                        _controller.data?[index].title ?? '',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      // Text(_controller.data?[index].description ?? ''),
                                    ],
                                  ))
                            ],
                          ),
                        );
                      },
                      itemCount: (_controller.data ?? []).length,
                    ),
                  ),
                ],
              );
            } else {
              return snapshot.hasError
                  ? const Text('Sorry, Something went wrong')
                  : const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

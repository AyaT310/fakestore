import 'package:untitled/data/Repository/products_repo.dart';
import 'package:untitled/data/models/product.dart';

class ProductController  {
  final ProductRepo _productRepo = ProductRepo();

  List<Products>? data = [];
  late Future<List<Products>?> futureData;

  Future<void> getData() async {
    futureData = _productRepo.getProduct();
    data = await futureData;
  }
}

import 'package:dio/dio.dart';
import 'package:untitled/constants/strings.dart';
import 'package:untitled/data/models/product.dart';

class ProductRepo {
  final dio = Dio();

  Future<List<Products>?> getProduct() async {
    List<Products>? data = [];

    try {
      Response response = await dio.get("${baseUrl}products");

      response.data.forEach(
        (e) => data.add(
          Products.fromJson(e),
        ),
      );

    } catch (e) {
      print(e);
    }

    return data;
  }
}

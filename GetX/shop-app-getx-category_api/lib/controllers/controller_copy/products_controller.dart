import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:neecoder/controllers/categories/categories_controller.dart';
import 'package:neecoder/controllers/products/products_repository.dart';

// class ProductsController extends GetxController {
//   ProductsRepository productsRepository = ProductsRepository();
//   RxBool loading = false.obs;
//   List products = [].obs;
//   var showGrid = false.obs;

//   ProductsController() {
//     loadProductsFromRepo();
//   }

//   loadProductsFromRepo(String categoryName) async {
//     loading(true);
//     products = await productsRepository.loadProductsFromApi(categoryName);
//     loading(false);
//   }

//   toggleGrid() {
//     showGrid(!showGrid.value);
//   }
// }

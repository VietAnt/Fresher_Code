import 'dart:js_util';

import 'package:get/get.dart';
import 'package:neecoder/controllers/cart/cart_repository.dart';

class CartController extends GetxController {
  CartRepository cartRepository = CartRepository();
  var cartItems = [];
  var loading = false.obs;
  var subtotal = 0.0.obs;

  CartController() {
    loadCartFromApi();
  }
  loadCartFromApi() async {
    loading(true);
    var productsList = await cartRepository.loadCartFromApi();

    for (var i = 0; i < productsList.length; i++) {
      var product =
          await cartRepository.getProductFromApi(productsList[i]["productId"]);
      subtotal(subtotal.value + product["price"] * productsList[i]["quantity"]);
      cartItems
          .add({"product": product, "quantity": productsList[i]["quantity"]});
    }
    loading(false);
  }
}

//Todo: CartController
class ControllerCart extends GetxController {
  CartRepository cartRepository = CartRepository();
  var cartItem = [].obs;
  var loading = false.obs;
  var subtotal = 0.0.obs;

  _loadCartFromApi() async {
    loading(true);
    var productList = await cartRepository
        .loadCartFromApi(); //*->ProductList: Danh sach San Pham

    for (var i = 0; i < productList.length; i++) {
      var product =
          await cartRepository.getProductFromApi(productList[i]["productId"]);

      //*Subtotal: Tinh Tien San Pham
      subtotal(subtotal.value + product["price"] * productList[i]["quantity"]);
      //*CartItem: Danh sach gio hang
      cartItem
          .add({"product": product, "quantity": productList[i]["quantity"]});
    }
    loading(false);
  }
}

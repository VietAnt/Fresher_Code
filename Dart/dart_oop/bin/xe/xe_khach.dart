import 'xe.dart';

class XeKhach extends Xe {
  XeKhach() : super(brand: "CongTy10", productYear: 1978);

  @override
  chuyenCho() {
    print("Xe này chở người");
  }
}

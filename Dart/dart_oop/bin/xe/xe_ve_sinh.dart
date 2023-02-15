import 'xe.dart';

class XeVeSinh extends Xe {
  XeVeSinh({String? xeVeSinhBrand, int? xeVeSinhYear})
      : super(brand: xeVeSinhBrand, productYear: xeVeSinhYear);

  @override
  chuyenCho() {
    print("Xe này chở rác");
  }
}

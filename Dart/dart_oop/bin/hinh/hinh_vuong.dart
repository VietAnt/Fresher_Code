// ignore_for_file: prefer_interpolation_to_compose_strings

import 'hinh_chu_nhat.dart';

class HinhVuong extends HinhChuNhat {
  HinhVuong({required double canh}) : super(chieuDai: canh, chieuRong: canh);

  @override
  void getInfor() {
    print("Cạnh: " +
        super.chieuDai.toString() +
        "\n" +
        "Chu vi: " +
        super.tinhChuVi().toString() +
        "\n" +
        "Diện tích: " +
        super.tinhDienTich().toString() +
        "\n");
  }
}

import 'package:teknopark_pdks/model/home/anno_data_model.dart';

class AnnoResponseModel {
  bool? status;
  List<Anno>? data; // List<Anno> olarak güncellendi
  String? message;

  AnnoResponseModel({this.status, this.data, this.message});

  AnnoResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Anno>[]; // Liste oluşturuluyor
      json['data'].forEach((v) {
        data!.add(new Anno.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this
          .data!
          .map((anno) => anno.toJson())
          .toList(); // Liste dönüşümü yapıldı
    }
    data['message'] = this.message;
    return data;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? id;
  String? uid;
  String? barcode;
  String? name;
  int? qtd;
  int? price;
  String? desc;

  ProductModel(
      {this.id, this.uid, this.barcode, this.name, this.qtd, this.price, this.desc});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    barcode = json['barcode'];
    name = json['name'];
    qtd = json['qtd'];
    price = json['price'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['barcode'] = barcode;
    data['name'] = name;
    data['qtd'] = qtd;
    data['price'] = price;
    data['desc'] = desc;
    return data;
  }
  
  factory
  ProductModel.fromSnapshot(QueryDocumentSnapshot<Object?> snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return ProductModel(
      id: snapshot.id,
      name: snapshot
    );
  }
}

import 'package:equatable/equatable.dart';

class CouponModel extends Equatable{
  final String title;
  final String storeUrl;
  final String imageUrl;
  final String storeName;
  final String code;
  final String id;

  const CouponModel( {
    required this.title,
    required this.storeUrl,
    required this.imageUrl,
    required this.storeName,
    required this.code,
    required this.id,
  });

  factory CouponModel.fromJson(Map<String,dynamic>json){
    return CouponModel(
      title: json['title'],
      storeUrl: json['store_url'],
      imageUrl: json['image_url'],
      storeName: json['store_name'],
      code: json['code'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'store_url': storeUrl,
    'image_url': imageUrl,
    'store_name': storeName,
    'code': code,
    'id': id,
  };

  @override
  // TODO: implement props
  List<Object?> get props => [
    title,
    storeUrl,
    imageUrl,
    storeName,
    code,
    id,
  ];


}

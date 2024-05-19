class OfferModel {
  final String imageUrl;
  final String storeUrl;
  final String storeName;
  final String id;

  const OfferModel({
    required this.imageUrl,
    required this.storeUrl,
    required this.storeName,
    required this.id,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      imageUrl: json['image_url'],
      storeUrl: json['store_url'],
      storeName: json['store_name'],
      id: json['id'],
    );
  }

  Map<String,dynamic> toJson()=>{
    'image_url':imageUrl,
    'store_url':storeUrl,
    'store_name':storeName,
    'id':id,
  };

}

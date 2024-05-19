class StoreModel {
  final String storeName;
  final String imageUrl;
  final String id;

  const StoreModel({
    required this.storeName,
    required this.imageUrl,
    required this.id,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      storeName: json['store_name'],
      imageUrl: json['image_url'],
      id: json['id'],
    );
  }

  Map<String,dynamic> toJson()=>{
    'store_name':storeName,
    'image_url':imageUrl,
    'id':id,
  };

}

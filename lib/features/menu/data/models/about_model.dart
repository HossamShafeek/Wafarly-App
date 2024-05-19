class AboutModel {
  final String chatLink;
  final String appLink;

  AboutModel({required this.chatLink, required this.appLink});

  factory AboutModel.fromJson(Map<String, dynamic> json) => AboutModel(
        chatLink: json['chat_link'],
        appLink: json['app_link'],
      );

  Map<String,dynamic> toJson()=>{
    'chat_link':chatLink,
    'app_link':appLink,
  };

}

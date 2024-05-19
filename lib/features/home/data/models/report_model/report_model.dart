class ReportModel {
  final String firstName;
  final String lastName;
  final String userId;
  final String couponId;
  final String reportContent;
  final String email;

  const ReportModel({
    required this.firstName,
    required this.lastName,
    required this.userId,
    required this.reportContent,
    required this.couponId,
    required this.email,
  });

  factory ReportModel.fromJson(Map<String,dynamic>json){
    return ReportModel(
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      couponId: json['coupon_id'],
      userId: json['user_id'],
      reportContent: json['report_content'],
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'email':email,
      'first_name':firstName,
      'last_name':lastName,
      'coupon_id':couponId,
      'user_id':userId,
      'report_content':reportContent,
    };
  }

}

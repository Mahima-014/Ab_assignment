class FeedbackModel {
String id;
String name;
String email;
String feedback;

FeedbackModel({this.id, this.name, this.email, this.feedback});

FeedbackModel.fromJson(Map<String, dynamic> json) {
id = json['id'];
name = json['name'];
email = json['email'];
feedback = json['feedback'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['name'] = this.name;
data['email'] = this.email;
data['feedback'] = this.feedback;
return data;
}
}
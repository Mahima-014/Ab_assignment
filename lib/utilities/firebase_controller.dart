import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseController{
  CollectionReference feedbacks = FirebaseFirestore.instance.collection('feedbacks');
  saveDataInFirebase(feedback)
  {
    feedbacks.add({"name":feedback.name, "email" : feedback.email, "feedback" : feedback.feedback});
  }
}
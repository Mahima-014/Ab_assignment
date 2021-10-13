import 'package:abhibus_assignment/model/feedback_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseController{
  static FirebaseController firebaseController;
  FirebaseController._();
  static getInstance()
  {
    if(firebaseController == null)
      {
        firebaseController = FirebaseController._();
      }
    return firebaseController;
  }
  CollectionReference feedbacks = FirebaseFirestore.instance.collection('feedbacks');
  saveFeedbacksInFirebase(FeedbackModel feedback)
  {
    feedbacks.add({"name":feedback.name, "email" : feedback.email, "feedback" : feedback.feedback});
  }
}
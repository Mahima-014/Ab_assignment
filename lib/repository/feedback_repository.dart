import 'package:abhibus_assignment/utilities/firebase_controller.dart';

class FeedbackRepository{
  FirebaseController firebaseController = FirebaseController();
  saveFeedbacks(feedback)
  {
    firebaseController.saveDataInFirebase(feedback);
  }
}
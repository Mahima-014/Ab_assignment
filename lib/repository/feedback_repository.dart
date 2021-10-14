import 'package:abhibus_assignment/model/feedback_model.dart';
import 'package:abhibus_assignment/utilities/api_controller.dart';
import 'package:abhibus_assignment/utilities/database_controller.dart';
import 'package:abhibus_assignment/utilities/firebase_controller.dart';
import 'package:abhibus_assignment/utilities/urls.dart';

class FeedbackRepository{
  FirebaseController firebaseController = FirebaseController.getInstance();
  ApiController apiController = ApiController.getInstance();


  saveFeedbacks(FeedbackModel feedback)
  {
    firebaseController.saveFeedbacksInFirebase(feedback);
  }
  
  Future<List<FeedbackModel>> getFeedbackDataFromApi() async {
    dynamic response = await apiController.getResponse(Urls.GET_FEEDBACK_URL);
    List<FeedbackModel> feedbackList = [];
    response.forEach((element){
      feedbackList.add(FeedbackModel.fromJson(element));
    });
    return feedbackList;
  }

  saveFeedbacksToDatabase(List<FeedbackModel> feedbackList )
  {
    feedbackList.forEach((element) {
      DatabaseController.getInstance().insert('feedbacks', element.toJson());
    });
  }

  updateDatabase() async
  {
      List<FeedbackModel> list = await getFeedbackDataFromApi();
      saveFeedbacksToDatabase(list);

  }

}
import 'package:abhibus_assignment/model/feedback_model.dart';
import 'package:abhibus_assignment/utilities/api_controller.dart';
import 'package:abhibus_assignment/utilities/database_controller.dart';
import 'package:abhibus_assignment/utilities/firebase_controller.dart';
import 'package:abhibus_assignment/utilities/urls.dart';

class UserFeedbacksRepository{

  FirebaseController firebaseController = FirebaseController.getInstance();
  ApiController apiController = ApiController.getInstance();

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

  Future<List<FeedbackModel>> getFeedbackDataFromDatabase() async{
    List<Map<dynamic, dynamic>> list = await DatabaseController.getInstance().getRecords();
    List<FeedbackModel> feedbackList = [];
    list.forEach((element) {
      feedbackList.add(FeedbackModel.fromJson(element));
    });
    return feedbackList;
  }

  Future<List<FeedbackModel>> getFeedbacks() async{
    List<FeedbackModel> feedbackList = await getFeedbackDataFromApi();
    saveFeedbacksToDatabase(feedbackList);
    feedbackList = await getFeedbackDataFromDatabase();
    return feedbackList;
  }
}
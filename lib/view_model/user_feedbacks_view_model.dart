import 'package:abhibus_assignment/model/feedback_model.dart';
import 'package:abhibus_assignment/repository/user_feedbacks_repository.dart';

class UserFeedbacksViewModel{

  Future<List<FeedbackModel>> getFeedbackList() async
  {
    UserFeedbacksRepository userfeedbacksRepository = UserFeedbacksRepository();
    List<FeedbackModel> feedbackData = await userfeedbacksRepository.getFeedbacks();
    return feedbackData;
  }
}
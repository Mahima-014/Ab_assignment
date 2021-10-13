import 'package:abhibus_assignment/model/feedback_model.dart';
import 'package:abhibus_assignment/repository/feedback_repository.dart';

class FeedbackViewModel{
  FeedbackRepository feedbackRepository = FeedbackRepository();
  sumbmitFeedback(FeedbackModel feedback)
  {
    feedbackRepository.saveFeedbacks(feedback);
  }
}
import 'package:abhibus_assignment/model/feedback_model.dart';
import 'package:abhibus_assignment/repository/feedback_repository.dart';
import 'package:flutter/cupertino.dart';

class FeedbackViewModel{
  FeedbackRepository feedbackRepository = FeedbackRepository();
  saveFeedback(FeedbackModel feedback)
  {
    feedbackRepository.saveFeedbacks(feedback);
  }


  updateFeedbacksinDatabase()
  {
    feedbackRepository.updateDatabase();
  }
}
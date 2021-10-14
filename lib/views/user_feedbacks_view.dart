import 'package:abhibus_assignment/model/feedback_model.dart';
import 'package:abhibus_assignment/view_model/user_feedbacks_view_model.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class UserFeedbacksView extends StatefulWidget {
  @override
  _UserFeedbacksViewState createState() => _UserFeedbacksViewState();
}

class _UserFeedbacksViewState extends State<UserFeedbacksView> {

  UserFeedbacksViewModel userFeedbacksViewModel = UserFeedbacksViewModel();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        body: FutureBuilder <List<FeedbackModel>>(
          builder: (context, snapshot) {
            if (snapshot.hasData == false) {
              //print('project snapshot data is: ${projectSnap.data}');
              return Center(
                child: Container(
                  child:CircularProgressIndicator(),
                ),
              );
            }
            return ListView.builder(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context,int index){
                  return Card(
                    child: Column(
                      children: [
                        _buildText('Name' , snapshot.data[index].name),
                        SizedBox(width: 5,),
                        _buildText('Email',snapshot.data[index].email ),
                        SizedBox(width: 5),
                        _buildText('Feedbacks',snapshot.data[index].feedback),
                      ],
                    ),
                  );
                }
            );
          },
          future: userFeedbacksViewModel.getFeedbackList(),
        )
      ),
    );
  }

  Widget _buildText(String title, String value )
  {
    return Text(
      "${title} : ${value}",
      style : TextStyle(
        fontSize: 15,
      ),
    );
  }
}

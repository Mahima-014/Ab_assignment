import 'package:abhibus_assignment/model/feedback_model.dart';
import 'package:abhibus_assignment/view_model/feedback_view_model.dart';
import 'package:flutter/material.dart';


class FeedbackView extends StatefulWidget {
  @override
  _FeedbackViewState createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FeedbackViewModel feedbackViewModel = FeedbackViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  buildTextField('First Name', nameController),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/23,
                  ),
                  buildEmailTextField('Email', emailController),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/23,
                  ),
                  buildFeedbackTextField('Your Feedback', feedbackController),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/23,
                  ),
                  buildSubmitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  Widget buildTextField(String name, TextEditingController controller) {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: controller,
      validator: (value) {
        if (value.isEmpty) return "$name can't be empty";
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter $name",
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget buildEmailTextField(String email, TextEditingController controller) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      validator: (value) {
        if (value.isEmpty) return "$email address can't be empty";
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter $email",
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget buildFeedbackTextField(String feedback, TextEditingController controller) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      maxLines: 4,
      validator: (value) {
        if (value.isEmpty)
          return "$feedback can't be empty";
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter $feedback",
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
    );
  }


  Widget buildSubmitButton() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25.0),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              feedbackViewModel.sumbmitFeedback(FeedbackModel(name: nameController.text, email:emailController.text, feedback:feedbackController.text));
              
            }
          },
          style: ElevatedButton.styleFrom(
              padding:
              EdgeInsets.only(top: 12, left: 30, right: 30, bottom: 12),
              primary: Colors.black,
              elevation: 5.0),
          child: Text(
            'SUBMIT',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}

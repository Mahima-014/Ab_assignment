import 'dart:convert';
import 'package:abhibus_assignment/utilities/urls.dart';
import 'package:http/http.dart' as http;

class ApiController{
  static ApiController apiController;
  ApiController._();
  static ApiController getInstance()
  {
    if(apiController==null)
      {
        apiController = ApiController._();
      }
    return apiController;
  }


  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(Urls.BASE_URL + url));
      responseJson = json.decode(response.body);
      print("Body = $responseJson");

    } catch (error) {
      print("error = $error");

    }
    return responseJson;
  }
}
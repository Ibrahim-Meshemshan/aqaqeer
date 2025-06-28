import 'package:intl/intl.dart';

DateTime convertStringToDate({required String dateString}){
  ///to convert the date from string to date time
  ///first step:get the date as string type
  ///second step :as we know that the method parse takes a specific formatted
  ///one of them that the date should be like this y-m-d but the date that i have start with another format
  ///second convert every / to -
  ///so we should put the date as a date format that i want
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');
  DateTime dateTimeNews = dateFormat.parse(dateString.replaceAll('/', '-'));
  return dateTimeNews;
}
import 'package:evently/constants/app_images.dart';
import 'package:evently/screens/main_layout_screen/tabs/home/home.dart';

class Event {
  String title;
  String descreption;
  String imgPath;
  DateTime dateTime;
  String eventType;
  bool isFavorite;
  Event({
    required this.title,
    required this.descreption,
    required this.imgPath,
    required this.dateTime,
    required this.eventType,
    this.isFavorite = false,
  });
  static List<Event> events = [
    Event(
      title: "football",
      descreption: "playing football",
      imgPath: AppImages.sportLight,
      dateTime: DateTime(2020, 6, 30),
      eventType: "Sport",
      // isFavorite: true,
    ),

    Event(
      title: "football",
      descreption: "playing football",
      imgPath: AppImages.sportLight,
      dateTime: DateTime(2020, 2, 3),
      eventType: "Sport",
    ),

    Event(
      title: "football",
      descreption: "playing football",
      imgPath: AppImages.sportLight,
      dateTime: DateTime(2020, 2, 3),
      eventType: "Sport",
    ),

    Event(
      title: "football",
      descreption: "playing football",
      imgPath: AppImages.sportLight,
      dateTime: DateTime(2020, 2, 3),
      eventType: "Sport",
    ),

    Event(
      title: "football",
      descreption: "playing football",
      imgPath: AppImages.sportLight,
      dateTime: DateTime(2020, 2, 3),
      eventType: "Sport",
    ),

    Event(
      title: "football",
      descreption: "playing football",
      imgPath: AppImages.sportLight,
      dateTime: DateTime(2020, 2, 3),
      eventType: "Sport",
    ),
  ];
}

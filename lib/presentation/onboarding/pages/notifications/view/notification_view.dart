import 'package:flutter/material.dart';
import 'package:hackathon_project/presentation/onboarding/pages/notifications/view/widgets/notification_widget.dart';
import 'package:hackathon_project/presentation/resources/strings_manager.dart';
import 'package:hackathon_project/presentation/resources/values_manager.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(AppPadding.p18),
            child: Text(AppStrings.notification,
                style: Theme.of(context).textTheme.headlineLarge),
          ),
          NotificationWidget(),
          NotificationWidget(),
          NotificationWidget(),
          NotificationWidget(),
          NotificationWidget(),
          NotificationWidget(),
          NotificationWidget(),
          NotificationWidget(),
          NotificationWidget(),
          NotificationWidget(),
          NotificationWidget(),
          NotificationWidget(),
          NotificationWidget(),
          NotificationWidget(),
          NotificationWidget(),
          NotificationWidget(),
          NotificationWidget(),
        ],
      ),
    );
  }
}

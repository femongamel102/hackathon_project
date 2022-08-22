import 'package:flutter/material.dart';
import 'package:hackathon_project/presentation/resources/assets_manager.dart';
import 'package:hackathon_project/presentation/resources/color_manager.dart';
import 'package:hackathon_project/presentation/resources/values_manager.dart';
import 'package:hackathon_project/presentation/widgets/custom_network_image.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20, vertical: AppPadding.p16),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: AppSize.s1_5, color: ColorManager.divider))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: AppRadius.r20,
            child: CustomNetworkImage(
              placeholder: ImageAssets.placeHolderNotification,
              url: '',
            ),
          ),
          const SizedBox(
            width: AppSize.s10,
          ),
          Container(
            width: width * .75,
            padding: const EdgeInsets.only(top: AppPadding.p5),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Joy Arnold left 6 comments on Your Post Joy Arnold left 6 comments on Your Post',
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  'Yesterday at 11:42 PM',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

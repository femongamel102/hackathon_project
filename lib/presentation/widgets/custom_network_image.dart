import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? url;
  final String placeholder;
  const CustomNetworkImage(
      {Key? key, required this.url, required this.placeholder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: url!.isNotEmpty
            ? FadeInImage.assetNetwork(
                width: double.infinity,
                height: double.infinity,
                placeholder: 'assets/images/loading.gif',
                image: url!,
                fit: BoxFit.cover,
              )
            : Image.asset(
                placeholder,
                fit: BoxFit.fill,
              ));
  }
}

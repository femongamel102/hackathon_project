import 'package:flutter/material.dart';
//onboarding models

class PageViewWidgets {
  Widget widget;
  int numberOfPages;
  int currentIndex;
  PageViewWidgets(this.widget, this.numberOfPages, this.currentIndex);
}

class User{
  String id;
  String firstName;
  String lastName;
  String email;
  String imageUrl;
  User(this.id,this.firstName,this.lastName,this.email,this.imageUrl);
}

class Authentication{
  User? user;
  String? accessToken;
  String? refreshToken;
  Authentication(this.user,this.accessToken,this.refreshToken);
}

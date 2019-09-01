import 'package:flutter_web/material.dart';
import 'dart:async';

class TimeAgo {
  final String postDate,postTime;

  TimeAgo(this.postDate,this.postTime);
   int getYear(){
     int Year = int.parse(this.postDate.substring(0,4));
    return Year;
  }
  int getMonth(){
     int Month=int.parse(postDate.substring(5,7));
    return Month;
  }
  int getDay(){
     int Day=int.parse(postDate.substring(8,10));
    return Day;
  }
  int getHr(){
     int Hr=int.parse(postTime.substring(0,2));
    return Hr;
  }
  int getMin(){
     int Min=int.parse(postTime.substring(3,5));
    return Min;
  }
  String getTimeAgo(){
    var timeAgo;
    final Date = DateTime(this.getYear(),this.getMonth(),this.getDay(),this.getHr(),this.getMin());
    final currTime = DateTime.now();
    var difference = currTime.difference(Date).inMinutes;
  if(difference==0){
    timeAgo="Just now";
    return timeAgo;
  }else {
    if(difference==1){
       timeAgo="$difference min ago";
    }else{
       timeAgo="$difference mins ago";
    }
    if(difference>=59){
      difference = currTime.difference(Date).inHours;
      if(difference==1){
        timeAgo="$difference Hour ago";
      }else {
        timeAgo="$difference Hours ago";
      }
    }
    if(currTime.difference(Date).inHours>=24){
      difference = currTime.difference(Date).inDays;
      if(difference==1){
        timeAgo="$difference Day ago";
      }else {
        timeAgo="$difference Days ago";
      }
    }
    if(currTime.difference(Date).inDays>=29){
      difference = currTime.difference(Date).inDays;
       int Months=difference ~/30;
      if(Months==1){
        timeAgo="$Months Month ago";
      }else {
        timeAgo="$Months Months ago";
      }
    }
    if(currTime.difference(Date).inDays>=356){
      difference = currTime.difference(Date).inDays;
       int Years=difference ~/356;
      if(Years==1){
        timeAgo="About $Years year ago";
      }else {
        timeAgo="About $Years years ago";
      }
    }
  }
    return timeAgo;
 }
}

void main() {
  TimeAgo ta = TimeAgo("2019-09-01","22:00");
  print(ta.getTimeAgo());
}

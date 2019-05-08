import 'dart:js';

import 'package:demo/src/model/day.dart';

class Month {
  // Constructor
  Month(this.year,this.month);


  int month;
  int year;

  /*
  Iterable weekOfMonth(int n) sync* {
    final int currentMonthLength = DateTime.utc(year, month + 1, 0).day;
    final int prevMonthLength = DateTime.utc(year, month , 0).day;
    final int firstWeekDayOfMonth = DateTime.utc(year, month, 1).weekday;
    final int weekOffSet = prevMonthLength - firstWeekDayOfMonth + 1;

    int k = n * 7 - firstWeekDayOfMonth + 1;
    int count = 0;
    if (n == 0) {
      k = weekOffSet;
    }
    while (count < 7) {
      count++;
      k++;
      if (k > prevMonthLength && n == 0) {
        k = 1;
      }
      if (k > currentMonthLength && n != 0) {
        k = k-currentMonthLength;
      }
      yield k;
    }
  }
  */

  Iterable weekOfMonth(int week) sync* {
    final int firstWeekDayOfMonth = DateTime.utc(year, month, 1).weekday;
    final int weekOffSet = -firstWeekDayOfMonth+2;
    print(firstWeekDayOfMonth);

    int k = weekOffSet + 7 * week;
    int count = 0;
    // 6 * 7 Tage
    while (count < 7) {
      // adds a day on top now again from top
      DateTime time = DateTime.utc(year, month , k);
      count++;
      k++;
      yield Day(count,time.year,time.month,time.day);
    }
  }
  /* gewünschter output entspricht:

    final days = <Day>[
    Day(1, "2019", "11", "2"),
    Day(2, "2019", "11", "3"),
    Day(3, "2019", "11", "4"),
    Day(4, "2019", "11", "5"),
    Day(5, "2019", "11", "6"),
  ];



   */


  @override
  String toString(){
    switch(month){
      case 1: return "January";
      case 2: return "February";
      case 3: return "March";
      case 4: return "April";
      case 5: return "May";
      case 6: return "June";
      case 7: return "July";
      case 8: return "August";
      case 9: return "September";
      case 10: return "October";
      case 11: return "November";
      case 12: return "December";
      default: return month.toString();
    }
  }

  void previus(){
    if(month -1 > 0) {
      month = month - 1;
    }else {
      month = 12;
      year = year - 1;
    }
  }
  void next(){
    if(month +1 < 13){
      month = month +1;
    }
    else{
      year = year +1;
      month =1;
    }
  }
  List<int> nextM(){
    int yearOut = year;
    int monthOut;
    if(month + 1 <= 12) {
      monthOut = month + 1;
    }else {
      monthOut = 1;
      yearOut = year + 1;
    }
    return [yearOut,monthOut];

  }
  List<int> prevM(){
    int yearOut = year;
    int monthOut;
    if(month -1 > 0) {
      monthOut = month - 1;
    }else {
      month = 12;
      yearOut = year - 1;
    }
    return [yearOut,monthOut];
  }
  final List<String> week = [
    "Montag",
    "Dienstag",
    "Mittwoch",
    "Donnerstag",
    "Freitag",
    "Samstag",
    "Sonntag"
  ];
}
class MyTimeline {
  final String TIMELINE_JSON =
      '[{"month" : "March" , "year" : "2023" , "details" : "Present"},{"month" : "August" ,"year":"2021","details":"Backend Developer , NewNN CO.,LTD"},{"month" : "October" ,"year":"2018","details":"Game Developer (intern) , NewNN CO.,LTD"},{"month" : "August" ,"year":"2017","details":"Computer Engineering , Khonkaen University"},{"month" : "March" ,"year":"2015","details":"Graduation from Khonkean Wittayayon"},{"month" : " " ,"year":"2010-2014","details":"Computer Olmypic ( POSN ) KKU"}]';
}

class Timelineitem {
  final String month;
  final String year;
  final String details;
  final bool ispresent = false;

  Timelineitem(this.month, this.year, this.details);

  Timelineitem.fromJson(Map<String, dynamic> json)
      : month = json['month'],
        year = json['year'],
        details = json['details'];

  Map<String, dynamic> toJson() =>
      {'name': month, 'year': year, 'details': details};
}

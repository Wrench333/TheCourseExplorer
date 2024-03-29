class Course {
  String courseDepartment;
  String courseYear;
  String courseCode;
  String courseName;

  Course({
    required this.courseDepartment,
    required this.courseYear,
    required this.courseCode,
    required this.courseName,
  });

  factory Course.fromJson(Map<String, dynamic> json,int i) {
    return Course(
      courseDepartment:json['courses'][i]['department'] ,
      courseYear: json['courses'][i]['year'],
      courseCode: json['courses'][i]['courseCode'],
      courseName: json['courses'][i]['courseName'],
    );
  }
}

/*{"courses":[
  {"department":"CS","year":"1st","courseCode":"CS F111","courseName":"CP"},
{"department":"CS","year":"2nd","courseCode":"CS F211","courseName":"DSA"},
{"department":"CS","year":"2ndt","courseCode":"CS F212","courseName":"DBS"},
{"department":"CS","year":"2nd","courseCode":"CS F213","courseName":"LICS"},
{"department":"CS","year":"3rd","courseCode":"CS F303","courseName":"Comp. Networks"},
{"department":"CS","year":"3rd","courseCode":"CS F342","courseName":"Comp. Arch."},
{"department":"CS","year":"4th","courseCode":"CS F411","courseName":"Practice School -1"},
{"department":"Elec.","year":"1st","courseCode":"EEE F111","courseName":"ES"},
{"department":"Elec.","year":"2nd","courseCode":"EEE F241","courseName":"MUP"},
{"department":"Elec.","year":"2nd","courseCode":"EEE F242","courseName":"Control Systems"},
{"department":"Elec.","year":"2nd","courseCode":"EEE F243","courseName":"SAS"},
{"department":"Elec.","year":"3rd","courseCode":"EEE F312","courseName":"Power Systems"},
{"department":"Elec.","year":"3rd","courseCode":"EEE F313","courseName":"ADVD"},
{"department":"Elec.","year":"4th","courseCode":"EEE F411","courseName":"Practice School -1"},
{"department":"Mech.","year":"1st","courseCode":"ME F112","courseName":"Workshop Practice"},
{"department":"Mech.","year":"2nd","courseCode":"ME F218","courseName":"Advanced Mech."},
{"department":"Mech.","year":"2nd","courseCode":"ME F219","courseName":"Manu. Process"},
{"department":"Mech.","year":"2nd","courseCode":"ME F220","courseName":"Heat Transfer"},
{"department":"Mech.","year":"3rd","courseCode":"ME F318","courseName":"Comp. aided Design"},
{"department":"Mech.","year":"3rd","courseCode":"ME F319","courseName":"Vibrations and Control"},
{"department":"Mech.","year":"4th","courseCode":"ME F411","courseName":"Practice School -1"}]
}*/

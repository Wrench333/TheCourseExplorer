import 'package:flutter/material.dart';
import 'package:the_course_explorer/models.dart';
import 'package:the_course_explorer/course_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Course Explorer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String query = '';
  Course? course;
  CourseAPI courseAPI = CourseAPI();
  final controller = TextEditingController();
  List<String>? suggestions = [];

  @override
  void initState() {
    super.initState();
    _fetchCourses();
    suggestions = course?.courseName;
  }

  Future<void> _fetchCourses() async {
    try {
      var result = await courseAPI.getCourses();
      print('Course List API Response: $result');
      setState(() {
        course = result;
      });
    } catch (e) {
      print('Error in getting course list: $e');
    }
  }

  void onQueryChanged(String query) {
    setState(() {
      suggestions = course?.courseName.where((courseName) {
        final lowerCaseCourseName = courseName.toLowerCase();
        final lowerCaseQuery = query.toLowerCase();
        return lowerCaseCourseName.contains(lowerCaseQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 31, 63, 1),
        body: Stack(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 46.5,
                        width: 59,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          //Color.fromRGBO(25, 25, 112, 1.0),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(91.5),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              offset: Offset(0, 4),
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 119,
                        width: 149,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          //Color.fromRGBO(25, 25, 112, 1.0),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(91.5),
                            bottomRight: Radius.circular(91.5),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              offset: Offset(0, 4),
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 65.5,
                        width: 28,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          //Color.fromRGBO(25, 25, 112, 1.0),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(91.5),
                            bottomLeft: Radius.circular(91.5),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              offset: Offset(0, 4),
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 148,
                        width: 114,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          //Color.fromRGBO(25, 25, 112, 1.0),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(91.5),
                            bottomLeft: Radius.circular(91.5),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              offset: Offset(0, 4),
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 31, 63, 1),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(25, 25, 112, 1),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.fromLTRB(0, 5.0, 10.0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu_rounded,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'The Course Explorer',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 0.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(13.0, 14.0, 19.0, 8.0),
                  child: Container(
                    height: size.height / 16, //TODO: Fix this dynamic shit
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.72),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 15.92,
                          spreadRadius: 0.96,
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: controller,
                      onChanged: onQueryChanged,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(65, 105, 225, 1),
                        isDense: true,
                        hintText: 'Search ...',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(13.0, 3.0, 19.0, 9.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: size.height / 23,
                          //TODO: Fix this dynamic shit
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(65, 105, 225, 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(7.72),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                blurRadius: 15.92,
                                spreadRadius: 0.96,
                              ),
                            ],
                          ),
                          child: Center(
                            child: DropdownButton<String>(
                              underline: const SizedBox(
                                height: 0,
                              ),
                              isDense: true,
                              dropdownColor:
                                  const Color.fromRGBO(65, 105, 225, 1),
                              hint: const Text(
                                " Select Branch",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              onChanged: (value) {},
                              items: course?.courseDepartment.map((courseDepartment) {
                                return DropdownMenuItem<String>(
                                  value: courseDepartment,
                                  child: Text(
                                    courseDepartment,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 21.0,
                      ),
                      Expanded(
                        child: Container(
                          height: size.height / 23,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(65, 105, 225, 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(7.72),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                blurRadius: 15.92,
                                spreadRadius: 0.96,
                              ),
                            ],
                          ),
                          child: Center(
                            child: DropdownButton<String>(
                              underline: const SizedBox(
                                height: 0,
                              ),
                              isDense: true,
                              dropdownColor:
                                  const Color.fromRGBO(65, 105, 225, 1),
                              hint: const Text(
                                " Select Year",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              onChanged: (value) {},
                              items: course?.courseYear.map((courseYear) {
                                return DropdownMenuItem<String>(
                                  value: courseYear,
                                  child: Text(
                                    courseYear,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.fromLTRB(13.0, 0.0, 13.0, 0.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: suggestions?.length ?? 0,
                      //TODO: Make this dynamic
                      itemBuilder: (context, index) {
                        if (suggestions!.contains(course?.courseName[index] ?? false)) {
                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(8.0),
                                height: 105,
                                padding:
                                    const EdgeInsets.fromLTRB(23, 18, 8, 18),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(52, 152, 219, 0.8),
                                  borderRadius: BorderRadius.circular(17.36),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${course?.courseName[index]}',
                                      style: const TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Course Code: ${course?.courseCode[index]}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          '${course?.courseYear[index]} Year',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          width: 12.0,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${course?.courseDepartment[index]} Department',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                            ],
                          );
                        } else {
                          return SizedBox(height: 0.0,);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pymetrics/companyName.dart';
import 'package:pymetrics/fadeRoute.dart';
import 'package:pymetrics/result.dart';
import 'package:pymetrics/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          home: ExampleDragAndDrop(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class ExampleDragAndDrop extends StatefulWidget {
  const ExampleDragAndDrop({super.key});

  @override
  State<ExampleDragAndDrop> createState() => _ExampleDragAndDropState();
}

class _ExampleDragAndDropState extends State<ExampleDragAndDrop> {
  final GlobalKey _draggableKey = GlobalKey();
  bool valWidgetDisappear = false;
  int i = 0;
  bool load = false;
  double heightMuilti = 0.0;
  double widthMuilti = 0.0;

  @override
  void initState() {
    super.initState();
    setState(() {
      w = defaultWidth /
          MediaQueryData.fromView(WidgetsBinding.instance.window).size.width;
      h = defaultHeight /
          MediaQueryData.fromView(WidgetsBinding.instance.window).size.height;
    });
    // while (w == null) {
    //   setState(() {
    //     load = true;
    //   });
    // }
    // setState(() {
    //   load = false;
    // });
  }

  void _itemDroppedOnCustomerCart(int indexToBeSelected, String index) {
    setState(() {
      updateCompanyStatus(companyList[indexToBeSelected].cName, true, index);
    });
  }

  List<CompanyName> companyList = <CompanyName>[
    CompanyName("Adfly", 0, false, ""),
    CompanyName("Adobe", 1, false, ""),
    CompanyName("Airbnb", 2, false, ""),
    CompanyName("Aliexpress", 3, false, ""),
    CompanyName("Amazon", 4, false, ""),
    CompanyName("Battle", 5, false, ""),
    CompanyName("Dropbox", 6, false, ""),
    CompanyName("Ebay", 7, false, ""),
    CompanyName("Expedia", 8, false, ""),
    CompanyName("Flipkart", 9, false, ""),
    CompanyName("Giphy", 10, false, ""),
    CompanyName("Github", 11, false, ""),
    CompanyName("Godaddy", 12, false, ""),
    CompanyName("Morgan Stanley", 13, false, ""),
    CompanyName("Netflix", 14, false, ""),
    CompanyName("Paypal", 15, false, ""),
    CompanyName("Salesforce", 16, false, ""),
    CompanyName("Stackoverflow", 17, false, ""),
    CompanyName("Steam", 18, false, ""),
    CompanyName("Tripadvisor", 19, false, ""),
    CompanyName("Twitch", 20, false, ""),
    CompanyName("Twitter", 21, false, ""),
    CompanyName("UPS", 22, false, ""),
    CompanyName("Wordpress", 23, false, ""),
    CompanyName("Yahoo", 24, false, ""),
    CompanyName("Yelp", 25, false, ""),
    CompanyName("COVID", 26, false, ""),
  ];

  void updateCompanyStatus(
      String companyName, bool newStatus, String selectedBox) {
    int index =
        companyList.indexWhere((company) => company.cName == companyName);
    if (index != -1) {
      companyList[index].answered = newStatus;
      companyList[index].value = selectedBox;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      // appBar: _buildAppBar(),
      body: _buildContent(companyList[i].cName, i),
    );
  }

  Widget _buildContent(String companyName, index) {
    debugPrint("$h");
    debugPrint("$w");
    return Stack(
      children: [
        SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.0 * h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0 * w),
                    child: Container(
                      width: 110.0 * w,
                      padding: EdgeInsets.symmetric(vertical: 0.0 * h),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (i > 0) {
                              i--;
                              companyList[i].answered = false;
                            }
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.undo,
                              color: Colors.black,
                              size: 30.0 * h,
                            ),
                            SizedBox(
                              width: 5.0 * w,
                            ),
                            Text(
                              'Undo',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0 * h,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0 * h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0 * w, right: 20.0 * w),
                    child: Container(
                      width: MediaQuery.of(context).size.width * h * w,
                      // height: 211.0 * h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.0 * w,
                          color: Colors.black,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: const Color(0xFFF3F3F3),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 22.0 * h, horizontal: 22 * w),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "How Familiar how are you with the website shown in the center box?",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 21.0 * h,
                              ),
                            ),
                            SizedBox(
                              height: 20.0 * h,
                            ),
                            Text(
                              "NOTE: This is a Card-Sorting Exercise where you have to Drag & Drop the box with the company name in one of the following categorize. Also, you can undo if selected wrong option.",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.0 * h,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ]),
                    ),
                  ),
                  const Expanded(flex: 1, child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0 * w,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 22.0 * h),
                      width: MediaQuery.of(context).size.width * h * w,
                      child: Center(
                        child: Text(
                          index == 0
                              ? "Welcome to Card Sorting Excercise, Let's Start!!"
                              : "${companyList[index - 1].cName} was placed in ${companyList[index - 1].value}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0 * h,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 20 * w,
                top: 330 * h,
                //  *
                //     MediaQueryData.fromView(WidgetsBinding.instance.window)
                //         .size
                //         .height /
                //     defaultHeight,
                child: _buildWidget("Very\nFamiliar", five, index),
              ),
              Positioned(
                left: 160 * w,
                top: 370,
                child: _buildWidget("Familiar", four, index),
              ),
              Positioned(
                right: 40 * w,
                top: 480,
                child: _buildWidget("Somewhat\nFamiliar", three, index),
              ),
              Positioned(
                left: 160 * w,
                top: 590,
                child: _buildWidget("Known But\nNot Familiar", two, index),
              ),
              Positioned(
                left: 20 * w,
                top: 630,
                child: _buildWidget("Unknown", one, index),
              ),
              Positioned(
                left: 45.0 * w,
                top: 510.0,
                child: Draggable(
                  data: "Familiarity",
                  dragAnchorStrategy: pointerDragAnchorStrategy,
                  feedback: DraggingListItem(
                    dragKey: _draggableKey,
                    companyName: companyName,
                  ),
                  child: !valWidgetDisappear
                      ? CompanyNameWidget(text: companyName)
                      : Container(),
                  onDragStarted: () {
                    setState(() {
                      valWidgetDisappear = true;
                    });
                  },
                  onDragEnd: (details) {
                    if (details.wasAccepted) {
                      if ((i + 1) == companyList.length) {
                        for (int j = 0; j < companyList.length; j++) {
                          if (companyList[j].value == five) {
                            countFive++;
                          } else if (companyList[j].value == four) {
                            countFour++;
                          } else if (companyList[j].value == three) {
                            countThree++;
                          } else if (companyList[j].value == two) {
                            countTwo++;
                          } else {
                            countOne++;
                          }
                        }
                        avgFive = (countFive / companyList.length) * 100;
                        avgFour = (countFour / companyList.length) * 100;
                        avgThree = (countThree / companyList.length) * 100;
                        avgTwo = (countTwo / companyList.length) * 100;
                        avgOne = (countOne / companyList.length) * 100;
                        Navigator.of(context).push(FadeRoute(
                            page: ResultForFamiliarity(result: companyList)));
                      } else {
                        setState(() {
                          i++;
                        });
                      }
                    }
                    setState(() {
                      valWidgetDisappear = false;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWidget(String text, String index, int indexToBeUpdated) {
    return DragTarget(
      builder: (context, candidateData, rejectedData) {
        return Transform.scale(
          scale: candidateData.isNotEmpty ? 1.3 : 1.0,
          child: Container(
            width: 101 * w,
            height: 101 * w,
            // padding: EdgeInsets.symmetric(horizontal: 22 * w),
            decoration: BoxDecoration(
              color: candidateData.isNotEmpty ? Colors.black : Colors.white,
              border: Border.all(
                width: 3.0 * w,
                color: candidateData.isNotEmpty ? Colors.white : Colors.black,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: candidateData.isNotEmpty ? 16.0 * h : 14.0 * h,
                  color: candidateData.isNotEmpty ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
      onAccept: (item) {
        _itemDroppedOnCustomerCart(indexToBeUpdated, index);
      },
    );
  }
}

class CompanyNameWidget extends StatelessWidget {
  final String text;

  const CompanyNameWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      borderRadius: const BorderRadius.all(Radius.circular(7.0)),
      child: Container(
        width: 162 * w,
        height: 52 * h,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1.0 * w,
            color: Colors.black,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(7.0),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18.0 * h,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class DraggingListItem extends StatelessWidget {
  const DraggingListItem({
    super.key,
    required this.dragKey,
    required this.companyName,
  });

  final GlobalKey dragKey;
  final String companyName;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: FractionalTranslation(
        translation: const Offset(-0.5, -0.5),
        child: ClipRRect(
          key: dragKey,
          borderRadius: BorderRadius.circular(7.0),
          child: Opacity(
            opacity: 0.8,
            child: Container(
              width: 162 * w,
              height: 52 * h,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1.0 * w,
                  color: Colors.black,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(7.0),
                ),
              ),
              child: Center(
                child: Text(
                  companyName,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 14.0 * h,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

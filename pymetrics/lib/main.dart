import 'package:flutter/material.dart';
import 'package:pymetrics/companyName.dart';
import 'package:pymetrics/fadeRoute.dart';
import 'package:pymetrics/result.dart';
import 'package:pymetrics/values.dart';

void main() {
  runApp(
    const MaterialApp(
      home: ExampleDragAndDrop(),
      debugShowCheckedModeBanner: false,
    ),
  );
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

  @override
  void initState() {
    super.initState();
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
    // print(companyList[i]);
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      // appBar: _buildAppBar(),
      body: _buildContent(companyList[i].cName, i),
    );
  }

  Widget _buildContent(String companyName, index) {
    return Stack(
      children: [
        SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: SizedBox(
                      width: 110.0,
                      height: 50.0,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (i > 0) {
                              i--;
                              companyList[i].answered = false;
                            }
                          });
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.undo,
                              color: Colors.black,
                              size: 30.0,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'Undo',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 211.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.0,
                          color: Colors.black,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: const Color(0xFFF3F3F3),
                      ),
                      padding: const EdgeInsets.all(22.0),
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "How Familiar how are you with the website shown in the center box?",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 21.0,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "NOTE: This is a Card-Sorting Exercise where you have to Drag & Drop the box with the company name in one of the following categorize. Also, you can undo if selected wrong option.",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.0,
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
                          width: 2.0,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                      ),
                      height: 60.0,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          index == 0
                              ? "Welcome to Card Sorting Excercise, Let's Start!!"
                              : "${companyList[index - 1].cName} was placed in ${companyList[index - 1].value}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 20,
                top: 330,
                child: _buildWidget("Very\nFamiliar", five, index),
              ),
              Positioned(
                left: 160,
                top: 370,
                child: _buildWidget("Familiar", four, index),
              ),
              Positioned(
                right: 40,
                top: 480,
                child: _buildWidget("Somewhat\nFamiliar", three, index),
              ),
              Positioned(
                left: 160,
                top: 590,
                child: _buildWidget("Known But\nNot Familiar", two, index),
              ),
              Positioned(
                left: 20,
                top: 630,
                child: _buildWidget("Unknown", one, index),
              ),
              Positioned(
                left: 45.0,
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
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              color: candidateData.isNotEmpty ? Colors.black : Colors.white,
              border: Border.all(
                width: 3.0,
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
                  fontSize: candidateData.isNotEmpty ? 16.0 : 14.0,
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
        width: 162,
        height: 52,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1.0,
            color: Colors.black,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(7.0),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18.0,
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
              width: 162,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1.0,
                  color: Colors.black,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(7.0),
                ),
              ),
              child: Center(
                child: Text(
                  companyName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 14.0,
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

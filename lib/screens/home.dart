import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  double todaySliderValue = 15;
  double yesterdayScore = 20;
  double weeklyAverageScore = 50;

  bool usePlastic = false;

  int selectFood = 0;
  int selectTime = 0;
  int selectNumber = 0;

  List number = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
  ];

  List<String> time = [
    "0 dakika",
    "15 dakika",
    "30 dakika",
    "45 dakika",
    "1 saat",
    "2 saat",
    "4 saat",
    "5 saat",
    "6 saat",
    "7 saat",
    "8 saat",
    "9 saat",
    "10 saat",
    "11 saat",
    "12 saat",
    "13 saat",
    "14 saat",
    "15 saat",
    "16 saat",
    "17 saat",
    "18 saat",
    "19 saat",
    "20 saat",
    "21 saat",
    "22 saat",
    "23 saat",
    "24 saat",
  ];

  List<String> foodType = [
    "Vegan",
    "Vejertaryen",
    "Peskotaryen",
    "Az Et",
    "Orta Et",
    "Çok Et",
  ];
  String foodTitle = "";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgrndColor(),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                appBar(),
                slider(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        scores(),
                        todayDone(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  //Background Color
  Widget backgrndColor() {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          tileMode: TileMode.mirror,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [const Color(0xff276375), const Color(0xff050D10)],
        ),
      ),
    );
  }

  //AppBar & Actions
  Widget appBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width / 25, //Left
        //MediaQuery.of(context).size.height / 10, //Top
        0,
        MediaQuery.of(context).size.width / 25, //Right
        MediaQuery.of(context).size.height / 50, //Botttom
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "Hoş Geldiniz!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {},
                  height: 40,
                  minWidth: 40,
                  child: Icon(Icons.settings),
                  color: Colors.white,
                ),
                SizedBox(width: 15),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {},
                  height: 40,
                  minWidth: 40,
                  child: Icon(Icons.person),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Slider Bar & Score
  Widget slider() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width / 20, //Left
        MediaQuery.of(context).size.height / 20, //Top
        MediaQuery.of(context).size.width / 20, //Right
        MediaQuery.of(context).size.height / 100, //Botttom
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("${todaySliderValue.round().toString()}",
                  style: TextStyle(fontSize: 40, color: Colors.white)),
              Text(" / 100",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
              disabledActiveTrackColor: Colors.blue,
              disabledInactiveTrackColor: Colors.white,
              disabledThumbColor: Colors.blue,
              trackHeight: 20,
              thumbShape: RoundSliderThumbShape(
                disabledThumbRadius: 11,
                pressedElevation: 0,
                elevation: 0,
              ),
            ),
            child: Slider(
              value: todaySliderValue,
              onChanged: null,
              min: 0,
              max: 100,
              divisions: 100,
            ),
          ),
        ],
      ),
    );
  }

  //Previous Scores & Increasing Score
  Widget scores() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width / 7.5, //Left
        MediaQuery.of(context).size.height / 15, //Top
        MediaQuery.of(context).size.width / 7.5, //Right
        MediaQuery.of(context).size.height / 15, //Botttom
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Left Score
              Column(children: [
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xff4898E7), width: 5),
                    borderRadius: BorderRadius.circular(75),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("${yesterdayScore.round().toString()}",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      Text(" / 100",
                          style: TextStyle(
                              fontSize: 12.5, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Dün Kazanılan\nPuanlar",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ]),
              SizedBox(width: MediaQuery.of(context).size.width / 10),

              //Right Score
              Column(children: [
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xff4898E7), width: 5),
                    borderRadius: BorderRadius.circular(75),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("${weeklyAverageScore.round().toString()}",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      Text(" / 100",
                          style: TextStyle(
                              fontSize: 12.5, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Haftanın\nOrtalaması",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ]),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 25,
          ),

          //Increasing Button
          FlatButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {},
            height: 50,
            color: Color(0xff328DE6),
            minWidth: double.maxFinite,
            child: Text(
              "Sürdürülebilirlik Puanını Arttır",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  //Today Done Box
  Widget todayDone() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width / 20, //Left
        MediaQuery.of(context).size.height / 100, //Top
        MediaQuery.of(context).size.width / 20, //Right
        MediaQuery.of(context).size.height / 50, //Botttom
      ),
      child: Container(
        height: 630,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              todayDoneTitle(),
              todayDoneContents(context),
            ],
          ),
        ),
      ),
    );
  }

  //Today Done Box-Title
  Widget todayDoneTitle() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bugün Yaptıkların",
              style: TextStyle(
                color: Color(0xff328DE6),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 7.5),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width / 3,
              color: Color(0xffCCE3F9),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 6),
          child: FlatButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            onPressed: () {},
            height: MediaQuery.of(context).size.height / 17.5,
            minWidth: MediaQuery.of(context).size.width / 17.5,
            color: Color(0xff328DE6),
            child: Icon(
              Icons.add,
              size: MediaQuery.of(context).size.height / 30,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  //Today Done Box-Content
  Widget todayDoneContents(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(
        children: [
          tdFoodType(context),
          tdScreenTime(context),
          tdPlasticUse(context),
          tdGetOrder(context),
          tdGetMedicine(context),
          tdShopping(context),
          tdGetPaper(context),
        ],
      ),
    );
  }

  //Today Done Box-Contents FoodType
  Widget tdFoodType(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          child: Icon(Icons.food_bank, size: 30, color: Colors.white),
          decoration: BoxDecoration(
              color: Color(0xff45D1FD),
              border: Border.all(color: Color(0xff45D1FD), width: 0),
              borderRadius: BorderRadius.circular(10)),
        ),
        title: Text("Yemek Türü",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        trailing: FlatButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              foodTypePicker(context);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("${foodType[selectFood]}", style: TextStyle(color: Colors.black)),
                Text("Edit"),
              ],
            ),
            height: 10,
            minWidth: 10,
            color: Colors.black12),
      ),
    );
  }

  //Today Done Box-Contents ScreenTime
  Widget tdScreenTime(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          child: Icon(Icons.phone, size: 30, color: Colors.white),
          decoration: BoxDecoration(
              color: Color(0xff45D1FD),
              border: Border.all(color: Color(0xff45D1FD), width: 0),
              borderRadius: BorderRadius.circular(10)),
        ),
        title: Text("Ekran Süresi",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        trailing: FlatButton(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            timePicker(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("${time[selectTime]}", style: TextStyle(color: Colors.black)),
              Text("Edit"),
            ],
          ),
          height: 10,
          minWidth: 10,
          color: Colors.black12,
        ),
      ),
    );
  }

  //Today Done Box-Contents UsePlastic
  Widget tdPlasticUse(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          child: Icon(Icons.ac_unit, size: 30, color: Colors.white),
          decoration: BoxDecoration(
              color: Color(0xff45D1FD),
              border: Border.all(color: Color(0xff45D1FD), width: 0),
              borderRadius: BorderRadius.circular(10)),
        ),
        title: Text("Plastik Kullanımı",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        // SizedBox(width: MediaQuery.of(context).size.width / 12.5),
        trailing: Checkbox(
          value: usePlastic,
          onChanged: (change) {
            setState(() {
              usePlastic = change;
            });
          },
        ),
      ),
    );
  }

  // Today Done Box-Contents GetOrder
  Widget tdGetOrder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          child: Icon(Icons.food_bank, size: 30, color: Colors.white),
          decoration: BoxDecoration(
              color: Color(0xff45D1FD),
              border: Border.all(color: Color(0xff45D1FD), width: 0),
              borderRadius: BorderRadius.circular(10)),
        ),
        title: Text("Yemek Siparişi",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        trailing: FlatButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              numberPicker(context);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("1", style: TextStyle(color: Colors.black)),
                Text("Edit"),
              ],
            ),
            height: 10,
            minWidth: 10,
            color: Colors.black12),
      ),
    );
  }

  // Today Done Box-Contents GetMedicine
  Widget tdGetMedicine(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          child: Icon(Icons.food_bank, size: 30, color: Colors.white),
          decoration: BoxDecoration(
              color: Color(0xff45D1FD),
              border: Border.all(color: Color(0xff45D1FD), width: 0),
              borderRadius: BorderRadius.circular(10)),
        ),
        title: Text("İlaç",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        trailing: FlatButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              numberPicker(context);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("1", style: TextStyle(color: Colors.black)),
                Text("Edit"),
              ],
            ),
            height: 10,
            minWidth: 10,
            color: Colors.black12),
      ),
    );
  }

  // Today Done Box-Contents GetOrder
  Widget tdShopping(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          child: Icon(Icons.food_bank, size: 30, color: Colors.white),
          decoration: BoxDecoration(
              color: Color(0xff45D1FD),
              border: Border.all(color: Color(0xff45D1FD), width: 0),
              borderRadius: BorderRadius.circular(10)),
        ),
        title: Text("Kıyafet Alışverişi",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        trailing: FlatButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              numberPicker(context);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("1", style: TextStyle(color: Colors.black)),
                Text("Edit"),
              ],
            ),
            height: 10,
            minWidth: 10,
            color: Colors.black12),
      ),
    );
  }

  // Today Done Box-Contents GetOrder
  Widget tdGetPaper(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          child: Icon(Icons.food_bank, size: 30, color: Colors.white),
          decoration: BoxDecoration(
              color: Color(0xff45D1FD),
              border: Border.all(color: Color(0xff45D1FD), width: 0),
              borderRadius: BorderRadius.circular(10)),
        ),
        title: Text("Kağıt Almak",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        trailing: FlatButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              numberPicker(context);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("1", style: TextStyle(color: Colors.black)),
                Text("Edit"),
              ],
            ),
            height: 10,
            minWidth: 10,
            color: Colors.black12),
      ),
    );
  }


  Future numberPicker(BuildContext context, {double height}) {
    return showModalBottomSheet(
      isScrollControlled: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(13), topRight: Radius.circular(13))),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => Container(
        height: height ?? MediaQuery.of(context).size.height / 3,
        child: Container(
          child: CupertinoPicker.builder(
            childCount: number.length,
            itemBuilder: (context, index){
              return Center(child: Text(number[index]));
            },
            magnification: 1,
            backgroundColor: Colors.white,
            itemExtent: 50,
            onSelectedItemChanged: (int index) {
              setState(() {
                selectNumber = index;
              });
            },
          ),
        ),
      ),
    );
  }

  Future timePicker(BuildContext context, {double height}) {
    return showModalBottomSheet(
      isScrollControlled: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(13), topRight: Radius.circular(13))),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => Container(
        height: height ?? MediaQuery.of(context).size.height / 3,
        child: Container(
          child: CupertinoPicker.builder(
            childCount: time.length,
            itemBuilder: (context, index){
              return Center(child: Text(time[index]));
            },
            magnification: 1,
            backgroundColor: Colors.white,
            itemExtent: 50,
            onSelectedItemChanged: (int index) {
              setState(() {
                selectTime = index;
              });
            },
          ),
        ),
      ),
    );
  }

  Future foodTypePicker(BuildContext context, {double height}) {
    return showModalBottomSheet(
      isScrollControlled: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(13), topRight: Radius.circular(13))),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => Container(
        height: height ?? MediaQuery.of(context).size.height / 3,
        child: Container(
          child: CupertinoPicker.builder(
            childCount: foodType.length,
            itemBuilder: (context, index){
              return Center(child: Text(foodType[index]));
            },
            magnification: 1,
            backgroundColor: Colors.white,
            itemExtent: 50,
            onSelectedItemChanged: (int index) {
              setState(() {
                selectFood = index;
              });
            },
          ),
        ),
      ),
    );
  }
}


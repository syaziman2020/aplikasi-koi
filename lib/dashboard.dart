import 'package:aplikasikoi/models/sensor_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var height, width;

  Sensor sensorResult = Sensor();

  Future<int> updateKeranAir(int value) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref();
      await ref.update({
        "keranAir": value,
      });
      return value;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> updatePompaAir(int value) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref();
      await ref.update({
        "pompaAir": value,
      });
      return value;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> updateLampuUV(int value) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref();
      await ref.update({
        "saklarLampu": value,
      });
      return value;
    } catch (e) {
      rethrow;
    }
  }

  void readData() {
    try {
      DatabaseReference starCountRef = FirebaseDatabase.instance.ref('');
      starCountRef.onValue.listen((DatabaseEvent event) {
        print('Listener is running');
        final data = event.snapshot.value;
        sensorResult = Sensor.fromJson(data as Map);
        setState(() {});
      });
    } catch (e) {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Terjadi Kesalahan, periksa koneksi internet anda'),
        ));
      });
    }
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 251, 147, 93),
          Color.fromARGB(255, 209, 88, 55)
        ])),
        height: height,
        width: width,
        //color: Colors.orange,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(),
              height: height * 0.20,
              width: width,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 35,
                      left: 15,
                      right: 15,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "SI-KO(I)OT",
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "SISTEM PEMANTAUAN DAN PERINGATAN DINI KUALITAS AIR KOLAM IKAN MAS KOI",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Text(
                          "STATUS",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 10, 12, 4),
                        child: Container(
                          height: 150,
                          // color: Colors.blue,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Container(
                                  height: 150,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: Offset(1, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 80,
                                        // decoration:BoxDecoration(color: Colors.black),
                                        child: Center(
                                          child: Image.asset(
                                            'assets/images/SensorpHAir.png',
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "pH Air",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: const Color.fromARGB(
                                              255, 65, 145, 151),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${sensorResult.datapH ?? 0}",
                                        style: TextStyle(
                                          height: 0,
                                          fontSize: 18,
                                          color: const Color.fromARGB(
                                              255, 65, 145, 151),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Container(
                                  height: 150,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: Offset(1, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 80,
                                        child: Center(
                                          child: Image.asset(
                                            'assets/images/SensorSuhuAir.png',
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Suhu Air",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: const Color.fromARGB(
                                              255, 48, 133, 195),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${sensorResult.dataSuhu ?? 0}\u2103",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: const Color.fromARGB(
                                              255, 48, 133, 195),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Container(
                                  height: 150,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: Offset(1, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 80,
                                        child: Center(
                                          child: Image.asset(
                                            'assets/images/SensorKekeruhan.png',
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Kekeruhan",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: const Color.fromARGB(
                                              255, 133, 133, 133),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${sensorResult.dataKekeruhan ?? 0} NTU",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: const Color.fromARGB(
                                              255, 133, 133, 133),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Container(
                                  height: 150,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: Offset(1, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 80,
                                        child: Center(
                                          child: Image.asset(
                                            'assets/images/SensorUltrasonik.png',
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Tinggi Air",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: const Color.fromARGB(
                                              255, 192, 130, 97),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${sensorResult.sisaAir ?? 0} cm",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: const Color.fromARGB(
                                              255, 192, 130, 97),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          "KENDALI",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(12, 10, 12, 4),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 0,
                                          blurRadius: 4,
                                          offset: Offset(1, 2),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 0,
                                          left: 20,
                                          right: 5,
                                          bottom: 5),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Pengurasan Air",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color.fromARGB(
                                                        255, 109, 109, 109),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  ((sensorResult.pompaAir ??
                                                              0) !=
                                                          0)
                                                      ? "ON"
                                                      : "OFF",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: ((sensorResult
                                                                      .pompaAir ??
                                                                  0) !=
                                                              0)
                                                          ? Colors.green
                                                          : Colors.red,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          //  Expanded(
                                          //    child: Container(
                                          //     height: 50,
                                          //     width: 150,
                                          //     decoration: BoxDecoration(
                                          //      color: Colors.white,
                                          //      borderRadius:
                                          //         BorderRadius.circular(5),
                                          //    ),
                                          //    child: Icon(Icons.calendar_month),
                                          //   ),
                                          //  ),
                                          Expanded(
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    child: ElevatedButton(
                                                      onPressed: () async {
                                                        if ((sensorResult
                                                                    .pompaAir ??
                                                                0) !=
                                                            0) {
                                                          await updatePompaAir(
                                                              0);
                                                          setState(() {});
                                                        } else {
                                                          await updatePompaAir(
                                                              1);
                                                          setState(() {});
                                                        }
                                                      },
                                                      child: Image.asset(
                                                        'assets/images/tombolonoff.png',
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        padding:
                                                            EdgeInsets.all(17),
                                                        primary: ((sensorResult
                                                                        .pompaAir ??
                                                                    0) !=
                                                                0)
                                                            ? Colors.green
                                                            : Colors.red,
                                                        elevation: 5,
                                                        shadowColor:
                                                            Colors.grey,
                                                        shape: CircleBorder(),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(12, 10, 12, 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 0,
                                      blurRadius: 4,
                                      offset: Offset(1, 2),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 0, left: 20, right: 5, bottom: 5),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Pengisian Air",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              ((sensorResult.keranAir ?? 0) !=
                                                      0)
                                                  ? "ON"
                                                  : "OFF",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color:
                                                      ((sensorResult.keranAir ??
                                                                  0) !=
                                                              0)
                                                          ? Colors.green
                                                          : Colors.red,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Expanded(
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                child: ElevatedButton(
                                                  onPressed: () async {
                                                    if ((sensorResult
                                                                .keranAir ??
                                                            0) !=
                                                        0) {
                                                      await updateKeranAir(0);
                                                      setState(() {});
                                                    } else {
                                                      await updateKeranAir(1);
                                                      setState(() {});
                                                    }
                                                  },
                                                  child: Image.asset(
                                                    'assets/images/tombolonoff.png',
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.all(17),
                                                    primary: ((sensorResult
                                                                    .keranAir ??
                                                                0) !=
                                                            0)
                                                        ? Colors.green
                                                        : Colors.red,
                                                    elevation: 5,
                                                    shadowColor: Colors.grey,
                                                    shape: CircleBorder(),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(12, 10, 12, 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 0,
                                      blurRadius: 4,
                                      offset: Offset(1, 2),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 0, left: 20, right: 5, bottom: 5),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Lampu UV",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.purple,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              ((sensorResult.saklarLampu ??
                                                          0) !=
                                                      0)
                                                  ? "ON"
                                                  : "OFF",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: ((sensorResult
                                                                  .saklarLampu ??
                                                              0) !=
                                                          0)
                                                      ? Colors.green
                                                      : Colors.red,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Expanded(
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                child: ElevatedButton(
                                                  onPressed: () async {
                                                    if ((sensorResult
                                                                .saklarLampu ??
                                                            0) !=
                                                        0) {
                                                      await updateLampuUV(0);
                                                      setState(() {});
                                                    } else {
                                                      await updateLampuUV(1);
                                                      setState(() {});
                                                    }
                                                  },
                                                  child: Image.asset(
                                                    'assets/images/tombolonoff.png',
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.all(17),
                                                    primary: ((sensorResult
                                                                    .saklarLampu ??
                                                                0) !=
                                                            0)
                                                        ? Colors.green
                                                        : Colors.red,
                                                    elevation: 5,
                                                    shadowColor: Colors.grey,
                                                    shape: CircleBorder(),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  )),
              height: height * 0.80,
              width: width,
            ),
          ],
        ),
      ),
    );
  }
}

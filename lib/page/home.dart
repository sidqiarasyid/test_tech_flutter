import 'dart:async';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:test_tech_flutter/model/background_hit.dart';
import 'package:test_tech_flutter/model/init_data.dart';
import 'package:test_tech_flutter/page/keluar.dart';
import 'package:test_tech_flutter/page/kurs.dart';
import 'package:test_tech_flutter/page/masuk.dart';
import 'package:test_tech_flutter/page/mutasi.dart';
import 'package:test_tech_flutter/page/pindah.dart';
import 'package:test_tech_flutter/service/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _sliderOn = false;
  bool _isLoading = true;
  Timer? timer;
  List<TrxTipe> Trxtipe = [];

  Future<void> trxTipe() async {
    setState(() {
      _isLoading = true;
    });
    Initdata result = await APIService().initData();
    if (result.status.error == 0) {
      setState(() {
        Trxtipe = result.data.trxTipe;
        _isLoading = false;
      });
    }
  }

  Future<void> backgroundHit() async {
    BackgroundHit result = await APIService().backgroundHit();
    print("Background hit Success");
  }

  @override
  void initState() {
    trxTipe();
    backgroundHit();
    timer = Timer.periodic(Duration(seconds: 30), (Timer t) => backgroundHit());
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Widget slider_items(String title, String val, int color) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w700, color: Color(color), fontSize: 12),
        ),
        SizedBox(
          width: 4,
        ),
        DottedLine(
          dashColor: Color(0XFFC1DDED),
          direction: Axis.horizontal,
          lineLength: 100,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          val,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: Color(color),
          ),
        ),
      ],
    );
  }

  Widget card_items(String img, String cur, String num) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 26),
      child: Row(
        children: [
          Image.asset(
            img,
            color: _sliderOn ? Color(0X262787BD) : Color(0XFF2787BD),
            width: 25,
            height: 21,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            cur,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: _sliderOn ? Color(0X262787BD) : Color(0XFF2787BD)),
          ),
          SizedBox(
            width: 4,
          ),
          DottedLine(
            dashColor: _sliderOn ? Color(0X262787BD) : Color(0XFF2787BD),
            direction: Axis.horizontal,
            lineLength: 153,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            num,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: _sliderOn ? Color(0X262787BD) : Color(0XFF2787BD)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0XFF2787BD),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: Colors.white))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/background/header.png'),
                    Positioned(
                      top: 15,
                      right: 8,
                      left: 8,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 23),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Text("APP KEUANGAN",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Color(0XFF2787BD))),
                            Image.asset(
                              'assets/icons/notif.png',
                              width: 35,
                              height: 35,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      right: 8,
                      left: 8,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image.asset('assets/icons/house.png',
                                    width: 55, height: 55),
                                Text(
                                  'HOME',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10,
                                      color: Color(0XFF2787BD)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/icons/transaksi.png',
                                  width: 55,
                                  height: 55,
                                  opacity: AlwaysStoppedAnimation(.15),
                                ),
                                Text(
                                  'TRANSAKSI',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10,
                                      color: Color(0X262787BD)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/icons/laporan.png',
                                  width: 55,
                                  height: 55,
                                  opacity: AlwaysStoppedAnimation(.15),
                                ),
                                Text(
                                  'LAPORAN',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10,
                                      color: Color(0X262787BD)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/icons/settings.png',
                                  width: 55,
                                  height: 55,
                                  opacity: AlwaysStoppedAnimation(.15),
                                ),
                                Text(
                                  'TOOLS',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10,
                                      color: Color(0X262787BD)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 150,
                        child: Image.asset(
                          'assets/icons/refresh.png',
                          width: 27,
                          height: 27,
                        ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 360,
                  height: 180,
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              'Nama Outlet',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: _sliderOn
                                      ? Color(0X262787BD)
                                      : Color(0XFF2787BD)),
                            ),
                            margin: EdgeInsets.only(top: 16, left: 16),
                          ),
                          card_items(
                              'assets/icons/rupiah.png', 'IDR', '500.000'),
                          card_items('assets/icons/dollar.png', 'USD', '0'),
                          card_items('assets/icons/euro.png', 'EUR', '20.000'),
                          card_items(
                              'assets/icons/sdollar.png', 'SGD', '6.000'),
                        ],
                      ),
                      Positioned(
                        right: 0,
                        child: AnimatedContainer(
                          alignment: Alignment.centerLeft,
                          duration: Duration(milliseconds: 800),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              image: DecorationImage(
                                  image: AssetImage('assets/icons/slider.png'),
                                  fit: BoxFit.fitHeight)),
                          width: _sliderOn ? 330 : 50,
                          height: 180,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0.0,
                                          primary: Colors.transparent),
                                      onPressed: () async {
                                        setState(() {
                                          _sliderOn = !_sliderOn;
                                        });
                                      },
                                      child: Image.asset(_sliderOn
                                          ? 'assets/icons/close.png'
                                          : 'assets/icons/open.png'),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                GestureDetector(
                                                  child: Image.asset(
                                                      'assets/icons/masuk.png',
                                                      width: 30,
                                                      height: 30),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                MasukPage()));
                                                  },
                                                ),
                                                Text(
                                                  Trxtipe[0].nama,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 10,
                                                      color: Color(0XFF2787BD)),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Column(
                                              children: [
                                                GestureDetector(
                                                  child: Image.asset(
                                                    'assets/icons/keluar.png',
                                                    width: 30,
                                                    height: 30,
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                KeluarPage()));
                                                  },
                                                ),
                                                Text(
                                                  Trxtipe[1].nama,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 10,
                                                      color: Color(0XFF2787BD)),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Column(
                                              children: [
                                                GestureDetector(
                                                  child: Image.asset(
                                                    'assets/icons/pindah.png',
                                                    width: 30,
                                                    height: 30,
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                PindahPage()));
                                                  },
                                                ),
                                                Text(
                                                  Trxtipe[2].nama,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 10,
                                                      color: Color(0XFF2787BD)),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Column(
                                              children: [
                                                GestureDetector(
                                                  child: Image.asset(
                                                    'assets/icons/mutasi.png',
                                                    width: 30,
                                                    height: 30,
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                MutasiPage()));
                                                  },
                                                ),
                                                Text(
                                                  'MUTASI',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 10,
                                                      color: Color(0XFF2787BD)),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Column(
                                              children: [
                                                GestureDetector(
                                                  child: Image.asset(
                                                    'assets/icons/kurs.png',
                                                    width: 30,
                                                    height: 30,
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                KursPage()));
                                                  },
                                                ),
                                                Text(
                                                  'KURS',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 10,
                                                      color: Color(0XFF2787BD)),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 8),
                                            width: 250,
                                            height: 110,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey,
                                                      blurRadius: 8.0),
                                                ],
                                                color: Color(0xFFFFFFFF),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15))),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Jumlah barang',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color:
                                                              Color(0xFF6F6F6F),
                                                          fontSize: 12),
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    DottedLine(
                                                      dashColor:
                                                          Color(0XFFC1DDED),
                                                      direction:
                                                          Axis.horizontal,
                                                      lineLength: 120,
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      '16',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xFF6F6F6F),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Total IDR',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              Color(0xFF2787BD),
                                                          fontSize: 12),
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    DottedLine(
                                                      dashColor:
                                                          Color(0XFFC1DDED),
                                                      direction:
                                                          Axis.horizontal,
                                                      lineLength: 83,
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      'Rp 100.000.000',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xFF2787BD),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Total USD',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              Color(0xFF2787BD),
                                                          fontSize: 12),
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    DottedLine(
                                                      dashColor:
                                                          Color(0XFFC1DDED),
                                                      direction:
                                                          Axis.horizontal,
                                                      lineLength: 120,
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      '\$ 2.000',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xFF2787BD),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Total EUR',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              Color(0xFF2787BD),
                                                          fontSize: 12),
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    DottedLine(
                                                      dashColor:
                                                          Color(0XFFC1DDED),
                                                      direction:
                                                          Axis.horizontal,
                                                      lineLength: 130,
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      '€ 200',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xFF2787BD),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Total SGD',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              Color(0xFF2787BD),
                                                          fontSize: 12),
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    DottedLine(
                                                      dashColor:
                                                          Color(0XFFC1DDED),
                                                      direction:
                                                          Axis.horizontal,
                                                      lineLength: 110,
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      'S\$ 1.000',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xFF2787BD),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
    ));
  }
}

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

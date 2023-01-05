import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_tech_flutter/model/init_data.dart';
import 'package:test_tech_flutter/service/api_service.dart';

class MutasiPage extends StatefulWidget {
  MutasiPage({Key? key}) : super(key: key);

  @override
  State<MutasiPage> createState() => _MutasiPageState();
}

class _MutasiPageState extends State<MutasiPage> {
  OutletSub? outletSubModel;
  CurTipe? curTipeModel;
  List<OutletSub>? outletSubs;
  List<CurTipe>? curTipe;
  bool _isLoading = true;
  String _selectDate = "";
  DateTime _selectedDate = DateTime.now();
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  Future<void> getDropdowndata() async {
    setState(() {
      _isLoading = true;
    });
    Initdata result = await APIService().initData();
    if (result.status.error == 0) {
      setState(() {
        outletSubs = result.data.outletSubs;
        curTipe = result.data.curTipe;
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    getDropdowndata();
    _selectDate = _dateFormat.format(_selectedDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFF2787BD),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back_ios_rounded,
                                    color: Color(0XFF2787BD))),
                            Text("Mutasi",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Color(0XFF2787BD))),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25, bottom: 20),
                          child: DropdownButton2<OutletSub>(
                            isExpanded: true,
                            value: outletSubModel,
                            iconSize: 20,
                            iconOnClick: Icon(Icons.keyboard_arrow_up_rounded,
                                color: Color(0XFF2787BD)),
                            icon: Icon(Icons.keyboard_arrow_down_rounded,
                                color: Color(0XFF2787BD)),
                            buttonWidth: 125,
                            buttonHeight: 30,
                            buttonPadding: EdgeInsets.symmetric(horizontal: 12),
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0XFFC1DDED),
                            ),
                            buttonElevation: 2,
                            itemPadding: EdgeInsets.only(left: 14, right: 14),
                            dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            dropdownElevation: 4,
                            offset: Offset(0, -10),
                            onChanged: (newValue) {
                              setState(() {
                                outletSubModel = newValue!;
                                print(outletSubModel);
                              });
                            },
                            hint: Expanded(
                              child: Text(
                                'Nama Outlet',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFF2787BD),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            isDense: true,
                            underline: SizedBox.shrink(),
                            items: outletSubs?.map((item) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      item.outletName,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0XFF2787BD)),
                                    ),
                                    value: item,
                                  );
                                }).toList() ??
                                [],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _showDialog(context);
                          },
                          child: Container(
                            width: 300,
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 13),
                            margin: EdgeInsets.only(bottom: 25),
                            decoration: BoxDecoration(
                              color: Color(0xFFC1DDED),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 8.0),
                              ],
                            ),
                            child: Row(
                              children: [
                                Text('Jenis Laporan',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF2787BD),
                                    )),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  '19/10/2021 - 19/12/2021',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF2787BD),
                                      fontSize: 12),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.keyboard_arrow_down_sharp,
                                    size: 18, color: Color(0xFF2787BD))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text("Dari",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        width: 230,
                        height: 30,
                        child: TextFormField(
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Color(0XFF2787BD),
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            fillColor: Colors.grey[50],
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: DropdownButton2<CurTipe>(
                          isExpanded: true,
                          value: curTipeModel,
                          iconSize: 20,
                          iconOnClick: Icon(Icons.keyboard_arrow_up_rounded,
                              color: Color(0XFF2787BD)),
                          icon: Icon(Icons.keyboard_arrow_down_rounded,
                              color: Color(0XFF2787BD)),
                          buttonWidth: 100,
                          buttonHeight: 30,
                          buttonPadding: EdgeInsets.symmetric(horizontal: 12),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            color: Colors.white,
                          ),
                          buttonElevation: 2,
                          itemPadding: EdgeInsets.only(left: 14, right: 14),
                          dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          dropdownElevation: 4,
                          offset: Offset(0, -10),
                          onChanged: (newValue) {
                            setState(() {
                              curTipeModel = newValue!;
                              print(outletSubModel);
                            });
                          },
                          hint: Expanded(
                            child: Text(
                              'Pilih mata uang',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF2787BD),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          isDense: true,
                          underline: SizedBox.shrink(),
                          items: curTipe?.map((item) {
                                return DropdownMenuItem(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        item.ctNama == "IDR"
                                            ? "assets/icons/rupiah.png"
                                            : item.ctNama == "USD"
                                                ? "assets/icons/dollar.png"
                                                : item.ctNama == "SGD"
                                                    ? "assets/icons/sdollar.png"
                                                    : item.ctNama == "EUR"
                                                        ? "assets/icons/euro.png"
                                                        : "",
                                        color: Color(0XFF2787BD),
                                        width: 25,
                                        height: 21,
                                      ),
                                      SizedBox(width: 7),
                                      Text(
                                        item.ctNama,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0XFF2787BD)),
                                      ),
                                    ],
                                  ),
                                  value: item,
                                );
                              }).toList() ??
                              [],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text("Ke",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        width: 230,
                        height: 30,
                        child: TextFormField(
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Color(0XFF2787BD),
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            fillColor: Colors.grey[50],
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: DropdownButton2<CurTipe>(
                          isExpanded: true,
                          value: curTipeModel,
                          iconSize: 20,
                          iconOnClick: Icon(Icons.keyboard_arrow_up_rounded,
                              color: Color(0XFF2787BD)),
                          icon: Icon(Icons.keyboard_arrow_down_rounded,
                              color: Color(0XFF2787BD)),
                          buttonWidth: 100,
                          buttonHeight: 30,
                          buttonPadding: EdgeInsets.symmetric(horizontal: 12),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            color: Colors.white,
                          ),
                          buttonElevation: 2,
                          itemPadding: EdgeInsets.only(left: 14, right: 14),
                          dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          dropdownElevation: 4,
                          offset: Offset(0, -10),
                          onChanged: (newValue) {
                            setState(() {
                              curTipeModel = newValue!;
                              print(outletSubModel);
                            });
                          },
                          hint: Expanded(
                            child: Text(
                              'Pilih mata uang',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF2787BD),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          isDense: true,
                          underline: SizedBox.shrink(),
                          items: curTipe?.map((item) {
                                return DropdownMenuItem(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        item.ctNama == "IDR"
                                            ? "assets/icons/rupiah.png"
                                            : item.ctNama == "USD"
                                                ? "assets/icons/dollar.png"
                                                : item.ctNama == "SGD"
                                                    ? "assets/icons/sdollar.png"
                                                    : item.ctNama == "EUR"
                                                        ? "assets/icons/euro.png"
                                                        : "",
                                        color: Color(0XFF2787BD),
                                        width: 25,
                                        height: 21,
                                      ),
                                      SizedBox(width: 7),
                                      Text(
                                        item.ctNama,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0XFF2787BD)),
                                      ),
                                    ],
                                  ),
                                  value: item,
                                );
                              }).toList() ??
                              [],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 225,
                  ),
                  Container(
                    width: 120,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFFC1DDED)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            color: Color(0xFF2787BD),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
    );

    setState(() {
      if (selected != null && selected != _selectedDate) {
        _selectedDate = selected;
        _selectDate = _dateFormat.format(selected);
      }
    });
  }

  Future _showDialog(context) async {
    return await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Text(
                  "Filter",
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0XFF2787BD),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                DropdownButton2<CurTipe>(
                  isExpanded: true,
                  value: curTipeModel,
                  iconSize: 20,
                  iconOnClick: Icon(Icons.keyboard_arrow_up_rounded,
                      color: Color(0XFF2787BD)),
                  icon: Icon(Icons.keyboard_arrow_down_rounded,
                      color: Color(0XFF2787BD)),
                  buttonWidth: 125,
                  buttonHeight: 30,
                  buttonPadding: EdgeInsets.symmetric(horizontal: 12),
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Colors.white,
                  ),
                  buttonElevation: 2,
                  itemPadding: EdgeInsets.only(left: 14, right: 14),
                  dropdownDecoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  dropdownElevation: 4,
                  offset: Offset(0, -10),
                  onChanged: (newValue) {
                    setState(() {
                      curTipeModel = newValue!;
                      print(outletSubModel);
                    });
                  },
                  hint: Expanded(
                    child: Text(
                      'Jenis Laporan',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF2787BD),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  isDense: true,
                  underline: SizedBox.shrink(),
                  items: curTipe?.map((item) {
                        return DropdownMenuItem(
                          child: Row(
                            children: [
                              Image.asset(
                                item.ctNama == "IDR"
                                    ? "assets/icons/rupiah.png"
                                    : item.ctNama == "USD"
                                        ? "assets/icons/dollar.png"
                                        : item.ctNama == "SGD"
                                            ? "assets/icons/sdollar.png"
                                            : item.ctNama == "EUR"
                                                ? "assets/icons/euro.png"
                                                : "",
                                color: Color(0XFF2787BD),
                                width: 25,
                                height: 21,
                              ),
                              SizedBox(width: 7),
                              Text(
                                item.ctNama,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0XFF2787BD)),
                              ),
                            ],
                          ),
                          value: item,
                        );
                      }).toList() ??
                      [],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Start Date',
                            style: TextStyle(
                                color: Color(0xFF2787BD),
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          InkWell(
                            onTap: () {
                              _showDatePicker(context);
                            },
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Color(0xFFC1DDED),
                                  borderRadius: BorderRadius.circular(10)),
                              height: 30,
                              child: Center(
                                child: Text(_selectDate.toString(),
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0XFF2787BD),
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'To Date',
                            style: TextStyle(
                                color: Color(0xFF2787BD),
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          InkWell(
                            onTap: () {
                              _showDatePicker(context);
                            },
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Color(0xFFC1DDED),
                                  borderRadius: BorderRadius.circular(10)),
                              height: 30,
                              child: Center(
                                child: Text(_selectDate.toString(),
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0XFF2787BD),
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 120,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF2787BD)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                )
              ]);
            },
          ),
        );
      },
    );
  }
}

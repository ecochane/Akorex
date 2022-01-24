import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatefirsttaskWidget extends StatefulWidget {
  const CreatefirsttaskWidget({Key key}) : super(key: key);

  @override
  _CreatefirsttaskWidgetState createState() => _CreatefirsttaskWidgetState();
}

class _CreatefirsttaskWidgetState extends State<CreatefirsttaskWidget> {
  DateTime datePicked;
  String categoryValue;
  TextEditingController textController1;
  TextEditingController textController2;
  String everyValue1;
  String everyValue2;
  String everyValue3;
  String timeValue;
  String everyValue4;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xE2F7FAFC),
        automaticallyImplyLeading: false,
        title: Text(
          'Add first Task',
          style: FlutterFlowTheme.title2.override(
            fontFamily: 'Lexend Deca',
            color: Color(0xFF26363D),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 24, 0),
            child: Text(
              '2/2',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xE2F7FAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              'Fill out the details below to add your first routine task.',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0x97A19CA7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                      child: TextFormField(
                        controller: textController1,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Task Name',
                          labelStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0x55200129),
                          ),
                          hintText: 'Enter your task here....',
                          hintStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.tertiaryColor,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x865B535D),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x865B535D),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Color(0xE2F7FAFC),
                        ),
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xE2F7FAFC),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: FlutterFlowDropDown(
                        initialOption: categoryValue ??= 'Skin',
                        options:
                            ['Skin', 'Hair', 'Nails', 'Shape/Weight'].toList(),
                        onChanged: (val) => setState(() => categoryValue = val),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 70,
                        textStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFFA19CA7),
                        ),
                        icon: Icon(
                          Icons.face_retouching_natural,
                          size: 15,
                        ),
                        fillColor: Color(0xE2F7FAFC),
                        elevation: 0,
                        borderColor: FlutterFlowTheme.gray200,
                        borderWidth: 1,
                        borderRadius: 8,
                        margin: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        hidesUnderline: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                      child: TextFormField(
                        controller: textController2,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Details',
                          labelStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFFA19CA7),
                          ),
                          hintText: 'Enter a description here...',
                          hintStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.tertiaryColor,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x865B535D),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x865B535D),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Color(0xE2F7FAFC),
                        ),
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFFA19CA7),
                        ),
                        textAlign: TextAlign.start,
                        maxLines: 3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: FlutterFlowDropDown(
                        initialOption: everyValue1 ??= 'Daily',
                        options: ['Daily', 'Weekly', 'Monthly'].toList(),
                        onChanged: (val) => setState(() => everyValue1 = val),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 70,
                        textStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFFA19CA7),
                        ),
                        icon: Icon(
                          Icons.calendar_today,
                          size: 15,
                        ),
                        fillColor: Color(0xE2F7FAFC),
                        elevation: 0,
                        borderColor: FlutterFlowTheme.gray200,
                        borderWidth: 1,
                        borderRadius: 8,
                        margin: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        hidesUnderline: true,
                      ),
                    ),
                    if ((everyValue1) == 'Weekly')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: FlutterFlowDropDown(
                          options: [
                            'Monday',
                            'Tuesday',
                            'Wednesday',
                            'Thursday',
                            'Friday',
                            'Saturday',
                            'Sunday'
                          ].toList(),
                          onChanged: (val) => setState(() => everyValue2 = val),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 70,
                          textStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFFA19CA7),
                          ),
                          hintText: 'Day of the week',
                          icon: Icon(
                            Icons.date_range_outlined,
                            size: 15,
                          ),
                          fillColor: Color(0xE2F7FAFC),
                          elevation: 0,
                          borderColor: FlutterFlowTheme.gray200,
                          borderWidth: 1,
                          borderRadius: 8,
                          margin: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          hidesUnderline: true,
                        ),
                      ),
                    if ((everyValue1) == 'Monthly')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: FlutterFlowDropDown(
                          options: [
                            '1',
                            '2',
                            '3',
                            '4',
                            '5',
                            '6',
                            '7',
                            '8',
                            '9',
                            '10',
                            '11',
                            '12',
                            '13',
                            '14',
                            '15',
                            '16',
                            '17',
                            '18',
                            '19',
                            '20',
                            '21',
                            '22',
                            '23',
                            '24',
                            '25',
                            '26',
                            '27',
                            '28',
                            '29',
                            '30',
                            '31'
                          ].toList(),
                          onChanged: (val) => setState(() => everyValue3 = val),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 70,
                          textStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFFA19CA7),
                          ),
                          hintText: 'Day in the Month',
                          icon: Icon(
                            Icons.date_range_outlined,
                            size: 15,
                          ),
                          fillColor: Color(0xE2F7FAFC),
                          elevation: 0,
                          borderColor: FlutterFlowTheme.gray200,
                          borderWidth: 1,
                          borderRadius: 8,
                          margin: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          hidesUnderline: true,
                        ),
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: FlutterFlowDropDown(
                        initialOption: timeValue ??= '1:00am',
                        options: [
                          '1:00am',
                          '2:00am',
                          '3:00am',
                          '4:00am',
                          '5:00am',
                          '6:00am',
                          '7:00am',
                          '8:00am',
                          '9:00am',
                          '10:00am',
                          '11:00am',
                          '12:00am',
                          '1:00pm',
                          '2:00pm',
                          '3:00pm',
                          '4:00pm',
                          '5:00pm',
                          '6:00pm',
                          '7:00pm',
                          '8:00pm',
                          '9:00pm',
                          '10:00pm',
                          '11:00pm',
                          '12:00pm'
                        ].toList(),
                        onChanged: (val) => setState(() => timeValue = val),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 70,
                        textStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFFA19CA7),
                        ),
                        icon: FaIcon(
                          FontAwesomeIcons.clock,
                        ),
                        fillColor: Color(0xE2F7FAFC),
                        elevation: 0,
                        borderColor: FlutterFlowTheme.gray200,
                        borderWidth: 1,
                        borderRadius: 8,
                        margin: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        hidesUnderline: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: FlutterFlowDropDown(
                        options: [
                          'No Brand',
                          'Avène',
                          'Avon',
                          'Axe',
                          'Cetaphil',
                          'Clinique',
                          'Dove',
                          'Drug store',
                          'Garnier',
                          'Gillette',
                          'Head & Shoulders',
                          'L’Oreal',
                          'La Roche-Posay',
                          'M.A.C.',
                          'Maybelline New York',
                          'Neutrogena',
                          'Nivea',
                          'Olay',
                          'Oriflame',
                          'P&G',
                          'Pantene',
                          'Schwarzkopf',
                          'The Ordinary'
                        ].toList(),
                        onChanged: (val) => setState(() => everyValue4 = val),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 70,
                        textStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFFA19CA7),
                        ),
                        hintText: 'Brand',
                        icon: Icon(
                          Icons.add_business_sharp,
                          size: 15,
                        ),
                        fillColor: Color(0xE2F7FAFC),
                        elevation: 0,
                        borderColor: FlutterFlowTheme.gray200,
                        borderWidth: 1,
                        borderRadius: 8,
                        margin: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        hidesUnderline: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                      child: InkWell(
                        onTap: () async {
                          await DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            onConfirm: (date) {
                              setState(() => datePicked = date);
                            },
                            currentTime: getCurrentTimestamp,
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.92,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0x19C8C4CD),
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 2),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 6, 0, 0),
                                  child: Text(
                                    'Acheive Tartget By (Optional)',
                                    style: FlutterFlowTheme.bodyText1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 0),
                                  child: Text(
                                    dateTimeFormat('MMMEd', datePicked),
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFFA19CA7),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NavBarPage(initialPage: 'Dashboard'),
                                ),
                                (r) => false,
                              );
                            },
                            text: 'Skip',
                            options: FFButtonOptions(
                              width: 130,
                              height: 50,
                              color: Color(0xE2F7FAFC),
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xA51D1D1E),
                              ),
                              elevation: 0,
                              borderSide: BorderSide(
                                color: Color(0xC3D4D1D9),
                                width: 1,
                              ),
                              borderRadius: 8,
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              final toDoListCreateData =
                                  createToDoListRecordData(
                                toDoName: textController1.text,
                                toDoDescription: textController2.text,
                                toDoDate: datePicked,
                                toDoState: false,
                                every: everyValue1,
                                time: timeValue,
                                category: categoryValue,
                                owner: currentUserReference,
                                brand: everyValue4,
                                dayWeek: everyValue2,
                                dayMonth: everyValue3,
                              );
                              await ToDoListRecord.collection
                                  .doc()
                                  .set(toDoListCreateData);
                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NavBarPage(initialPage: 'Dashboard'),
                                ),
                                (r) => false,
                              );
                            },
                            text: 'Create Task',
                            options: FFButtonOptions(
                              width: 130,
                              height: 45,
                              color: FlutterFlowTheme.secondaryColor,
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.tertiaryColor,
                              ),
                              elevation: 0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 80,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

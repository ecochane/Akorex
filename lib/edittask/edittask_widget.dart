import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EdittaskWidget extends StatefulWidget {
  const EdittaskWidget({
    Key key,
    this.edittask,
  }) : super(key: key);

  final ToDoListRecord edittask;

  @override
  _EdittaskWidgetState createState() => _EdittaskWidgetState();
}

class _EdittaskWidgetState extends State<EdittaskWidget> {
  DateTime datePicked;
  String categoryValue;
  TextEditingController textController1;
  TextEditingController textController2;
  String everyValue1;
  String timeValue;
  String everyValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xE2F7FAFC),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 46,
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
            size: 24,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Task',
          style: FlutterFlowTheme.title2.override(
            fontFamily: 'Lexend Deca',
            color: Color(0xFF2E3132),
            fontSize: 20,
          ),
        ),
        actions: [],
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
              StreamBuilder<ToDoListRecord>(
                stream: ToDoListRecord.getDocument(widget.edittask.reference),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.primaryColor,
                        ),
                      ),
                    );
                  }
                  final columnToDoListRecord = snapshot.data;
                  return SingleChildScrollView(
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
                                  'Fill out the details below to edit your routine task.',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xB34E5252),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                          child: TextFormField(
                            controller: textController1,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: columnToDoListRecord.toDoName,
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0x89282929),
                              ),
                              hintText: 'Enter your task here....',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.tertiaryColor,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x979CA5A7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x979CA5A7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Color(0xE2F7FAFC),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xE28C9297),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: FlutterFlowDropDown(
                            initialOption: categoryValue ??=
                                columnToDoListRecord.category,
                            options: ['Skin', 'Hair', 'Nails', 'Shape/Weight']
                                .toList(),
                            onChanged: (val) =>
                                setState(() => categoryValue = val),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 70,
                            textStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0x95200129),
                            ),
                            icon: Icon(
                              Icons.face_retouching_natural,
                              size: 15,
                            ),
                            fillColor: Color(0xFFF5F5F5),
                            elevation: 0,
                            borderColor: FlutterFlowTheme.gray200,
                            borderWidth: 1,
                            borderRadius: 8,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            hidesUnderline: true,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                          child: TextFormField(
                            controller: textController2 ??=
                                TextEditingController(
                              text: columnToDoListRecord.toDoDescription,
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Details',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0x86200129),
                              ),
                              hintText: 'Enter a description here...',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.tertiaryColor,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x979CA5A7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x979CA5A7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Color(0xE2F7FAFC),
                            ),
                            style: FlutterFlowTheme.bodyText1,
                            textAlign: TextAlign.start,
                            maxLines: 3,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: FlutterFlowDropDown(
                            initialOption: everyValue1 ??=
                                columnToDoListRecord.every,
                            options: ['Daily', 'Weekly', 'Monthly'].toList(),
                            onChanged: (val) =>
                                setState(() => everyValue1 = val),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 70,
                            textStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0x95200129),
                            ),
                            icon: Icon(
                              Icons.calendar_today,
                              size: 15,
                            ),
                            fillColor: Color(0xFFF5F5F5),
                            elevation: 0,
                            borderColor: FlutterFlowTheme.gray200,
                            borderWidth: 1,
                            borderRadius: 8,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            hidesUnderline: true,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: FlutterFlowDropDown(
                            initialOption: timeValue ??=
                                columnToDoListRecord.time,
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
                              color: Color(0x95200129),
                            ),
                            icon: FaIcon(
                              FontAwesomeIcons.clock,
                            ),
                            fillColor: Color(0xFFF5F5F5),
                            elevation: 0,
                            borderColor: FlutterFlowTheme.gray200,
                            borderWidth: 1,
                            borderRadius: 8,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            hidesUnderline: true,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: FlutterFlowDropDown(
                            initialOption: everyValue2 ??=
                                widget.edittask.brand,
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
                              'The Ordinary',
                              'Other'
                            ].toList(),
                            onChanged: (val) =>
                                setState(() => everyValue2 = val),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 70,
                            textStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFFA19CA7),
                            ),
                            icon: Icon(
                              Icons.add_business_sharp,
                              size: 15,
                            ),
                            fillColor: Color(0xE2F7FAFC),
                            elevation: 0,
                            borderColor: FlutterFlowTheme.gray200,
                            borderWidth: 1,
                            borderRadius: 8,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            hidesUnderline: true,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
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
                                  color: Color(0xFFA4A8A8),
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 2, 0, 2),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 6, 0, 0),
                                      child: Text(
                                        'Acheive Tartget By',
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: Text(
                                        dateTimeFormat('MMMMEEEEd',
                                            columnToDoListRecord.toDoDate),
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xB34E5252),
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                text: 'Cancel',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 45,
                                  color: Color(0xFFE6E6E5),
                                  textStyle:
                                      FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xA51D1D1E),
                                  ),
                                  elevation: 0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.gray200,
                                    width: 1,
                                  ),
                                  borderRadius: 8,
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  final toDoListUpdateData =
                                      createToDoListRecordData(
                                    toDoDate: datePicked,
                                    toDoName: textController1.text,
                                    toDoDescription:
                                        textController2?.text ?? '',
                                    every: everyValue1,
                                    time: timeValue,
                                    category: categoryValue,
                                    brand: everyValue2,
                                  );
                                  await columnToDoListRecord.reference
                                      .update(toDoListUpdateData);
                                  Navigator.pop(context);
                                },
                                text: 'Save Task',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 45,
                                  color: FlutterFlowTheme.secondaryColor,
                                  textStyle:
                                      FlutterFlowTheme.subtitle2.override(
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

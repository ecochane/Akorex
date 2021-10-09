import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EditWidget extends StatefulWidget {
  EditWidget({
    Key key,
    this.taskedit,
  }) : super(key: key);

  final ToDoListRecord taskedit;

  @override
  _EditWidgetState createState() => _EditWidgetState();
}

class _EditWidgetState extends State<EditWidget> {
  DateTime datePicked;
  String categoryValue;
  TextEditingController textController1;
  TextEditingController textController2;
  String everyValue;
  String timeValue;
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
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
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: StreamBuilder<ToDoListRecord>(
          stream: ToDoListRecord.getDocument(widget.taskedit.reference),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: Color(0xFFEFDF04),
                  ),
                ),
              );
            }
            final columnToDoListRecord = snapshot.data;
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Edit Task',
                        style: FlutterFlowTheme.title2.override(
                          fontFamily: 'Quicksand',
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          'Fill out the details below to edit your routine task.',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lato',
                            color: Color(0x95200129),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                  child: TextFormField(
                    controller: textController1,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: columnToDoListRecord.toDoName,
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lato',
                        color: Color(0x55200129),
                      ),
                      hintText: 'Enter your task here....',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lato',
                        color: FlutterFlowTheme.tertiaryColor,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x86200129),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x86200129),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: FlutterFlowDropDown(
                    options: ['Skin', 'Hair', 'Nails', 'Shape/Weight'].toList(),
                    onChanged: (val) => setState(() => categoryValue = val),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 70,
                    textStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lato',
                      color: Color(0x95200129),
                    ),
                    icon: Icon(
                      Icons.face_retouching_natural,
                      size: 15,
                    ),
                    fillColor: Color(0xFFF5F5F5),
                    elevation: 0,
                    borderColor: FlutterFlowTheme.primaryColor,
                    borderWidth: 1,
                    borderRadius: 8,
                    margin: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    hidesUnderline: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                  child: TextFormField(
                    controller: textController2 ??= TextEditingController(
                      text: columnToDoListRecord.toDoDescription,
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Details',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lato',
                        color: Color(0x86200129),
                      ),
                      hintText: 'Enter a description here...',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lato',
                        color: FlutterFlowTheme.tertiaryColor,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x86200129),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x86200129),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lato',
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 3,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: FlutterFlowDropDown(
                    options: ['Daily', 'Weekly', 'Monthly'].toList(),
                    onChanged: (val) => setState(() => everyValue = val),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 70,
                    textStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lato',
                      color: Color(0x95200129),
                    ),
                    icon: Icon(
                      Icons.calendar_today,
                      size: 15,
                    ),
                    fillColor: Color(0xFFF5F5F5),
                    elevation: 0,
                    borderColor: FlutterFlowTheme.primaryColor,
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
                      fontFamily: 'Lato',
                      color: Color(0x95200129),
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.clock,
                    ),
                    fillColor: Color(0xFFF5F5F5),
                    elevation: 0,
                    borderColor: FlutterFlowTheme.primaryColor,
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
                        currentTime: DateTime.now(),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.92,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color(0x86200129),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 2),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                              child: Text(
                                'Acheive Tartget By',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lato',
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Text(
                                dateTimeFormat(
                                    'MMMMEEEEd', columnToDoListRecord.toDoDate),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lato',
                                  color: Color(0x86200129),
                                ),
                              ),
                            )
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
                          setState(() => _loadingButton1 = true);
                          try {
                            Navigator.pop(context);
                          } finally {
                            setState(() => _loadingButton1 = false);
                          }
                        },
                        text: 'Cancel',
                        options: FFButtonOptions(
                          width: 130,
                          height: 50,
                          color: Color(0x86200129),
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Quicksand',
                            color: Colors.white,
                          ),
                          elevation: 0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 25,
                        ),
                        loading: _loadingButton1,
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          setState(() => _loadingButton2 = true);
                          try {
                            final toDoListUpdateData = createToDoListRecordData(
                              toDoDate: datePicked,
                              toDoName: textController1.text,
                              toDoDescription: textController2?.text ?? '',
                              every: everyValue,
                              time: timeValue,
                              category: categoryValue,
                            );
                            await columnToDoListRecord.reference
                                .update(toDoListUpdateData);
                            Navigator.pop(context);
                          } finally {
                            setState(() => _loadingButton2 = false);
                          }
                        },
                        text: 'Save Task',
                        options: FFButtonOptions(
                          width: 130,
                          height: 50,
                          color: FlutterFlowTheme.primaryColor,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Quicksand',
                            color: Color(0xFF332D34),
                          ),
                          elevation: 0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 25,
                        ),
                        loading: _loadingButton2,
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

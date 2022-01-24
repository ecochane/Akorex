import '../backend/backend.dart';
import '../edittask/edittask_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsCopyWidget extends StatefulWidget {
  const DetailsCopyWidget({
    Key key,
    this.taskdetails,
  }) : super(key: key);

  final ToDoListRecord taskdetails;

  @override
  _DetailsCopyWidgetState createState() => _DetailsCopyWidgetState();
}

class _DetailsCopyWidgetState extends State<DetailsCopyWidget>
    with TickerProviderStateMixin {
  DateTimeRange calendarSelectedDay;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 51),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 60),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 51),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 58),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 60),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'stackOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 78),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 29),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.background,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/Untitled_design_(13).png',
            ).image,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 50, 24, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Task Details',
                        style: FlutterFlowTheme.bodyText2.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF909293),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.taskdetails.toDoName,
                        style: FlutterFlowTheme.title1.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.primaryDark,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 0,
                          buttonSize: 46,
                          fillColor: FlutterFlowTheme.primaryColor,
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 30),
                  child: FlutterFlowCalendar(
                    color: FlutterFlowTheme.primaryColor,
                    weekFormat: true,
                    weekStartsMonday: false,
                    onChange: (DateTimeRange newSelectedDate) {
                      setState(() => calendarSelectedDay = newSelectedDate);
                    },
                    titleStyle: TextStyle(),
                    dayOfWeekStyle: TextStyle(),
                    dateStyle: TextStyle(),
                    selectedDateStyle: TextStyle(),
                    inactiveDateStyle: TextStyle(),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      widget.taskdetails.time,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        'Lexend Deca',
                        color: FlutterFlowTheme.dark600,
                        fontWeight: FontWeight.w100,
                        fontSize: 42,
                      ),
                    ).animated([animationsMap['textOnPageLoadAnimation']]),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        'GMT',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF474A4B),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ).animated([animationsMap['rowOnPageLoadAnimation1']]),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        widget.taskdetails.toDoDescription,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF727578),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ).animated([animationsMap['rowOnPageLoadAnimation2']]),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Color(0xC4D3D4D4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 16,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ).animated([animationsMap['rowOnPageLoadAnimation3']]),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Text(
                              'Category',
                              style: FlutterFlowTheme.bodyText2.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF8B97A2),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Text(
                            widget.taskdetails.category,
                            style: FlutterFlowTheme.title1.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.primaryDark,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Text(
                              'Frequency',
                              style: FlutterFlowTheme.bodyText2.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF8B97A2),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Text(
                            widget.taskdetails.every,
                            style: FlutterFlowTheme.title1.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.primaryDark,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Text(
                              'Status',
                              style: FlutterFlowTheme.bodyText2.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF8B97A2),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Text(
                            'Active',
                            style: FlutterFlowTheme.title1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF574C5C),
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ).animated([animationsMap['rowOnPageLoadAnimation4']]),
                ),
                Container(
                  height: 200,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 50, 10, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Color(0xBBEAF0F0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 5),
                                    child: Text(
                                      'Complete for this week',
                                      style:
                                          FlutterFlowTheme.subtitle1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.dark600,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 8, 16, 0),
                                      child: Text(
                                        ' ',
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xB3FFFFFF),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 6, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EdittaskWidget(
                                              edittask: widget.taskdetails,
                                            ),
                                          ),
                                        );
                                      },
                                      text: 'Edit',
                                      icon: Icon(
                                        Icons.edit_outlined,
                                        size: 15,
                                      ),
                                      options: FFButtonOptions(
                                        width: 100,
                                        height: 40,
                                        color: Color(0x58FFFFFF),
                                        textStyle:
                                            FlutterFlowTheme.subtitle2.override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.dark600,
                                        ),
                                        elevation: 0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0,
                                        ),
                                        borderRadius: 25,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 16, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await widget.taskdetails.reference
                                            .delete();
                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => NavBarPage(
                                                initialPage: 'Dashboard'),
                                          ),
                                          (r) => false,
                                        );
                                      },
                                      text: 'Delete Task',
                                      icon: Icon(
                                        Icons.delete_sweep_rounded,
                                        size: 15,
                                      ),
                                      options: FFButtonOptions(
                                        width: 160,
                                        height: 50,
                                        color: Color(0x20FFFFFF),
                                        textStyle:
                                            FlutterFlowTheme.subtitle2.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFFFA4C0C),
                                        ),
                                        elevation: 0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0,
                                        ),
                                        borderRadius: 25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, -0.75),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Color(0xFF1DAF89),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 7,
                                color: Color(0x8E000000),
                                offset: Offset(0, 3),
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.check_outlined,
                            color: Colors.white,
                            size: 50,
                          ),
                        ).animated(
                            [animationsMap['containerOnPageLoadAnimation']]),
                      ),
                    ],
                  ),
                ).animated([animationsMap['stackOnPageLoadAnimation']]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

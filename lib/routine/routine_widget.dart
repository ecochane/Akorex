import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../details/details_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../tips/tips_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class RoutineWidget extends StatefulWidget {
  RoutineWidget({Key key}) : super(key: key);

  @override
  _RoutineWidgetState createState() => _RoutineWidgetState();
}

class _RoutineWidgetState extends State<RoutineWidget>
    with TickerProviderStateMixin {
  DateTimeRange calendarSelectedDay;
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  bool _loadingButton3 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'calendarOnPageLoadAnimation': AnimationInfo(
      curve: Curves.easeIn,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
    ),
    'tabBarOnPageLoadAnimation': AnimationInfo(
      curve: Curves.easeIn,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
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
      appBar: AppBar(
        backgroundColor: Color(0xFF1B0434),
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.face_unlock_rounded,
            color: Colors.white,
            size: 28,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavBarPage(initialPage: 'ProfilePage'),
              ),
            );
          },
        ),
        title: Text(
          'Self Care Routine',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Lato',
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 15, 0),
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TipsWidget(),
                  ),
                );
              },
              child: FaIcon(
                FontAwesomeIcons.leaf,
                color: Colors.white,
                size: 20,
              ),
            ),
          )
        ],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 8,
        child: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.playlist_add,
            color: Color(0xFF332D34),
            size: 30,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavBarPage(initialPage: 'addtask'),
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.18,
                decoration: BoxDecoration(
                  color: Color(0xFF1B0434),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: Image.asset(
                      'assets/images/White_and_Blue_Multicolored_Earth_Day_Zoom_Virtual_Background_(4).png',
                    ).image,
                  ),
                  border: Border.all(
                    color: Color(0xFF523071),
                    width: 0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.9, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: FlutterFlowTheme.primaryColor,
                                    width: 3,
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.9, 0),
                                  child: AuthUserStreamWidget(
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => NavBarPage(
                                                initialPage: 'ProfilePage'),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            currentUserPhoto,
                                            'https://www.kindpng.com/picc/m/24-248273_profile-image-png-of-a-woman-female-profile.png',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 7, 0, 0),
                        child: AuthUserStreamWidget(
                          child: Text(
                            'Hi   ${currentUserDisplayName}!',
                            style: FlutterFlowTheme.title1.override(
                              fontFamily: 'Raleway',
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: Image.asset(
                    'assets/images/Untitled_design_(2).png',
                  ).image,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(40, 0, 20, 0),
                child: FlutterFlowCalendar(
                  color: FlutterFlowTheme.primaryColor,
                  iconColor: FlutterFlowTheme.primaryColor,
                  weekFormat: true,
                  weekStartsMonday: true,
                  onChange: (DateTimeRange newSelectedDate) {
                    setState(() => calendarSelectedDay = newSelectedDate);
                  },
                  titleStyle: GoogleFonts.getFont(
                    'Raleway',
                    color: Color(0xFF38155E),
                  ),
                  dayOfWeekStyle: GoogleFonts.getFont(
                    'Raleway',
                    color: FlutterFlowTheme.primaryColor,
                  ),
                  dateStyle: GoogleFonts.getFont(
                    'Raleway',
                  ),
                  selectedDateStyle: GoogleFonts.getFont(
                    'Raleway',
                  ),
                  inactiveDateStyle: TextStyle(
                    color: Color(0xFF38155E),
                  ),
                ).animated([animationsMap['calendarOnPageLoadAnimation']]),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 0),
                child: DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: Color(0xEA251339),
                        unselectedLabelColor: Color(0xEA250E3D),
                        indicatorColor: Color(0x55EFDF04),
                        indicatorWeight: 1,
                        tabs: [
                          Tab(
                            text: 'Daily',
                            icon: FaIcon(
                              FontAwesomeIcons.calendarDay,
                            ),
                          ),
                          Tab(
                            text: 'Weekly',
                            icon: FaIcon(
                              FontAwesomeIcons.calendarWeek,
                            ),
                          ),
                          Tab(
                            text: 'Monthly',
                            icon: FaIcon(
                              FontAwesomeIcons.solidCalendar,
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 60, 40, 2),
                              child: StreamBuilder<List<ToDoListRecord>>(
                                stream: queryToDoListRecord(
                                  queryBuilder: (toDoListRecord) =>
                                      toDoListRecord
                                          .where('every', isEqualTo: 'Daily')
                                          .where('toDoState', isEqualTo: false)
                                          .where('owner',
                                              isEqualTo: currentUserReference),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<ToDoListRecord>
                                      listViewToDoListRecordList =
                                      snapshot.data;
                                  if (listViewToDoListRecordList.isEmpty) {
                                    return Center(
                                      child: Image.asset(
                                        'assets/images/output-onlinegiftools_(1).gif',
                                      ),
                                    );
                                  }
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewToDoListRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewToDoListRecord =
                                          listViewToDoListRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 40),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Color(0x65090F13),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.asset(
                                                'assets/images/Brown_Pink_Cosmetics_Women\\\'s_Beauty_Business_Instagram_Post.png',
                                              ).image,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF2D1547),
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 2),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16, 16, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              listViewToDoListRecord
                                                                  .toDoName,
                                                              style:
                                                                  FlutterFlowTheme
                                                                      .title2
                                                                      .override(
                                                                fontFamily:
                                                                    'Quicksand',
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            12,
                                                                            0),
                                                                child:
                                                                    ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                                                    final toDoListUpdateData =
                                                                        createToDoListRecordData(
                                                                      toDoState:
                                                                          !listViewToDoListRecord
                                                                              .toDoState,
                                                                    );
                                                                    await listViewToDoListRecord
                                                                        .reference
                                                                        .update(
                                                                            toDoListUpdateData);
                                                                  },
                                                                  value: listViewToDoListRecord
                                                                      .toDoState,
                                                                  onIcon: Icon(
                                                                    Icons
                                                                        .check_circle,
                                                                    color: FlutterFlowTheme
                                                                        .primaryColor,
                                                                    size: 25,
                                                                  ),
                                                                  offIcon: Icon(
                                                                    Icons
                                                                        .check_circle_outline,
                                                                    color: FlutterFlowTheme
                                                                        .primaryColor,
                                                                    size: 25,
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 4,
                                                                  16, 16),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              setState(() =>
                                                                  _loadingButton1 =
                                                                      true);
                                                              try {
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            DetailsWidget(
                                                                      taskdetails:
                                                                          listViewToDoListRecord,
                                                                    ),
                                                                  ),
                                                                );
                                                              } finally {
                                                                setState(() =>
                                                                    _loadingButton1 =
                                                                        false);
                                                              }
                                                            },
                                                            text: 'Task',
                                                            icon: Icon(
                                                              Icons
                                                                  .playlist_add_check_outlined,
                                                              size: 15,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 120,
                                                              height: 40,
                                                              color:
                                                                  Colors.white,
                                                              textStyle:
                                                                  GoogleFonts
                                                                      .getFont(
                                                                'Lexend Deca',
                                                                color: Color(
                                                                    0xDF7F6289),
                                                                fontSize: 14,
                                                              ),
                                                              elevation: 3,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1,
                                                              ),
                                                              borderRadius: 8,
                                                            ),
                                                            loading:
                                                                _loadingButton1,
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          1),
                                                                  child: Text(
                                                                    listViewToDoListRecord
                                                                        .time,
                                                                    style: FlutterFlowTheme
                                                                        .title3
                                                                        .override(
                                                                      fontFamily:
                                                                          'Lexend Deca',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  listViewToDoListRecord
                                                                      .category,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme
                                                                      .bodyText1
                                                                      .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: FlutterFlowTheme
                                                                        .primaryColor,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 20, 20, 2),
                              child: StreamBuilder<List<ToDoListRecord>>(
                                stream: queryToDoListRecord(
                                  queryBuilder: (toDoListRecord) =>
                                      toDoListRecord
                                          .where('every', isEqualTo: 'Weekly')
                                          .where('toDoState', isEqualTo: false)
                                          .where('owner',
                                              isEqualTo: currentUserReference),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<ToDoListRecord>
                                      listViewToDoListRecordList =
                                      snapshot.data;
                                  if (listViewToDoListRecordList.isEmpty) {
                                    return Center(
                                      child: Image.asset(
                                        'assets/images/output-onlinegiftools_(1).gif',
                                      ),
                                    );
                                  }
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewToDoListRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewToDoListRecord =
                                          listViewToDoListRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 20),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Color(0x65090F13),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.asset(
                                                'assets/images/Brown_Pink_Cosmetics_Women\\\'s_Beauty_Business_Instagram_Post.png',
                                              ).image,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: Color(0xB91C0125),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 2),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16, 16, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              listViewToDoListRecord
                                                                  .toDoName,
                                                              style:
                                                                  FlutterFlowTheme
                                                                      .title2
                                                                      .override(
                                                                fontFamily:
                                                                    'Quicksand',
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            12,
                                                                            0),
                                                                child:
                                                                    ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                                                    final toDoListUpdateData =
                                                                        createToDoListRecordData(
                                                                      toDoState:
                                                                          !listViewToDoListRecord
                                                                              .toDoState,
                                                                    );
                                                                    await listViewToDoListRecord
                                                                        .reference
                                                                        .update(
                                                                            toDoListUpdateData);
                                                                  },
                                                                  value: listViewToDoListRecord
                                                                      .toDoState,
                                                                  onIcon: Icon(
                                                                    Icons
                                                                        .check_circle,
                                                                    color: FlutterFlowTheme
                                                                        .primaryColor,
                                                                    size: 25,
                                                                  ),
                                                                  offIcon: Icon(
                                                                    Icons
                                                                        .check_circle_outline,
                                                                    color: FlutterFlowTheme
                                                                        .primaryColor,
                                                                    size: 25,
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 4,
                                                                  16, 16),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              setState(() =>
                                                                  _loadingButton2 =
                                                                      true);
                                                              try {
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            DetailsWidget(
                                                                      taskdetails:
                                                                          listViewToDoListRecord,
                                                                    ),
                                                                  ),
                                                                );
                                                              } finally {
                                                                setState(() =>
                                                                    _loadingButton2 =
                                                                        false);
                                                              }
                                                            },
                                                            text: 'Task',
                                                            icon: Icon(
                                                              Icons
                                                                  .playlist_add_check_outlined,
                                                              size: 15,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 120,
                                                              height: 40,
                                                              color:
                                                                  Colors.white,
                                                              textStyle:
                                                                  GoogleFonts
                                                                      .getFont(
                                                                'Lexend Deca',
                                                                color: Color(
                                                                    0xDF7F6289),
                                                                fontSize: 14,
                                                              ),
                                                              elevation: 3,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1,
                                                              ),
                                                              borderRadius: 8,
                                                            ),
                                                            loading:
                                                                _loadingButton2,
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          1),
                                                                  child: Text(
                                                                    listViewToDoListRecord
                                                                        .time,
                                                                    style: FlutterFlowTheme
                                                                        .title3
                                                                        .override(
                                                                      fontFamily:
                                                                          'Lexend Deca',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  listViewToDoListRecord
                                                                      .category,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme
                                                                      .bodyText1
                                                                      .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: FlutterFlowTheme
                                                                        .primaryColor,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(30, 20, 13, 2),
                              child: StreamBuilder<List<ToDoListRecord>>(
                                stream: queryToDoListRecord(
                                  queryBuilder: (toDoListRecord) =>
                                      toDoListRecord
                                          .where('every', isEqualTo: 'Monthly')
                                          .where('toDoState', isEqualTo: false)
                                          .where('owner',
                                              isEqualTo: currentUserReference),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<ToDoListRecord>
                                      listViewToDoListRecordList =
                                      snapshot.data;
                                  if (listViewToDoListRecordList.isEmpty) {
                                    return Center(
                                      child: Image.asset(
                                        'assets/images/output-onlinegiftools_(1).gif',
                                      ),
                                    );
                                  }
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewToDoListRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewToDoListRecord =
                                          listViewToDoListRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 20),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Color(0x65090F13),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.asset(
                                                'assets/images/Brown_Pink_Cosmetics_Women\\\'s_Beauty_Business_Instagram_Post.png',
                                              ).image,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: Color(0xB91C0125),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 2),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16, 16, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              listViewToDoListRecord
                                                                  .toDoName,
                                                              style:
                                                                  FlutterFlowTheme
                                                                      .title2
                                                                      .override(
                                                                fontFamily:
                                                                    'Quicksand',
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            12,
                                                                            0),
                                                                child:
                                                                    ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                                                    final toDoListUpdateData =
                                                                        createToDoListRecordData(
                                                                      toDoState:
                                                                          !listViewToDoListRecord
                                                                              .toDoState,
                                                                    );
                                                                    await listViewToDoListRecord
                                                                        .reference
                                                                        .update(
                                                                            toDoListUpdateData);
                                                                  },
                                                                  value: listViewToDoListRecord
                                                                      .toDoState,
                                                                  onIcon: Icon(
                                                                    Icons
                                                                        .check_circle,
                                                                    color: FlutterFlowTheme
                                                                        .primaryColor,
                                                                    size: 25,
                                                                  ),
                                                                  offIcon: Icon(
                                                                    Icons
                                                                        .check_circle_outline,
                                                                    color: FlutterFlowTheme
                                                                        .primaryColor,
                                                                    size: 25,
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 4,
                                                                  16, 16),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              setState(() =>
                                                                  _loadingButton3 =
                                                                      true);
                                                              try {
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            DetailsWidget(
                                                                      taskdetails:
                                                                          listViewToDoListRecord,
                                                                    ),
                                                                  ),
                                                                );
                                                              } finally {
                                                                setState(() =>
                                                                    _loadingButton3 =
                                                                        false);
                                                              }
                                                            },
                                                            text: 'Task',
                                                            icon: Icon(
                                                              Icons
                                                                  .playlist_add_check_outlined,
                                                              size: 15,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 120,
                                                              height: 40,
                                                              color:
                                                                  Colors.white,
                                                              textStyle:
                                                                  GoogleFonts
                                                                      .getFont(
                                                                'Lexend Deca',
                                                                color: Color(
                                                                    0xDF7F6289),
                                                                fontSize: 14,
                                                              ),
                                                              elevation: 3,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1,
                                                              ),
                                                              borderRadius: 8,
                                                            ),
                                                            loading:
                                                                _loadingButton3,
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          1),
                                                                  child: Text(
                                                                    listViewToDoListRecord
                                                                        .time,
                                                                    style: FlutterFlowTheme
                                                                        .title3
                                                                        .override(
                                                                      fontFamily:
                                                                          'Lexend Deca',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  listViewToDoListRecord
                                                                      .category,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme
                                                                      .bodyText1
                                                                      .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: FlutterFlowTheme
                                                                        .primaryColor,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ).animated([animationsMap['tabBarOnPageLoadAnimation']]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

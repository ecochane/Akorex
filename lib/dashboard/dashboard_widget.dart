import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../details/details_widget.dart';
import '../details_copy/details_copy_widget.dart';
import '../details_copy2/details_copy2_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key key}) : super(key: key);

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget>
    with TickerProviderStateMixin {
  DateTimeRange calendarSelectedDay;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'tabBarOnPageLoadAnimation': AnimationInfo(
      curve: Curves.easeIn,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
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
      backgroundColor: Color(0xFFF3FDFF),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFFAFFFF),
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: Image.asset(
              'assets/images/Untitled_design_(12).png',
            ).image,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.primaryColor,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                        child: AuthUserStreamWidget(
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NavBarPage(initialPage: 'profilePage'),
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
                                  'https://firebasestorage.googleapis.com/v0/b/akorex-selfcare.appspot.com/o/124427555-person-gray-photo-placeholder-woman-in-shirt-on-white-background.jpg?alt=media&token=25b53984-e173-4da4-86c5-a6a5799cbd1d',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Image.asset(
                        'assets/images/Akorex-removebg-preview.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                      child: Text(
                        ' Hello!',
                        style: FlutterFlowTheme.title1.override(
                          fontFamily: 'Lexend Deca',
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                                child: AuthUserStreamWidget(
                                  child: Text(
                                    currentUserDisplayName,
                                    style: FlutterFlowTheme.title2.override(
                                      fontFamily: 'Lexend Deca',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: Image.asset(
                                  'assets/images/waving-hand-sign_emoji-modifier-fitzpatrick-type-5_1f44b_1f3fe.png',
                                  width: 26,
                                  height: 26,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: Text(
                        ' Your routine dashboard',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF484849),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 6, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(3, 12, 0, 0),
                          child: InkWell(
                            onTap: () async {
                              await launchURL('tel:1234567890');
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Color(0xFF1DACAF),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            NavBarPage(initialPage: 'homePage'),
                                      ),
                                      (r) => false,
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 20,
                                        borderWidth: 1,
                                        buttonSize: 45,
                                        icon: Icon(
                                          Icons.people_outlined,
                                          color: FlutterFlowTheme.tertiaryColor,
                                          size: 24,
                                        ),
                                        onPressed: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => NavBarPage(
                                                  initialPage: 'homePage'),
                                            ),
                                          );
                                        },
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => NavBarPage(
                                                  initialPage: 'homePage'),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Share & Connect',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color:
                                                FlutterFlowTheme.tertiaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 8, 15, 0),
                child: FlutterFlowCalendar(
                  color: FlutterFlowTheme.primaryColor,
                  weekFormat: true,
                  weekStartsMonday: false,
                  onChange: (DateTimeRange newSelectedDate) {
                    setState(() => calendarSelectedDay = newSelectedDate);
                  },
                  titleStyle: TextStyle(
                    color: Color(0xFF131414),
                  ),
                  dayOfWeekStyle: TextStyle(
                    color: Color(0xFF313434),
                  ),
                  dateStyle: TextStyle(
                    color: Color(0xFF131414),
                  ),
                  selectedDateStyle: TextStyle(),
                  inactiveDateStyle: TextStyle(),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 900,
                    decoration: BoxDecoration(
                      color: Color(0xB3E8EEEE),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      border: Border.all(
                        color: Color(0xE2E2EAEA),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 10, 0),
                      child: DefaultTabController(
                        length: 3,
                        initialIndex: 0,
                        child: Column(
                          children: [
                            TabBar(
                              isScrollable: true,
                              labelColor: Color(0xEA030303),
                              unselectedLabelColor: Color(0xEA171818),
                              labelStyle: GoogleFonts.getFont(
                                'Roboto',
                              ),
                              indicatorColor: Color(0xFFD5D9D9),
                              indicatorWeight: 5,
                              tabs: [
                                Row(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.calendarAlt,
                                    ),
                                    Tab(
                                      text: '  Daily',
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.calendarMinus,
                                    ),
                                    Tab(
                                      text: '  Weekly',
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.calendar,
                                    ),
                                    Tab(
                                      text: '  Monthly',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 27, 20, 2),
                                    child: StreamBuilder<List<ToDoListRecord>>(
                                      stream: queryToDoListRecord(
                                        queryBuilder: (toDoListRecord) =>
                                            toDoListRecord
                                                .where('every',
                                                    isEqualTo: 'Daily')
                                                .where('toDoState',
                                                    isEqualTo: false)
                                                .where('owner',
                                                    isEqualTo:
                                                        currentUserReference),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 30,
                                              height: 30,
                                              child: CircularProgressIndicator(
                                                color: FlutterFlowTheme
                                                    .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        List<ToDoListRecord>
                                            listViewToDoListRecordList =
                                            snapshot.data;
                                        if (listViewToDoListRecordList
                                            .isEmpty) {
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
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewToDoListRecord =
                                                listViewToDoListRecordList[
                                                    listViewIndex];
                                            return Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 110,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: Image.asset(
                                                    'assets/images/heeeeee.png',
                                                  ).image,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(30, 0, 0, 10),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 1,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xDDFBFBFB),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFEBEFEF),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 2),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          6,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      listViewToDoListRecord
                                                                          .toDoName,
                                                                      style: FlutterFlowTheme
                                                                          .title2
                                                                          .override(
                                                                        fontFamily:
                                                                            'Lexend Deca',
                                                                        color: Color(
                                                                            0xFF151616),
                                                                        fontSize:
                                                                            17,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                                              toDoState: !listViewToDoListRecord.toDoState,
                                                                            );
                                                                            await listViewToDoListRecord.reference.update(toDoListUpdateData);
                                                                          },
                                                                          value:
                                                                              listViewToDoListRecord.toDoState,
                                                                          onIcon:
                                                                              Icon(
                                                                            Icons.check_circle,
                                                                            color:
                                                                                FlutterFlowTheme.primaryColor,
                                                                            size:
                                                                                25,
                                                                          ),
                                                                          offIcon:
                                                                              Icon(
                                                                            Icons.check_circle_outline,
                                                                            color:
                                                                                FlutterFlowTheme.primaryColor,
                                                                            size:
                                                                                25,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          4,
                                                                          16,
                                                                          16),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      await Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              DetailsWidget(
                                                                            taskdetails:
                                                                                listViewToDoListRecord,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                    text:
                                                                        'Details',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .double_arrow_rounded,
                                                                      size: 20,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          130,
                                                                      height:
                                                                          40,
                                                                      color: Color(
                                                                          0xB9F4F5F5),
                                                                      textStyle:
                                                                          GoogleFonts
                                                                              .getFont(
                                                                        'Lexend Deca',
                                                                        color: Color(
                                                                            0xDF575859),
                                                                        fontSize:
                                                                            14,
                                                                      ),
                                                                      elevation:
                                                                          1,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          20,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
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
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              1),
                                                                          child:
                                                                              Text(
                                                                            listViewToDoListRecord.time,
                                                                            style:
                                                                                FlutterFlowTheme.title3.override(
                                                                              fontFamily: 'Lexend Deca',
                                                                              color: Color(0xFF282A2A),
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          listViewToDoListRecord
                                                                              .category,
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme
                                                                              .bodyText1
                                                                              .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                FlutterFlowTheme.primaryColor,
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 27, 20, 2),
                                    child: StreamBuilder<List<ToDoListRecord>>(
                                      stream: queryToDoListRecord(
                                        queryBuilder: (toDoListRecord) =>
                                            toDoListRecord
                                                .where('every',
                                                    isEqualTo: 'Weekly')
                                                .where('toDoState',
                                                    isEqualTo: false)
                                                .where('owner',
                                                    isEqualTo:
                                                        currentUserReference),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 30,
                                              height: 30,
                                              child: CircularProgressIndicator(
                                                color: FlutterFlowTheme
                                                    .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        List<ToDoListRecord>
                                            listViewToDoListRecordList =
                                            snapshot.data;
                                        if (listViewToDoListRecordList
                                            .isEmpty) {
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
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewToDoListRecord =
                                                listViewToDoListRecordList[
                                                    listViewIndex];
                                            return Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 110,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: Image.asset(
                                                    'assets/images/heeeeee.png',
                                                  ).image,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(30, 0, 0, 14),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 1,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xDDFBFBFB),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFEBEFEF),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 2),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          6,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      listViewToDoListRecord
                                                                          .toDoName,
                                                                      style: FlutterFlowTheme
                                                                          .title2
                                                                          .override(
                                                                        fontFamily:
                                                                            'Lexend Deca',
                                                                        color: Color(
                                                                            0xFF151616),
                                                                        fontSize:
                                                                            17,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                                              toDoState: !listViewToDoListRecord.toDoState,
                                                                            );
                                                                            await listViewToDoListRecord.reference.update(toDoListUpdateData);
                                                                          },
                                                                          value:
                                                                              listViewToDoListRecord.toDoState,
                                                                          onIcon:
                                                                              Icon(
                                                                            Icons.check_circle,
                                                                            color:
                                                                                FlutterFlowTheme.primaryColor,
                                                                            size:
                                                                                25,
                                                                          ),
                                                                          offIcon:
                                                                              Icon(
                                                                            Icons.check_circle_outline,
                                                                            color:
                                                                                FlutterFlowTheme.primaryColor,
                                                                            size:
                                                                                25,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          4,
                                                                          16,
                                                                          16),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      await Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              DetailsCopyWidget(
                                                                            taskdetails:
                                                                                listViewToDoListRecord,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                    text:
                                                                        'Details',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .double_arrow_rounded,
                                                                      size: 20,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          130,
                                                                      height:
                                                                          40,
                                                                      color: Color(
                                                                          0xB9F4F5F5),
                                                                      textStyle:
                                                                          GoogleFonts
                                                                              .getFont(
                                                                        'Lexend Deca',
                                                                        color: Color(
                                                                            0xDF575859),
                                                                        fontSize:
                                                                            14,
                                                                      ),
                                                                      elevation:
                                                                          1,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          20,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
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
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              1),
                                                                          child:
                                                                              Text(
                                                                            listViewToDoListRecord.dayWeek,
                                                                            style:
                                                                                FlutterFlowTheme.title3.override(
                                                                              fontFamily: 'Lexend Deca',
                                                                              color: Color(0xFF282A2A),
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          listViewToDoListRecord
                                                                              .category,
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme
                                                                              .bodyText1
                                                                              .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                FlutterFlowTheme.primaryColor,
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 27, 20, 2),
                                    child: StreamBuilder<List<ToDoListRecord>>(
                                      stream: queryToDoListRecord(
                                        queryBuilder: (toDoListRecord) =>
                                            toDoListRecord
                                                .where('every',
                                                    isEqualTo: 'Daily')
                                                .where('toDoState',
                                                    isEqualTo: false)
                                                .where('owner',
                                                    isEqualTo:
                                                        currentUserReference),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 30,
                                              height: 30,
                                              child: CircularProgressIndicator(
                                                color: FlutterFlowTheme
                                                    .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        List<ToDoListRecord>
                                            listViewToDoListRecordList =
                                            snapshot.data;
                                        if (listViewToDoListRecordList
                                            .isEmpty) {
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
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewToDoListRecord =
                                                listViewToDoListRecordList[
                                                    listViewIndex];
                                            return Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 110,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: Image.asset(
                                                    'assets/images/heeeeee.png',
                                                  ).image,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(30, 0, 0, 14),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 1,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xDDFBFBFB),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFEBEFEF),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 2),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          6,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      listViewToDoListRecord
                                                                          .toDoName,
                                                                      style: FlutterFlowTheme
                                                                          .title2
                                                                          .override(
                                                                        fontFamily:
                                                                            'Lexend Deca',
                                                                        color: Color(
                                                                            0xFF151616),
                                                                        fontSize:
                                                                            17,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                                              toDoState: !listViewToDoListRecord.toDoState,
                                                                            );
                                                                            await listViewToDoListRecord.reference.update(toDoListUpdateData);
                                                                          },
                                                                          value:
                                                                              listViewToDoListRecord.toDoState,
                                                                          onIcon:
                                                                              Icon(
                                                                            Icons.check_circle,
                                                                            color:
                                                                                FlutterFlowTheme.primaryColor,
                                                                            size:
                                                                                25,
                                                                          ),
                                                                          offIcon:
                                                                              Icon(
                                                                            Icons.check_circle_outline,
                                                                            color:
                                                                                FlutterFlowTheme.primaryColor,
                                                                            size:
                                                                                25,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          4,
                                                                          16,
                                                                          16),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      await Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              DetailsCopy2Widget(
                                                                            taskdetails:
                                                                                listViewToDoListRecord,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                    text:
                                                                        'Details',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .double_arrow_rounded,
                                                                      size: 20,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          130,
                                                                      height:
                                                                          40,
                                                                      color: Color(
                                                                          0xB9F4F5F5),
                                                                      textStyle:
                                                                          GoogleFonts
                                                                              .getFont(
                                                                        'Lexend Deca',
                                                                        color: Color(
                                                                            0xDF575859),
                                                                        fontSize:
                                                                            14,
                                                                      ),
                                                                      elevation:
                                                                          1,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          20,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
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
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              1),
                                                                          child:
                                                                              Text(
                                                                            listViewToDoListRecord.dayMonth,
                                                                            style:
                                                                                FlutterFlowTheme.title3.override(
                                                                              fontFamily: 'Lexend Deca',
                                                                              color: Color(0xFF282A2A),
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          listViewToDoListRecord
                                                                              .category,
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme
                                                                              .bodyText1
                                                                              .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                FlutterFlowTheme.primaryColor,
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ).animated([animationsMap['tabBarOnPageLoadAnimation']]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

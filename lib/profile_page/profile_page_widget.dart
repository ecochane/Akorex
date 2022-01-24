import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../post_details/post_details_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({Key key}) : super(key: key);

  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
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
        final profilePageUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.tertiaryColor,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        profilePageUsersRecord.displayName,
                                        'UserName',
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.title3,
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: Text(
                                          profilePageUsersRecord.email,
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFFEE8B60),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: Text(
                                          profilePageUsersRecord.bio,
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.bodyText1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.85, 0.68),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.primaryColor,
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.85, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 4, 4, 4),
                                      child: Container(
                                        width: 90,
                                        height: 90,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            profilePageUsersRecord.photoUrl,
                                            'https://firebasestorage.googleapis.com/v0/b/akorex-selfcare.appspot.com/o/124427555-person-gray-photo-placeholder-woman-in-shirt-on-white-background.jpg?alt=media&token=25b53984-e173-4da4-86c5-a6a5799cbd1d',
                                          ),
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 8, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NavBarPage(initialPage: 'chatMain'),
                                ),
                              );
                            },
                            text: 'Messages',
                            icon: Icon(
                              Icons.mark_email_unread_outlined,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 170,
                              height: 40,
                              color: Color(0xDA23182B),
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 30,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.bottomToTop,
                                duration: Duration(milliseconds: 250),
                                reverseDuration: Duration(milliseconds: 250),
                                child: NavBarPage(initialPage: 'editSettings'),
                              ),
                            );
                          },
                          text: 'Edit Profile',
                          icon: FaIcon(
                            FontAwesomeIcons.userEdit,
                            size: 16,
                          ),
                          options: FFButtonOptions(
                            width: 140,
                            height: 40,
                            color: FlutterFlowTheme.tertiaryColor,
                            textStyle: FlutterFlowTheme.bodyText1,
                            elevation: 0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.gray200,
                              width: 2,
                            ),
                            borderRadius: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: Color(0xDA23182B),
                          unselectedLabelColor: FlutterFlowTheme.grayIcon,
                          labelStyle: GoogleFonts.getFont(
                            'Roboto',
                          ),
                          indicatorColor: FlutterFlowTheme.primaryColor,
                          indicatorWeight: 2,
                          tabs: [
                            Tab(
                              text: 'Routine Tasks',
                            ),
                            Tab(
                              text: 'Posts',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF9FDFD),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 27, 20, 2),
                                  child: StreamBuilder<List<ToDoListRecord>>(
                                    stream: queryToDoListRecord(
                                      queryBuilder: (toDoListRecord) =>
                                          toDoListRecord.where('owner',
                                              isEqualTo: currentUserReference),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.primaryColor,
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
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xDDFBFBFB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                      color: Color(0xFFEBEFEF),
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
                                                                        builder:
                                                                            (context) =>
                                                                                NavBarPage(initialPage: 'Dashboard'),
                                                                      ),
                                                                    );
                                                                  },
                                                                  text:
                                                                      'Dashboard',
                                                                  icon: Icon(
                                                                    Icons
                                                                        .dashboard_customize,
                                                                    size: 18,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: 130,
                                                                    height: 40,
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
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        20,
                                                                  ),
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
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                                child: StreamBuilder<List<UserPostsRecord>>(
                                  stream: queryUserPostsRecord(
                                    queryBuilder: (userPostsRecord) =>
                                        userPostsRecord
                                            .where('postUser',
                                                isEqualTo:
                                                    profilePageUsersRecord
                                                        .reference)
                                            .orderBy('timePosted',
                                                descending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: CircularProgressIndicator(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    List<UserPostsRecord>
                                        socialFeedUserPostsRecordList =
                                        snapshot.data;
                                    if (socialFeedUserPostsRecordList.isEmpty) {
                                      return Center(
                                        child: Image.asset(
                                          'assets/images/output-onlinegiftools_(1).gif',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          height: 400,
                                        ),
                                      );
                                    }
                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            socialFeedUserPostsRecordList
                                                .length, (socialFeedIndex) {
                                          final socialFeedUserPostsRecord =
                                              socialFeedUserPostsRecordList[
                                                  socialFeedIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 8),
                                            child: StreamBuilder<UsersRecord>(
                                              stream: UsersRecord.getDocument(
                                                  socialFeedUserPostsRecord
                                                      .postUser),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 30,
                                                      height: 30,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: FlutterFlowTheme
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final userPostUsersRecord =
                                                    snapshot.data;
                                                return Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme
                                                        .tertiaryColor,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4,
                                                        color:
                                                            Color(0x32000000),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              PostDetailsWidget(
                                                            userRecord:
                                                                userPostUsersRecord,
                                                            postReference:
                                                                socialFeedUserPostsRecord
                                                                    .reference,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      8, 2, 4),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFF4B39EF),
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            1,
                                                                            1,
                                                                            1,
                                                                            1),
                                                                    child:
                                                                        Container(
                                                                      width: 40,
                                                                      height:
                                                                          40,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          userPostUsersRecord
                                                                              .photoUrl,
                                                                          'https://firebasestorage.googleapis.com/v0/b/akorex-selfcare.appspot.com/o/124427555-person-gray-photo-placeholder-woman-in-shirt-on-white-background.jpg?alt=media&token=25b53984-e173-4da4-86c5-a6a5799cbd1d',
                                                                        ),
                                                                        fit: BoxFit
                                                                            .fitWidth,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              12,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          userPostUsersRecord
                                                                              .userName,
                                                                          'myUsername',
                                                                        ),
                                                                        style: FlutterFlowTheme
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              Color(0xFF090F13),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          30,
                                                                      buttonSize:
                                                                          46,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_control,
                                                                        color: Color(
                                                                            0xFF262D34),
                                                                        size:
                                                                            20,
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'IconButton pressed ...');
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(0),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                valueOrDefault<
                                                                    String>(
                                                              socialFeedUserPostsRecord
                                                                  .postPhoto,
                                                              'https://d.newsweek.com/en/full/1310267/best-hawaii-beaches.jpg',
                                                            ),
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 300,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      4, 8, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            16,
                                                                            0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        ToggleIcon(
                                                                          onPressed:
                                                                              () async {
                                                                            final likesElement =
                                                                                profilePageUsersRecord.reference;
                                                                            final likesUpdate = socialFeedUserPostsRecord.likes.toList().contains(likesElement)
                                                                                ? FieldValue.arrayRemove([
                                                                                    likesElement
                                                                                  ])
                                                                                : FieldValue.arrayUnion([
                                                                                    likesElement
                                                                                  ]);
                                                                            final userPostsUpdateData =
                                                                                {
                                                                              'likes': likesUpdate,
                                                                            };
                                                                            await socialFeedUserPostsRecord.reference.update(userPostsUpdateData);
                                                                          },
                                                                          value: socialFeedUserPostsRecord
                                                                              .likes
                                                                              .toList()
                                                                              .contains(profilePageUsersRecord.reference),
                                                                          onIcon:
                                                                              Icon(
                                                                            Icons.favorite_rounded,
                                                                            color:
                                                                                Color(0xFF4B39EF),
                                                                            size:
                                                                                25,
                                                                          ),
                                                                          offIcon:
                                                                              Icon(
                                                                            Icons.favorite_border,
                                                                            color:
                                                                                Color(0xFF95A1AC),
                                                                            size:
                                                                                25,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              4,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              functions.likes(socialFeedUserPostsRecord).toString(),
                                                                              '0',
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.bodyText2.override(
                                                                              fontFamily: 'Lexend Deca',
                                                                              color: Color(0xFF8B97A2),
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .mode_comment_outlined,
                                                                        color: Color(
                                                                            0xFF95A1AC),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          socialFeedUserPostsRecord
                                                                              .numComments
                                                                              .toString(),
                                                                          style: FlutterFlowTheme
                                                                              .bodyText2
                                                                              .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                Color(0xFF8B97A2),
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            2,
                                                                            8,
                                                                            0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          'relative',
                                                                          socialFeedUserPostsRecord
                                                                              .timePosted),
                                                                      style: FlutterFlowTheme
                                                                          .bodyText1,
                                                                    ),
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .ios_share,
                                                                    color: Color(
                                                                        0xFF95A1AC),
                                                                    size: 24,
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(2,
                                                                      4, 0, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          0,
                                                                          12,
                                                                          12),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      socialFeedUserPostsRecord
                                                                          .postDescription,
                                                                      'I\'m back with a super quick Instagram redesign just for the fan. Rounded corners and cute icons, what else do we need, haha.⁣ ',
                                                                    ),
                                                                    style: FlutterFlowTheme
                                                                        .bodyText1
                                                                        .override(
                                                                      fontFamily:
                                                                          'Lexend Deca',
                                                                      color: Color(
                                                                          0xFF090F13),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  },
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
        );
      },
    );
  }
}

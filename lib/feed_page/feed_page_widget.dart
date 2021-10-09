import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../login_page/login_page_widget.dart';
import '../main.dart';
import '../photo/photo_widget.dart';
import '../post/post_widget.dart';
import '../profile_page_copy/profile_page_copy_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class FeedPageWidget extends StatefulWidget {
  FeedPageWidget({Key key}) : super(key: key);

  @override
  _FeedPageWidgetState createState() => _FeedPageWidgetState();
}

class _FeedPageWidgetState extends State<FeedPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(1, 0, 1, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/imageedit_2_8146002034.png',
                        width: 50,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            await signOut();
                            await Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPageWidget(),
                              ),
                              (r) => false,
                            );
                          },
                          child: Text(
                            '    ',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Condiment',
                              color: Color(0xFF3B1C44),
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PostWidget(),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.add_box_outlined,
                                color: Color(0xFF5F5563),
                                size: 25,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 4, 20, 0),
                            child: Container(
                              width: 36,
                              height: 36,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 2, 0),
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Color(0xFF5F5563),
                                      size: 25,
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(0.77, -0.86),
                                    child: Container(
                                      width: 11,
                                      height: 11,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await Share.share(
                                  'Hi. You are Invited to join the Akorex platform. Have better control on your beauty routine and acheive targets with amazing app.');
                            },
                            child: Icon(
                              Icons.send,
                              color: Color(0xFF5F5563),
                              size: 25,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 9, 0, 0),
                      child: AuthUserStreamWidget(
                        child: StreamBuilder<List<UsersRecord>>(
                          stream: queryUsersRecord(
                            queryBuilder: (usersRecord) => usersRecord
                                .where('email', isEqualTo: currentUserEmail),
                            singleRecord: true,
                          ),
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
                            List<UsersRecord> rowUsersRecordList =
                                snapshot.data;
                            // Return an empty Container when the document does not exist.
                            if (snapshot.data.isEmpty) {
                              return Container();
                            }
                            final rowUsersRecord = rowUsersRecordList.isNotEmpty
                                ? rowUsersRecordList.first
                                : null;
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 10, 0),
                                    child: Container(
                                      width: 90,
                                      height: 90,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        NavBarPage(
                                                            initialPage:
                                                                'ProfilePage'),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                width: 90,
                                                height: 90,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    rowUsersRecord
                                                        .profilePicUrl,
                                                    'https://www.kindpng.com/picc/m/24-248273_profile-image-png-of-a-woman-female-profile.png',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1, 1),
                                            child: InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        PostWidget(),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                width: 38,
                                                height: 38,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme
                                                      .primaryColor,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Colors.white,
                                                    width: 4,
                                                  ),
                                                ),
                                                child: InkWell(
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            PostWidget(),
                                                      ),
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  StreamBuilder<List<FollowsRecord>>(
                                    stream: queryFollowsRecord(
                                      queryBuilder: (followsRecord) =>
                                          followsRecord.where('follower',
                                              isEqualTo:
                                                  rowUsersRecord.reference),
                                    ),
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
                                      List<FollowsRecord> rowFollowsRecordList =
                                          snapshot.data;
                                      if (rowFollowsRecordList.isEmpty) {
                                        return Center(
                                          child: Image.asset(
                                            'assets/images/9142779445ebc295c746a5fb24911ff8.png',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        );
                                      }
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            rowFollowsRecordList.length,
                                            (rowIndex) {
                                          final rowFollowsRecord =
                                              rowFollowsRecordList[rowIndex];
                                          return Container(
                                            width: 100,
                                            height: 100,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xB6EFDF04),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              ProfilePageCopyWidget(
                                                            person:
                                                                rowFollowsRecord
                                                                    .following,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 90,
                                                      height: 90,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        rowFollowsRecord
                                                            .followingProfilePic,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 14.5, 0, 14.5),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        decoration: BoxDecoration(
                          color: Color(0x21AB95B1),
                        ),
                      ),
                    ),
                    StreamBuilder<List<PostsRecord>>(
                      stream: queryPostsRecord(),
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
                        List<PostsRecord> listViewPostsRecordList =
                            snapshot.data;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewPostsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewPostsRecord =
                                listViewPostsRecordList[listViewIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 0, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProfilePageCopyWidget(
                                                      person:
                                                          listViewPostsRecord
                                                              .user,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                width: 48,
                                                height: 48,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    listViewPostsRecord
                                                        .userProfilePic,
                                                    'https://www.kindpng.com/picc/m/24-248273_profile-image-png-of-a-woman-female-profile.png',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProfilePageCopyWidget(
                                                      person:
                                                          listViewPostsRecord
                                                              .user,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                listViewPostsRecord.username,
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Lato',
                                                  color: Color(0xA4626264),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 15, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PhotoWidget(
                                                  photo: listViewPostsRecord,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Icon(
                                            Icons.keyboard_control,
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                            size: 30,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Image.network(
                                  listViewPostsRecord.imageUrl,
                                  width: double.infinity,
                                  fit: BoxFit.fitWidth,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 9, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        listViewPostsRecord.post,
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lato',
                                          color: Color(0xFF7F6289),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 10),
                                  child: StreamBuilder<List<LikesRecord>>(
                                    stream: queryLikesRecord(),
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
                                      List<LikesRecord>
                                          containerLikesRecordList =
                                          snapshot.data;
                                      return Container(
                                        width: double.infinity,
                                        height: 1,
                                        decoration: BoxDecoration(
                                          color: Color(0x45EEEEEE),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 30),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          final likesCreateData =
                                              createLikesRecordData(
                                            liker: currentUserReference,
                                            post: listViewPostsRecord.reference,
                                            pic: '',
                                            date: getCurrentTimestamp,
                                          );
                                          await LikesRecord.collection
                                              .doc()
                                              .set(likesCreateData);
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 0, 0, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  final likesCreateData =
                                                      createLikesRecordData(
                                                    liker: currentUserReference,
                                                    post: listViewPostsRecord
                                                        .reference,
                                                    pic: currentUserPhoto,
                                                    date: getCurrentTimestamp,
                                                  );
                                                  await LikesRecord.collection
                                                      .doc()
                                                      .set(likesCreateData);
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text('Liked'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Icon(
                                                  Icons.favorite_border_sharp,
                                                  color: FlutterFlowTheme
                                                      .primaryColor,
                                                  size: 29,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              await Share.share(
                                                  listViewPostsRecord.post);
                                            },
                                            child: Icon(
                                              Icons.send,
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              size: 30,
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            160, 0, 0, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            final followsCreateData =
                                                createFollowsRecordData(
                                              follower: currentUserReference,
                                              following:
                                                  listViewPostsRecord.user,
                                              followerProfilePic:
                                                  currentUserPhoto,
                                              followingProfilePic:
                                                  listViewPostsRecord
                                                      .userProfilePic,
                                            );
                                            await FollowsRecord.collection
                                                .doc()
                                                .set(followsCreateData);
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text('Following'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Text(
                                            'Follow',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lato',
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 15, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            final followsCreateData =
                                                createFollowsRecordData(
                                              follower: currentUserReference,
                                              following:
                                                  listViewPostsRecord.user,
                                              followerProfilePic:
                                                  currentUserPhoto,
                                              followingProfilePic:
                                                  listViewPostsRecord
                                                      .userProfilePic,
                                            );
                                            await FollowsRecord.collection
                                                .doc()
                                                .set(followsCreateData);
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text('Following'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Icon(
                                            Icons.bookmark_border_outlined,
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                            size: 30,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

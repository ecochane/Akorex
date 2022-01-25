import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/delete_post_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostDetailsWidget extends StatefulWidget {
  const PostDetailsWidget({
    Key key,
    this.postReference,
    this.userRecord,
  }) : super(key: key);

  final DocumentReference postReference;
  final UsersRecord userRecord;

  @override
  _PostDetailsWidgetState createState() => _PostDetailsWidgetState();
}

class _PostDetailsWidgetState extends State<PostDetailsWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserPostsRecord>(
      stream: UserPostsRecord.getDocument(widget.postReference),
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
        final postDetailsUserPostsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.tertiaryColor,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      postDetailsUserPostsRecord.postPhoto,
                                  width: 100,
                                  height: 430,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0x3F000000),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      buttonSize: 46,
                                      icon: Icon(
                                        Icons.arrow_back_rounded,
                                        color: FlutterFlowTheme.tertiaryColor,
                                        size: 24,
                                      ),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  if (postDetailsUserPostsRecord.postOwner ??
                                      true)
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 44,
                                      fillColor: Color(0x41000000),
                                      icon: Icon(
                                        Icons.more_vert_sharp,
                                        color: FlutterFlowTheme.tertiaryColor,
                                        size: 24,
                                      ),
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                height: 250,
                                                child: DeletePostWidget(
                                                  postParameters:
                                                      postDetailsUserPostsRecord,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      1, 1, 1, 1),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      widget.userRecord.photoUrl,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Text(
                                        widget.userRecord.userName,
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF090F13),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Text(
                                        dateTimeFormat(
                                            'relative',
                                            postDetailsUserPostsRecord
                                                .timePosted),
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  postDetailsUserPostsRecord.postDescription
                                      .maybeHandleOverflow(
                                    maxChars: 200,
                                    replacement: '…',
                                  ),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF090F13),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 16, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ToggleIcon(
                                          onPressed: () async {
                                            final likesElement =
                                                currentUserReference;
                                            final likesUpdate =
                                                postDetailsUserPostsRecord.likes
                                                        .toList()
                                                        .contains(likesElement)
                                                    ? FieldValue.arrayRemove(
                                                        [likesElement])
                                                    : FieldValue.arrayUnion(
                                                        [likesElement]);
                                            final userPostsUpdateData = {
                                              'likes': likesUpdate,
                                            };
                                            await postDetailsUserPostsRecord
                                                .reference
                                                .update(userPostsUpdateData);
                                          },
                                          value: postDetailsUserPostsRecord
                                              .likes
                                              .toList()
                                              .contains(currentUserReference),
                                          onIcon: Icon(
                                            Icons.favorite_border,
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                            size: 25,
                                          ),
                                          offIcon: Icon(
                                            Icons.favorite_border,
                                            color: Color(0xFF95A1AC),
                                            size: 25,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4, 0, 0, 0),
                                          child: Text(
                                            functions
                                                .likes(
                                                    postDetailsUserPostsRecord)
                                                .toString(),
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
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
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.mode_comment_outlined,
                                        color: Color(0xFF95A1AC),
                                        size: 24,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 0, 0),
                                        child: Text(
                                          postDetailsUserPostsRecord.numComments
                                              .toString(),
                                          style: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF8B97A2),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.ios_share,
                                    color: Color(0xFF95A1AC),
                                    size: 24,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.background,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Comments',
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Lexend Deca',
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                                child: StreamBuilder<List<PostCommentsRecord>>(
                                  stream: queryPostCommentsRecord(
                                    queryBuilder: (postCommentsRecord) =>
                                        postCommentsRecord
                                            .where('post',
                                                isEqualTo:
                                                    postDetailsUserPostsRecord
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
                                    List<PostCommentsRecord>
                                        commentListPostCommentsRecordList =
                                        snapshot.data;
                                    if (commentListPostCommentsRecordList
                                        .isEmpty) {
                                      return Center(
                                        child: Image.asset(
                                          'assets/images/commentsEmpty@2x.png',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          height: 270,
                                        ),
                                      );
                                    }
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          commentListPostCommentsRecordList
                                              .length, (commentListIndex) {
                                        final commentListPostCommentsRecord =
                                            commentListPostCommentsRecordList[
                                                commentListIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 12),
                                          child: StreamBuilder<UsersRecord>(
                                            stream: UsersRecord.getDocument(
                                                commentListPostCommentsRecord
                                                    .user),
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
                                              final commentUsersRecord =
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
                                                      blurRadius: 3,
                                                      color: Color(0x41000000),
                                                      offset: Offset(0, 1),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 12, 8, 12),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: 40,
                                                        height: 40,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            commentUsersRecord
                                                                .photoUrl,
                                                            'https://firebasestorage.googleapis.com/v0/b/akorex-selfcare.appspot.com/o/124427555-person-gray-photo-placeholder-woman-in-shirt-on-white-background.jpg?alt=media&token=25b53984-e173-4da4-86c5-a6a5799cbd1d',
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(12,
                                                                      0, 0, 0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  commentUsersRecord
                                                                      .displayName,
                                                                  'My Name Here',
                                                                ),
                                                                style: FlutterFlowTheme
                                                                    .subtitle2,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  commentListPostCommentsRecord
                                                                      .comment,
                                                                  style: FlutterFlowTheme
                                                                      .bodyText1,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              4,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        'Posted',
                                                                        style: FlutterFlowTheme
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      dateTimeFormat(
                                                                          'relative',
                                                                          commentListPostCommentsRecord
                                                                              .timePosted),
                                                                      style: FlutterFlowTheme
                                                                          .bodyText2
                                                                          .override(
                                                                        fontFamily:
                                                                            'Lexend Deca',
                                                                        fontSize:
                                                                            12,
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
                                          ),
                                        );
                                      }),
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.tertiaryColor,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Color(0x3A000000),
                                offset: Offset(0, 1),
                              )
                            ],
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 4, 0, 4),
                                  child: TextFormField(
                                    controller: textController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Comment here...',
                                      hintStyle: FlutterFlowTheme.bodyText1,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.primaryDark,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final postCommentsCreateData =
                                        createPostCommentsRecordData(
                                      timePosted: getCurrentTimestamp,
                                      comment: textController.text,
                                      user: currentUserReference,
                                      post:
                                          postDetailsUserPostsRecord.reference,
                                    );
                                    await PostCommentsRecord.collection
                                        .doc()
                                        .set(postCommentsCreateData);

                                    final userPostsUpdateData = {
                                      'numComments': FieldValue.increment(1),
                                    };
                                    await postDetailsUserPostsRecord.reference
                                        .update(userPostsUpdateData);
                                  },
                                  text: 'Post',
                                  options: FFButtonOptions(
                                    width: 70,
                                    height: 40,
                                    color: FlutterFlowTheme.tertiaryColor,
                                    textStyle:
                                        FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.primaryColor,
                                    ),
                                    elevation: 0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 12,
                                  ),
                                ),
                              ),
                            ],
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
    );
  }
}

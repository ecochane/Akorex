import '../auth/auth_util.dart';
import '../create_account/create_account_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../forgot_password/forgot_password_widget.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailController;
  TextEditingController passwordController;
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/Untitled_design_(6).png',
            ).image,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 46, 0, 0),
                      child: Image.asset(
                        'assets/images/Akorex-removebg-preview.png',
                        width: 40,
                        height: 36,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ],
              ),
              Material(
                color: Colors.transparent,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    color: Color(0xE2E2EAEA),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 44),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 40, 0, 5),
                                child: Text(
                                  'Welcome Back,',
                                  style: FlutterFlowTheme.title1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF100D16),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Access your account or ',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF90819E),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        3, 0, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            duration:
                                                Duration(milliseconds: 200),
                                            reverseDuration:
                                                Duration(milliseconds: 200),
                                            child: CreateAccountWidget(),
                                          ),
                                        );
                                      },
                                      text: 'Create Account',
                                      icon: Icon(
                                        Icons.person_add,
                                        size: 15,
                                      ),
                                      options: FFButtonOptions(
                                        width: 160,
                                        height: 28,
                                        color: Color(0xAFF7F4F9),
                                        textStyle:
                                            FlutterFlowTheme.subtitle2.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF0D1012),
                                          fontSize: 14,
                                        ),
                                        elevation: 0,
                                        borderSide: BorderSide(
                                          color: Color(0xC94D4452),
                                          width: 2,
                                        ),
                                        borderRadius: 8,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                          child: TextFormField(
                            controller: emailController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Your email...',
                              labelStyle: FlutterFlowTheme.bodyText1,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE6E6E6),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(80),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE6E6E6),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(80),
                              ),
                              filled: true,
                              fillColor: Color(0xFFF7F4F9),
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              prefixIcon: Icon(
                                Icons.mark_email_read_outlined,
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.primaryDark,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(24, 16, 24, 20),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: !passwordVisibility,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: FlutterFlowTheme.bodyText1,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE6E6E6),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(80),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE6E6E6),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(80),
                              ),
                              filled: true,
                              fillColor: Color(0xFFF7F4F9),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  16, 20, 24, 20),
                              prefixIcon: Icon(
                                Icons.lock_open,
                              ),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () =>
                                      passwordVisibility = !passwordVisibility,
                                ),
                                child: Icon(
                                  passwordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: FlutterFlowTheme.grayIcon,
                                  size: 22,
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.primaryDark,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPasswordWidget(),
                                      ),
                                    );
                                  },
                                  text: 'Forgot Password?',
                                  options: FFButtonOptions(
                                    width: 170,
                                    height: 40,
                                    color: Color(0xCDF7F4F9),
                                    textStyle:
                                        FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.primaryColor,
                                      fontSize: 14,
                                    ),
                                    elevation: 0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 7,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final user = await signInWithEmail(
                                      context,
                                      emailController.text,
                                      passwordController.text,
                                    );
                                    if (user == null) {
                                      return;
                                    }

                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NavBarPage(
                                            initialPage: 'Dashboard'),
                                      ),
                                      (r) => false,
                                    );
                                  },
                                  text: 'Login',
                                  icon: Icon(
                                    Icons.login_rounded,
                                    size: 15,
                                  ),
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 40,
                                    color: FlutterFlowTheme.secondaryColor,
                                    textStyle:
                                        FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                    ),
                                    elevation: 0,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.secondaryColor,
                                      width: 3,
                                    ),
                                    borderRadius: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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

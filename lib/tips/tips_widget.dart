import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TipsWidget extends StatefulWidget {
  const TipsWidget({Key key}) : super(key: key);

  @override
  _TipsWidgetState createState() => _TipsWidgetState();
}

class _TipsWidgetState extends State<TipsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xE2F7FAFC),
    );
  }
}

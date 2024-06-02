import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:healtho_app/utils/ConstantWidget.dart';
import 'package:healtho_app/utils/DataFile.dart';
import 'package:html_unescape/html_unescape.dart';

import 'ConstantData.dart';
import 'generated/l10n.dart';

class TermsAndConditionWidget extends StatefulWidget {
  @override
  _TermsAndConditionWidget createState() {
    return _TermsAndConditionWidget();
  }
}

class _TermsAndConditionWidget extends State<TermsAndConditionWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: false,
            elevation: 0,
            backgroundColor: primaryColor,
            title: ConstantWidget.getTextWidget(
                S.of(context).termsConditions,
                Colors.white,
                TextAlign.left,
                FontWeight.bold,
                ConstantWidget.getScreenPercentSize(context, 2.3)),
            leading: IconButton(
              icon: Icon(
                Icons.keyboard_backspace,
                color: Colors.white,
              ),
              onPressed: _requestPop,
            ),
          ),

          body: Container(
              child: HtmlWidget(parseHtmlString(DataFile.htmlData),
                  textStyle: TextStyle(color: Colors.black))
              // child:ConstantWidget.getTextWidget(
              //     ConstantData.parseHtmlString(DataFile.htmlData),
              //     textColor,
              //     TextAlign.left,
              //     FontWeight.bold,
              //     ConstantWidget.getScreenPercentSize(context, 2.5)),
              // child: mainWidget(),
              ),

          // bottomNavigationBar: ,
        ),
        onWillPop: _requestPop);
  }

  static String parseHtmlString(String htmlString) {
    var unescape = HtmlUnescape();
    var text = unescape.convert(htmlString);

    return text;
  }

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(true);
  }
}

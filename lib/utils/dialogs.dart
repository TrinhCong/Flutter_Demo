import 'dart:async';
import 'dart:ui';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/sizes.dart';

class Dialogs {
  static _(BuildContext context, String key) => "__dialogUtils__";
  

  static Future<void> alert(
      {BuildContext context, String title, String message}) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              title ?? "Thông báo",
              style: TextStyle(
                fontFamily: 'Roboto-Condensed',
                fontWeight: FontWeight.bold,
                fontSize: ArchMediaSizes.getFontSize(16.0),
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    message,
                    style: TextStyle(
                      fontFamily: 'Roboto-Condensed',
                      fontSize: ArchMediaSizes.getFontSize(14.0),
                    ),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Đồng ý",
                  style: TextStyle(fontFamily: 'Roboto-Condensed'),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.blue[600],
                textColor: Colors.white,
              )
            ],
          );
        });
  }

  static Future<Dialog> showProgress(
      {@required BuildContext context, String message}) {
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return SafeArea(
          child: Builder(builder: (context) {
            return Material(
              color: Colors.transparent,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            );
          }),
        );
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: null,
      transitionDuration: const Duration(milliseconds: 150),
    );
  }

  static Future<bool> confirm(
      {@required BuildContext context,
      String title = "",
      @required String message}) async {
    return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text(
            StringUtils.isNullOrEmpty(title) ? "Xác nhận" : title,
            style: TextStyle(
              fontFamily: 'Roboto-Condensed',
              fontSize: ArchMediaSizes.getFontSize(18.0),
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  message,
                  style: TextStyle(
                    fontFamily: 'Roboto-Condensed',
                    fontSize: ArchMediaSizes.getFontSize(16.0),
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                "Hủy",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: ArchMediaSizes.getFontSize(14.0),
                  fontFamily: 'Roboto-Condensed',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                "Đồng ý",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: ArchMediaSizes.getFontSize(14.0),
                  fontFamily: 'Roboto-Condensed',
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  static Future<String> showChoices({
    @required BuildContext context,
    String title = "",
    @required String message,
    @required Color color,
    @required Widget icon,
    @required List<DialogChoiceItem> buttons,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: color))
              ),
              child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: SizedBox(
                          child: icon,
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Expanded(
                        child:
                        Container(
                          padding: EdgeInsets.only(right: 35),
                          child: Center(
                          child: Text(
                            StringUtils.isNullOrEmpty(title)
                                ? "Xác nhận"
                                : title,
                            style: TextStyle(
                                fontFamily: 'Roboto-Condensed',
                                fontSize: ArchMediaSizes.getFontSize(18.0),
                                fontWeight: FontWeight.bold,
                                color: color),
                          ),
                        ),
                        )
                         ,
                      )
                    ]),
              )),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  message,
                  style: TextStyle(
                    fontFamily: 'Roboto-Condensed',
                    fontSize: ArchMediaSizes.getFontSize(16.0),
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: buttons
                    .map(
                      (item) => Expanded(
                          child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop(item.value);
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          margin: EdgeInsets.only(left: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: item.color),
                          alignment: Alignment.center,
                          child: Text(
                            item.text.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ArchMediaSizes.getFontSize(13.0),
                              fontFamily: 'Roboto-Condensed',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
                    )
                    .toList(),
              ),
            )
          ],
        );
      },
    );
  }

  static Future<String> showSpecialConfirm({
    @required BuildContext context,
    String title = "",
    @required String message,
    @required Color color,
    @required Widget icon,
    @required List<DialogChoiceItem> buttons,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static textSnack(
      {@required GlobalKey<ScaffoldState> key, @required String message}) {
    key.currentState.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            fontSize: ArchMediaSizes.getFontSize(14.0),
          ),
        ),
      ),
    );
  }

  static closeDialog({@required BuildContext context}) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}

class DialogChoiceItem {
  final String value;
  final String text;
  final Color color;
  DialogChoiceItem(
      {@required this.text, @required this.value, @required this.color});
}

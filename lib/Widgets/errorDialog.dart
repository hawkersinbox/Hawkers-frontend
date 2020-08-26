import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final title;
  final message;

  ErrorDialog({this.title, this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: message != "" ? Text(message) : null,
      actions: <Widget>[
        FlatButton(
          child: Text('Okay'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}

class ConfirmDialog extends StatelessWidget {
  final Function function;
  final String username;
  ConfirmDialog(this.function, this.username);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Are you Sure'),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(context).pop();
              function(username);
            },
          ),
        )
      ],
    );
  }
}
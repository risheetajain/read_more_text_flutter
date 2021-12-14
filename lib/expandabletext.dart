import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  ExpandableText({Key? key, required this.text}) : super(key: key);

  final String text;
  bool isExpanded = false;

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin<ExpandableText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSize(
                vsync: this,
                duration: const Duration(milliseconds: 500),
                child: ConstrainedBox(
                    constraints: widget.isExpanded
                        ? const BoxConstraints()
                        : const BoxConstraints(maxHeight: 20.0),
                    child: Text(
                      widget.text,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ))),
            widget.isExpanded
                ? ConstrainedBox(constraints: BoxConstraints())
                : TextButton(
                    child: const Text('...'),
                    onPressed: () => setState(() => widget.isExpanded = true))
          ]),
    );
  }
}

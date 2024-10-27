import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int trimLength;
  final TextStyle? textStyle;

  const ReadMoreText({
    Key? key,
    required this.text,
    this.trimLength = 100,
    this.textStyle = const TextStyle(),
  }) : super(key: key);

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final String displayText = _isExpanded
        ? widget.text
        : '${widget.text.substring(0, widget.trimLength)}...';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          displayText,
          style: widget.textStyle,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Text(_isExpanded ? 'Read less' : 'Read more',
              style: TextStyle(
                  color: const Color(0xff51A8FF),
                  fontSize: widget.textStyle?.fontSize,
                  fontWeight: widget.textStyle?.fontWeight)),
        ),
      ],
    );
  }
}

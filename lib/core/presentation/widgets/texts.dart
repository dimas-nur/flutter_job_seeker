import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int trimLines;

  const ExpandableText({
    Key? key,
    required this.text,
    required this.trimLines,
  }) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late ThemeData _theme;

  bool _isReadMore = true;

  void _onTapLink() {
    setState(() => _isReadMore = !_isReadMore);
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

    TextSpan link = TextSpan(
      children: [
        if (_isReadMore)
          const TextSpan(
            text: "...",
          ),
        TextSpan(
          text: _isReadMore ? "  read more" : "  read less",
          style: const TextStyle(
            color: Colors.blue,
          ),
          recognizer: TapGestureRecognizer()..onTap = _onTapLink,
        )
      ],
      recognizer: TapGestureRecognizer()..onTap = _onTapLink,
    );

    Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double maxWidth = constraints.maxWidth;

        // Create a TextSpan with data
        final text = TextSpan(
          text: widget.text,
        );

        // Layout and measure link
        TextPainter textPainter = TextPainter(
          text: link,
          textDirection: TextDirection.rtl,
          maxLines: widget.trimLines,
          ellipsis: '...',
        )..layout(
            minWidth: constraints.minWidth,
            maxWidth: maxWidth,
          );
        final linkSize = textPainter.size;

        // Layout and measure text
        textPainter
          ..text = text
          ..layout(
            minWidth: constraints.minWidth,
            maxWidth: maxWidth,
          );
        final textSize = textPainter.size;

        // Get the endIndex of data
        final pos = textPainter.getPositionForOffset(Offset(
          textSize.width - linkSize.width,
          textSize.height,
        ));
        final endIndex = textPainter.getOffsetBefore(pos.offset);

        late TextSpan textSpan;

        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text:
                _isReadMore ? widget.text.substring(0, endIndex) : widget.text,
            style: _theme.textTheme.bodySmall,
            children: <TextSpan>[link],
          );
        } else {
          textSpan = TextSpan(
            text: widget.text,
            style: _theme.textTheme.bodySmall,
          );
        }

        return RichText(
          softWrap: true,
          overflow: TextOverflow.clip,
          text: textSpan,
        );
      },
    );

    return result;
  }
}

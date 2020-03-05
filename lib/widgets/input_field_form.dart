import 'dart:async';
import '../animations/input_helper.dart';
import 'package:flutter/material.dart';

typedef void CaretMoved(Offset globalCaretPosition);
typedef void TextChanged(String text);

class InputFieldForm extends StatefulWidget {
  final String hint;
  final BoxBorder border;
  final Function onTextChange;
  final bool isObscure;
  final TextInputType inputType;
  final FocusNode isFocused;
  final CaretMoved onCaretMoved;
  final TextChanged onTextChanged;
  final bool isObscured;

  InputFieldForm(
      {this.hint,
      this.border,
      this.onTextChange,
      this.inputType,
      this.isObscure,
      this.isFocused,
      this.isObscured,
      this.onCaretMoved,
      this.onTextChanged});

  @override
  _InputFieldFormState createState() => _InputFieldFormState();
}

class _InputFieldFormState extends State<InputFieldForm> {
  final GlobalKey _fieldKey = GlobalKey();
  final TextEditingController _textController = TextEditingController();
  Timer _debounceTimer;

  @override
  void initState() {
    _textController.addListener(() {
      // We debounce the listener as sometimes the caret position is updated after the listener
      // this assures us we get an accurate caret position.
      if (_debounceTimer?.isActive ?? false) _debounceTimer.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 100), () {
        if (_fieldKey.currentContext != null) {
          // Find the render editable in the field.
          final RenderObject fieldBox =
              _fieldKey.currentContext.findRenderObject();
          Offset caretPosition = getCaretPosition(fieldBox);

          if (widget.onCaretMoved != null) {
            widget.onCaretMoved(caretPosition);
          }
        }
      });
      if (widget.onTextChanged != null) {
        widget.onTextChanged(_textController.text);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: widget.border,
      ),
      child: TextField(
        key: _fieldKey,
        focusNode: widget.isFocused,
        controller: _textController,
        keyboardType: widget.inputType,
        obscureText: widget.isObscure,
        onChanged: widget.onTextChange,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
            hintText: widget.hint),
      ),
    );
  }
}

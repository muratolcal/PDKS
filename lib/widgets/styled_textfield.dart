import 'package:teknopark_pdks/theme/size_config.dart';
import 'package:teknopark_pdks/theme/spaces.dart';
import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:teknopark_pdks/utils/phone_formatter.dart';
import 'package:teknopark_pdks/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StyledTextField extends StatefulWidget {
  final String? text;
  final String? Function(String?)? validate;
  final int textFieldMaxLength;
  final String textFieldHintText;
  final TextInputType textFieldInputType;
  final IconData? textFieldIcon;
  final VoidCallback? onTap;
  final VoidCallback? onChanged;

  final TextEditingController? textFieldController;
  final int? lineNumber;
  final Color? textFieldColor;
  final bool? isJustRead;
  final bool? showTitle;
  final String? prefixIcon;
  final String? textFieldFormatterType;

  final bool? isAutofocus;

  const StyledTextField(
      {super.key,
      this.text,
      required this.validate,
      required this.textFieldMaxLength,
      required this.textFieldHintText,
      required this.textFieldInputType,
      this.textFieldIcon,
      this.onTap,
      this.onChanged,
      this.textFieldController,
      this.lineNumber,
      this.textFieldColor,
      this.isJustRead,
      this.showTitle,
      this.prefixIcon,
      this.textFieldFormatterType,
      this.isAutofocus});

  @override
  State<StyledTextField> createState() => _StyledTextFieldState();
}

class _StyledTextFieldState extends State<StyledTextField> {
  SizeConfig sizeConfig = SizeConfig();
  double radius = CustomTheme.mainRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeConfig.widthSize(context, 340),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.showTitle ?? true,
            child: Padding(
              padding: EdgeInsets.only(
                left: sizeConfig.widthSize(context, 8),
              ),
              child: StyledText(
                  styledString: widget.textFieldHintText,
                  styledFontSize: 14,
                  styledAlign: TextAlign.left,
                  styledWeight: FontWeight.w500,
                  styledColor: CustomTheme.darkColor),
            ),
          ),
          TextFormField(
            onTap: widget.onTap,
            autofocus: false,
            enableSuggestions: true,
            validator: widget.validate,
            inputFormatters: [
              widget.textFieldFormatterType == "phone"
                  ? PhoneInputFormatter(context)
                  : widget.textFieldFormatterType == "number"
                      ? FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      : FilteringTextInputFormatter.allow(RegExp('.*')),
            ],
            style: const TextStyle(
              color: CustomTheme.darkColor,
            ),
            cursorColor: CustomTheme.darkColor.withOpacity(
              0.8,
            ),
            readOnly: widget.isJustRead ?? false,
            maxLines: widget.lineNumber ?? 1,
            maxLength: widget.textFieldMaxLength,
            controller: widget.textFieldController,
            keyboardType: widget.textFieldInputType,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(radius),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(radius),
              ),
              filled: true,
              counterText: "",
              fillColor: widget.textFieldColor ??
                  const Color(0xFFC4C4C4).withOpacity(0.2),
              suffixIcon: widget.textFieldIcon != null
                  ? Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: FaIcon(widget.textFieldIcon!),
                    )
                  : null,
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Image.asset(
                        widget.prefixIcon!,
                        height: sizeConfig.heightSize(context, 0),
                      ),
                    )
                  : null,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              //hintText: widget.textFieldHintText,
              hintStyle: TextStyle(
                color: CustomTheme.darkColor.withOpacity(
                  0.8,
                ),
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
            onChanged: (value) {
              if (widget.onChanged != null) {
                widget.onChanged!();
              }
            },
          ),
          Spaces.miniSpace(context),
        ],
      ),
    );
  }
}

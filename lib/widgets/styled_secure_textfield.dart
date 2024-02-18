import 'package:teknopark_pdks/theme/size_config.dart';
import 'package:teknopark_pdks/theme/spaces.dart';
import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:teknopark_pdks/utils/phone_formatter.dart';
import 'package:teknopark_pdks/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StyledSecureTextField extends StatefulWidget {
  final int textFieldMaxLength;
  final String textFieldHintText;
  final TextInputType textFieldInputType;
  final String? textFieldIcon;
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

  const StyledSecureTextField(
      {super.key,
      required this.textFieldMaxLength,
      required this.textFieldHintText,
      required this.textFieldInputType,
      this.textFieldIcon,
      required this.textFieldController,
      this.textFieldFormatterType,
      this.lineNumber,
      this.textFieldColor,
      this.isJustRead,
      this.isAutofocus,
      this.onTap,
      this.onChanged,
      this.prefixIcon,
      this.showTitle});

  @override
  State<StyledSecureTextField> createState() => _StyledSecureTextFieldState();
}

class _StyledSecureTextFieldState extends State<StyledSecureTextField> {
  bool isObscure = true;
  SizeConfig sizeConfig = SizeConfig();
  double radius = CustomTheme.mainRadius;
  @override
  Widget build(BuildContext context) => Container(
        width: sizeConfig.widthSize(context, 340),
        padding: EdgeInsets.only(
          top: sizeConfig.heightSize(context, 2),
          bottom: sizeConfig.heightSize(context, 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 2,
            ),
            Visibility(
              visible: widget.showTitle ?? true,
              child: StyledText(
                styledString: widget.textFieldHintText,
                styledFontSize: 14,
                styledAlign: TextAlign.left,
                styledWeight: FontWeight.w300,
                styledColor: CustomTheme.darkColor.withOpacity(
                  0.8,
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
              child: TextField(
                obscureText: isObscure,
                obscuringCharacter: '*',
                onTap: widget.onTap,
                autofocus: false,
                enableSuggestions: true,
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
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: isObscure == true
                        ? const Icon(Icons.lock)
                        : const Icon(Icons.lock_open),
                  ),
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
                  hintText: widget.textFieldHintText,
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
            ),
            Spaces.miniSpace(context),
          ],
        ),
      );
}

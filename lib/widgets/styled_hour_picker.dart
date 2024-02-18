import 'package:teknopark_pdks/widgets/styled_text.dart';
import 'package:flutter/cupertino.dart';

Future<DateTime> showCupertinoHourDatePicker(
  BuildContext context,
) async {
  DateTime selectedDate = DateTime.now();

  await showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) => CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const StyledText(
            styledString: "Saat Seç",
            styledFontSize: 14,
            styledWeight: FontWeight.bold,
          ),
          onPressed: () {
            Navigator.pop(context, selectedDate);
          },
        ),
      ],
      cancelButton: CupertinoButton(
        child: const StyledText(styledString: "Vazgeç", styledFontSize: 14),
        onPressed: () {
          Navigator.pop(
            context,
          );
        },
      ),
      message: SizedBox(
        height: 200.0,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.time,
          initialDateTime: DateTime.now(),
          use24hFormat: true,
          // minuteInterval: 10,

          onDateTimeChanged: (DateTime newDateTime) {
            selectedDate = newDateTime;
          },
        ),
      ),
    ),
  );
  // if (selectedDate != null) {
  //   controller.text = DateFormat('dd/MM/yyyy').format(selectedDate);
  // }
  return selectedDate;
}

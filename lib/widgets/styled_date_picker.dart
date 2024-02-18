import 'package:teknopark_pdks/widgets/styled_text.dart';
import 'package:flutter/cupertino.dart';

Future<DateTime> showCupertinoDatePicker(
    BuildContext context, String controller,
    {bool isFuture = false}) async {
  DateTime selectedDate = DateTime.now();
  print(isFuture);
  await showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) => CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const StyledText(
            styledString: "Tarih Seç",
            styledFontSize: 14,
            styledWeight: FontWeight.bold,
          ),
          onPressed: () {
            Navigator.pop(context, controller);
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
          mode: CupertinoDatePickerMode.date,
          minimumDate: isFuture ? DateTime.now() : DateTime(1990),
          initialDateTime: DateTime.now(),
          maximumDate: isFuture
              ? DateTime.now().add(const Duration(days: 365 * 20))
              : DateTime.now(),
          minimumYear: isFuture ? DateTime.now().year : 1990,
          maximumYear:
              isFuture ? DateTime.now().year + 20 : DateTime.now().year,
          onDateTimeChanged: (DateTime newDate) {
            selectedDate = newDate;
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

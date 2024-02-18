import 'package:teknopark_pdks/widgets/styled_text.dart';
import 'package:flutter/cupertino.dart';

typedef FieldAccessor<T> = dynamic Function(T item);

showCupertinoListPicker<T>(
  BuildContext context,
  List<T> itemList,
  String nameParameter,
  String idParameter,
  Map<String, FieldAccessor<T>> fieldAccessors,
) async {
  List<Map<String, dynamic>> myList = [];
  for (var item in itemList) {
    Map<String, dynamic> map = {
      nameParameter: fieldAccessors[nameParameter]!(item),
      idParameter: fieldAccessors[idParameter]!(item),
    };
    myList.add(map);
  }
  Map<String, dynamic> selectedItem = {};

  // Get screen height
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;

  await showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) => ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: screenHeight * 0.75,
        minWidth: screenWidth * 0.75,
      ),
      child: CupertinoActionSheet(
        actions: myList.map((item) {
          return CupertinoActionSheetAction(
            child: StyledText(
              styledString: item[nameParameter],
              styledFontSize: 16,
            ),
            onPressed: () {
              selectedItem = item;
              Navigator.of(context, rootNavigator: true).pop(context);
            },
          );
        }).toList(),
        cancelButton: CupertinoButton(
          child: const StyledText(
            styledString: "Vazgeç",
            styledFontSize: 16,
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop(context);
          },
        ),
      ),
    ),
  );
  return selectedItem;
}

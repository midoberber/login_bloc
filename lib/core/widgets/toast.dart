import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_with_bloc/core/constant/colors.dart';

customToast({
  required bool isError,
  required String content,
}) {
  return Fluttertoast.showToast(
    msg: content,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 2,
    webPosition: "center",
    webBgColor: isError
        ? "linear-gradient(to right, #EB4444, #EB4444)"
        : "linear-gradient(to right, #6CE2AB, #6CE2AB)",
    textColor: white,
    fontSize: 16.0,
  );
}

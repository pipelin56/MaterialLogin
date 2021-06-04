import 'dart:async';

class Validators {
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length < 6) {
        sink.addError("Password should has min 6 characters. ");
      } else {
        sink.add(password);
      }
    },
  );

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      Pattern emailPattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(emailPattern);

      if (regExp.hasMatch(email)) {
        sink.add(email);
      } else {
        sink.addError("Bad format email.");
      }
    },
  );
}

import 'package:edu_cope/exception/server-error.dart';

class ResponseEntity<T> {
  ServerError _error;
  T data;
  int _status;

  setException(ServerError error) {
    _error = error;
  }

  setData(T data) {
    this.data = data;
  }

  setStatus(int status) {
    _status = status;
  }

  get getException {
    return _error;
  }

  get getStatus {
    return _status;
  }

}
export 'unsupported_connection.dart'
    if (dart.library.js) 'web_connection.dart'
    if (dart.library.ffi) 'native_connection.dart';

part of 'flutter_form_builder_cubit.dart';

@immutable
abstract class FlutterFormBuilderState {
  Map<String, dynamic> get fields;
}

class FlutterFormBuilderInitial extends FlutterFormBuilderState {
  final Map<String, dynamic> _fields;

  FlutterFormBuilderInitial({Map<String, dynamic> fields = const {}})
    : _fields = fields;

  @override
  Map<String, dynamic> get fields => _fields;
}

class FlutterFormBuilderUpdated extends FlutterFormBuilderState {
  final Map<String, dynamic> _fields;

  FlutterFormBuilderUpdated(Map<String, dynamic> fields) : _fields = fields;

  @override
  Map<String, dynamic> get fields => _fields;
}

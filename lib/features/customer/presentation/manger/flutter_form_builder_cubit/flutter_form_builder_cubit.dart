import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'flutter_form_builder_state.dart';

class FlutterFormBuilderCubit extends Cubit<FlutterFormBuilderState> {
  FlutterFormBuilderCubit() : super(FlutterFormBuilderInitial());

  void updateField(String name, dynamic value) {
    //* الحصول على الخريطة الحالية من الحالة
    final currentFields = state.fields;

    //* إنشاء نسخة جديدة من الخريطة وتحديث القيمة
    final newFields = Map<String, dynamic>.from(currentFields);
    newFields[name] = value;

    //* إصدار حالة جديدة مع الخريطة المحدثة
    emit(FlutterFormBuilderUpdated(newFields));
  }

  void clearFields() {
    emit(FlutterFormBuilderInitial(fields: {}));
  }
}

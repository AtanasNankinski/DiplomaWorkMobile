import 'package:diploma_work_mobile/misc/error/error.dart';
import 'package:diploma_work_mobile/misc/error/error_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final errorProvider = NotifierProvider<ErrorNotifier, ErrorModel>(
      () => ErrorNotifier(),
);
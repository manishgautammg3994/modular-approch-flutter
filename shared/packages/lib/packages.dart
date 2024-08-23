library packages;

// ?# dependencies:
export 'package:intl/intl.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:json_annotation/json_annotation.dart';
export 'package:freezed_annotation/freezed_annotation.dart';
export 'package:dartz/dartz.dart' hide State;
export 'package:hive_flutter/hive_flutter.dart';
export 'package:l10n/l10n.dart';
export 'package:internet_connection_checker/internet_connection_checker.dart';
// ?# dev_dependencies:

// ? # self
export 'equatable/equatable.dart'; // make sure macro can lead to error  either hide it or try to use as for alias ,
export 'macros/macros.dart';

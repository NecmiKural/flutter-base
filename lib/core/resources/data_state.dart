import 'dart:async';

/// An abstract class representing the state of data, which can either be a
/// success or a failure.
///
/// [T] is the type of data being handled.
abstract class DataState<T> {
  /// Constructs a [DataState] with an optional [errorMessage] and [resultData].
  DataState({
    this.errorMessage,
    this.resultData,
  });

  /// An optional exception message if the data state represents a failure.
  final String? errorMessage;

  /// The data being handled, if the data state represents a success.
  final T? resultData;

  /// A static method to handle the state of data asynchronously.
  ///
  /// Takes a function [func] that returns a [FutureOr] of type [T].
  ///
  /// Returns a [DataSuccess] if the function completes successfully with data,
  /// or a [DataFailed] if an exception is thrown.
  ///
  /// Example:
  ///
  /// ```dart
  /// final dataState = await DataState.handleDataState(() async {
  ///  return await someAsyncFunction();
  /// });
  /// ```
  static Future<DataState<T>> handleDataState<T>(
    FutureOr<T> Function() func,
  ) async {
    try {
      final data = await func();

      return DataSuccess(data);
    } catch (e) {
    // } catch (e, stackTrace) {
      // Log.error(e.toString(), stackTrace);
      return DataFailed(e.toString());
    }
  }

  /// A static method to call a function based on the given [DataState] object.
  ///
  /// Takes a [DataState] object and two functions, [onSuccess] and [onFailure],
  /// that return a [FutureOr] of type [T].
  ///
  /// !! Note :
  ///
  ///   **This method has a type of [FutureOr void], so it does not return a value.**
  ///
  ///  Use this method when you want to do something with the [DataState] object.
  ///
  /// *Read the end of the comment to see why I use this method.*
  ///
  /// Example:
  /// ```dart
  ///
  /// final dataState = await DataState.handleDataState(() async {
  ///  return await someAsyncFunction();
  /// });
  ///
  /// await DataState.handleDataStateBasedAction(
  ///  dataState,
  /// onSuccess: (data) async {
  ///  print(data.resultData);
  /// Do something with the data.
  /// },
  /// onFailure: (error) async {
  ///  Do something with the error.
  /// print(error.errorMessage);
  /// });
  ///
  /// ```
  ///
  ///  ### Why I use this method? ----
  ///
  ///  Before I wrote this method, I had to write if/else block  every time
  /// I wanted to handle a [DataState] object.
  ///
  /// #### Example --- Before I wrote this method:
  ///
  /// ```dart
  ///  final dataState = DataState object;
  ///
  ///   if (dataState is DataSuccess) {
  ///   Do something with the data.
  /// }
  /// else if (dataState is DataFailed) {
  ///  Do something with the error.
  /// }
  ///
  ///
  /// ```
  /// #### Example --- After I wrote this method:
  /// ```dart
  ///
  /// DataState.handleDataStateBasedAction(
  /// await DataState.handleDataState(() async {
  /// return await someAsyncFunction();
  /// }),
  /// onSuccess: (data) async {
  /// Do something with the data.
  /// print(data.resultData);
  /// },
  /// onFailure: (error) async {
  /// Do something with the error.
  /// print(error.errorMessage);
  /// });
  ///
  static FutureOr<void> handleDataStateBasedAction<T>(
    DataState<T> dataState, {
    /// The function to call if the data state is a [DataSuccess].
    ///
    required FutureOr<void> Function(DataSuccess<T>) onSuccess,

    /// IF the data state is a failure, this function will be called the [onFailure] function.
    /// You can put your failure logic here.
    required FutureOr<void> Function(DataFailed?) onFailure,
  }) async {
    /// IF the data state is a success, call the [onSuccess] function.
    /// You can put your success logic here.
    if (dataState is DataSuccess<T>) {
      await onSuccess(dataState);
    } else {
      /// IF the data state is a failure, this function will be called the [onFailure] function.
      /// You can put your failure logic here.
      onFailure(dataState as DataFailed);
    }
  }
}

/// A class representing a successful data state.
///
/// [T] is the type of data being handled.
final class DataSuccess<T> extends DataState<T> {
  /// Constructs a [DataSuccess] with the given [resultData].
  DataSuccess([T? resultData]) : super(resultData: resultData);
}

/// A class representing a failed data state.
///
/// [T] is the type of data being handled.
final class DataFailed<T> extends DataState<T> {
  /// Constructs a [DataFailed] with the given [errorMessage] message.
  DataFailed(String errorMessage) : super(errorMessage: errorMessage);
}

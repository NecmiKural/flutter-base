/// An abstract class representing a use case in the application.
///
/// This class defines a contract for use cases, which are the
/// application-specific business rules. Each use case should
/// implement this contract to ensure consistency and reusability.
///
/// Type parameters:
/// - `Type`: The type of the result produced by the use case.
/// - `Params`: The type of the parameters required to execute the use case.
///
/// Methods:
/// - `Future<Type> call(Params params)`: Executes the use case with the given
///   parameters and returns a `Future` that completes with the result of type `Type`.
abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

/// A class representing an absence of parameters.
///
/// This class is used when a use case does not require any parameters.
class NoParams {
  /// A class representing an absence of parameters.
  ///
  /// This class is used when a use case does not require any parameters.
  const NoParams();
}

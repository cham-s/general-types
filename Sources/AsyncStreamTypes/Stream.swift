/// A stream with its continuation.
public typealias Stream<Element> = (
  stream: AsyncStream<Element>,
  continuation: AsyncStream<Element>.Continuation
)

/// A throwing stream with its continuation.
public typealias ThrowingStream<Element, E: Error> = (
  stream: AsyncThrowingStream<Element, E>,
  continuation: AsyncThrowingStream<Element, E>.Continuation
)

extension AsyncStream.Continuation where Element: Sendable {
  /// Yields a final value  before finishing.
  ///
  /// Encapuslates two operations:
  /// ```swift
  ///contiunation.yield(value)
  ///contiunation.finish()
  /// ```
  public func yield(finalValue: Element) {
    self.yield(finalValue)
    self.finish()
  }
}

extension AsyncThrowingStream.Continuation where Element: Sendable {
  /// Yields a final value  before finishing.
  ///
  /// Encapuslates two operations:
  /// ```swift
  ///contiunation.yield(value)
  ///contiunation.finish()
  /// ```
  public func yield(finalValue: Element) {
    self.yield(finalValue)
    self.finish()
  }
}

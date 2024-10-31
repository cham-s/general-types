# General Types

> [!WARNING]
> 
> Please be aware that this package is experimental, integration in a production code should be carefully considered. 

## Overview

Shared types used in different Swift packages.

### AsyncStream additions

`Stream` and `ThrowingStream`are simple typealiases.

```swift
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
```

For `AsyncStream` and `AsyncThrowingStream` where `Element` is `Sendable` an additional `yield(finalValue: Element)` method has been added to combine two operations in one: Yielding a final value and finishing the stream.

Small gain but it makes the intent more explicit and help avoid situations where we intend to send a final value and close the stream but we forget to finish the stream leaving the subscriber hanging.

```swift
let intStream = AsyncStream<Int>.makeStream()
// Enqueues values
intStream.continuation.yield(0)
intStream.continuation.yield(1)
intStream.continuation.yield(2)
intStream.continuation.yield(3)

// Yields the final value and ends the stream.
intStream.continuation.yield(finalValue: 4)
/*
Equivalent of:
intStream.continuation.yield(4)
intStream.continuation.finish()
*/
```

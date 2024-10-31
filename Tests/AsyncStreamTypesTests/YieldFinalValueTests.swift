import Testing
import AsyncStreamTypes

@Test func YieldFinalValue() async throws {
  let intStream = AsyncStream<Int>.makeStream()
  
  // Enqueues values
  intStream.continuation.yield(0)
  intStream.continuation.yield(1)
  intStream.continuation.yield(2)
  intStream.continuation.yield(3)
  
  // Yields the final value
  intStream.continuation.yield(finalValue: 4)

  var iterator = intStream.stream.makeAsyncIterator()
  #expect(await iterator.next() == 0)
  #expect(await iterator.next() == 1)
  #expect(await iterator.next() == 2)
  #expect(await iterator.next() == 3)
  #expect(await iterator.next() == 4)
  #expect(await iterator.next() == nil)
}

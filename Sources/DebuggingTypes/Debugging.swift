/// A type used to throw an error on purpose when debuging  and testing for throwring logic.
public struct DebugThrow: Error {
  public let line: Int
  public let file: String
  public let comment: String
  
  public init(
    line: Int = #line,
    file: String = #file,
    comment: String = ""
  ) {
    self.line = line
    self.file = file
    self.comment = comment
  }
}


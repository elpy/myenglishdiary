// swiftlint:disable all
import Amplify
import Foundation

public struct TagGraphQLModel: Model {
  public let id: String
  public var translationId: String
  public var text: String
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      translationId: String,
      text: String) {
    self.init(id: id,
      translationId: translationId,
      text: text,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      translationId: String,
      text: String,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.translationId = translationId
      self.text = text
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}
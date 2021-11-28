// swiftlint:disable all
import Amplify
import Foundation

public struct ExampleGraphQLModel: Model {
  public let id: String
  public var translationId: String
  public var text: String
  public var translation: String
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      translationId: String,
      text: String,
      translation: String) {
    self.init(id: id,
      translationId: translationId,
      text: text,
      translation: translation,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      translationId: String,
      text: String,
      translation: String,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.translationId = translationId
      self.text = text
      self.translation = translation
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}
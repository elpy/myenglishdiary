// swiftlint:disable all
import Amplify
import Foundation

public struct TagGraphQLModel: Model {
  public let id: String
  public var translation: TranslationGraphQLModel
  public var text: String
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      translation: TranslationGraphQLModel,
      text: String) {
    self.init(id: id,
      translation: translation,
      text: text,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      translation: TranslationGraphQLModel,
      text: String,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.translation = translation
      self.text = text
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}
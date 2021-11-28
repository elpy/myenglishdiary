// swiftlint:disable all
import Amplify
import Foundation

public struct TranslationGraphQLModel: Model {
  public let id: String
  public var lexemeId: String
  public var text: String
  public var tip: String?
  public var examples: List<ExampleGraphQLModel>?
  public var tags: List<TagGraphQLModel>?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      lexemeId: String,
      text: String,
      tip: String? = nil,
      examples: List<ExampleGraphQLModel> = [],
      tags: List<TagGraphQLModel> = []) {
    self.init(id: id,
      lexemeId: lexemeId,
      text: text,
      tip: tip,
      examples: examples,
      tags: tags,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      lexemeId: String,
      text: String,
      tip: String? = nil,
      examples: List<ExampleGraphQLModel> = [],
      tags: List<TagGraphQLModel> = [],
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.lexemeId = lexemeId
      self.text = text
      self.tip = tip
      self.examples = examples
      self.tags = tags
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}
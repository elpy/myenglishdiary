// swiftlint:disable all
import Amplify
import Foundation

extension TranslationGraphQLModel {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case lexemeId
    case text
    case tip
    case examples
    case tags
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let translationGraphQLModel = TranslationGraphQLModel.keys
    
    model.pluralName = "TranslationGraphQLModels"
    
    model.attributes(
      .index(fields: ["lexemeId", "text"], name: "byLexeme")
    )
    
    model.fields(
      .id(),
      .field(translationGraphQLModel.lexemeId, is: .required, ofType: .string),
      .field(translationGraphQLModel.text, is: .required, ofType: .string),
      .field(translationGraphQLModel.tip, is: .optional, ofType: .string),
      .hasMany(translationGraphQLModel.examples, is: .optional, ofType: ExampleGraphQLModel.self, associatedWith: ExampleGraphQLModel.keys.translationId),
      .hasMany(translationGraphQLModel.tags, is: .optional, ofType: TagGraphQLModel.self, associatedWith: TagGraphQLModel.keys.translationId),
      .field(translationGraphQLModel.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(translationGraphQLModel.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}
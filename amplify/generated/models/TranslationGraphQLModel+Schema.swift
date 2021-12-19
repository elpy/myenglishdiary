// swiftlint:disable all
import Amplify
import Foundation

extension TranslationGraphQLModel {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case lexeme
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
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.pluralName = "TranslationGraphQLModels"
    
    model.attributes(
      .index(fields: ["lexemeId", "text"], name: "byLexeme")
    )
    
    model.fields(
      .id(),
      .belongsTo(translationGraphQLModel.lexeme, is: .required, ofType: LexemeGraphQLModel.self, targetName: "lexemeId"),
      .field(translationGraphQLModel.text, is: .required, ofType: .string),
      .field(translationGraphQLModel.tip, is: .optional, ofType: .string),
      .hasMany(translationGraphQLModel.examples, is: .optional, ofType: ExampleGraphQLModel.self, associatedWith: ExampleGraphQLModel.keys.translation),
      .hasMany(translationGraphQLModel.tags, is: .optional, ofType: TagGraphQLModel.self, associatedWith: TagGraphQLModel.keys.translation),
      .field(translationGraphQLModel.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(translationGraphQLModel.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}
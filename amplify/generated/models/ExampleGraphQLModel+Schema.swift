// swiftlint:disable all
import Amplify
import Foundation

extension ExampleGraphQLModel {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case translation
    case text
    case meaning
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let exampleGraphQLModel = ExampleGraphQLModel.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.pluralName = "ExampleGraphQLModels"
    
    model.attributes(
      .index(fields: ["translationId", "text"], name: "byTranslation")
    )
    
    model.fields(
      .id(),
      .belongsTo(exampleGraphQLModel.translation, is: .required, ofType: TranslationGraphQLModel.self, targetName: "translationId"),
      .field(exampleGraphQLModel.text, is: .required, ofType: .string),
      .field(exampleGraphQLModel.meaning, is: .required, ofType: .string),
      .field(exampleGraphQLModel.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(exampleGraphQLModel.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}
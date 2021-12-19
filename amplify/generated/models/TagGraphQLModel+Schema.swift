// swiftlint:disable all
import Amplify
import Foundation

extension TagGraphQLModel {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case translation
    case text
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let tagGraphQLModel = TagGraphQLModel.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.pluralName = "TagGraphQLModels"
    
    model.attributes(
      .index(fields: ["translationId", "text"], name: "byTranslation")
    )
    
    model.fields(
      .id(),
      .belongsTo(tagGraphQLModel.translation, is: .required, ofType: TranslationGraphQLModel.self, targetName: "translationId"),
      .field(tagGraphQLModel.text, is: .required, ofType: .string),
      .field(tagGraphQLModel.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(tagGraphQLModel.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}
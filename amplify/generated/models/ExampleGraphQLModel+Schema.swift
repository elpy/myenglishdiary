// swiftlint:disable all
import Amplify
import Foundation

extension ExampleGraphQLModel {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case translationId
    case text
    case translation
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let exampleGraphQLModel = ExampleGraphQLModel.keys
    
    model.pluralName = "ExampleGraphQLModels"
    
    model.attributes(
      .index(fields: ["translationId", "text"], name: "byTranslation")
    )
    
    model.fields(
      .id(),
      .field(exampleGraphQLModel.translationId, is: .required, ofType: .string),
      .field(exampleGraphQLModel.text, is: .required, ofType: .string),
      .field(exampleGraphQLModel.translation, is: .required, ofType: .string),
      .field(exampleGraphQLModel.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(exampleGraphQLModel.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}
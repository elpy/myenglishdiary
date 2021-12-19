// swiftlint:disable all
import Amplify
import Foundation

extension LexemeGraphQLModel {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case language
    case text
    case transcription
    case partOfSpeech
    case forms
    case translations
    case lessCommonTranslations
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let lexemeGraphQLModel = LexemeGraphQLModel.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.pluralName = "LexemeGraphQLModels"
    
    model.fields(
      .id(),
      .field(lexemeGraphQLModel.language, is: .required, ofType: .enum(type: LanguageGraphQlEnum.self)),
      .field(lexemeGraphQLModel.text, is: .required, ofType: .string),
      .field(lexemeGraphQLModel.transcription, is: .optional, ofType: .embeddedCollection(of: String.self)),
      .field(lexemeGraphQLModel.partOfSpeech, is: .optional, ofType: .string),
      .field(lexemeGraphQLModel.forms, is: .optional, ofType: .embeddedCollection(of: String.self)),
      .hasMany(lexemeGraphQLModel.translations, is: .optional, ofType: TranslationGraphQLModel.self, associatedWith: TranslationGraphQLModel.keys.lexeme),
      .hasMany(lexemeGraphQLModel.lessCommonTranslations, is: .optional, ofType: TranslationGraphQLModel.self, associatedWith: TranslationGraphQLModel.keys.lexeme),
      .field(lexemeGraphQLModel.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(lexemeGraphQLModel.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}
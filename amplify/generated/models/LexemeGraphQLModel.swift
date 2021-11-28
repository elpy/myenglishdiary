// swiftlint:disable all
import Amplify
import Foundation

public struct LexemeGraphQLModel: Model {
  public let id: String
  public var language: LanguageGraphQlEnum
  public var text: String
  public var transcription: [String]?
  public var partOfSpeech: String?
  public var forms: [String]?
  public var translations: List<TranslationGraphQLModel>?
  public var lessCommonTranslations: List<TranslationGraphQLModel>?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      language: LanguageGraphQlEnum,
      text: String,
      transcription: [String]? = nil,
      partOfSpeech: String? = nil,
      forms: [String]? = nil,
      translations: List<TranslationGraphQLModel> = [],
      lessCommonTranslations: List<TranslationGraphQLModel> = []) {
    self.init(id: id,
      language: language,
      text: text,
      transcription: transcription,
      partOfSpeech: partOfSpeech,
      forms: forms,
      translations: translations,
      lessCommonTranslations: lessCommonTranslations,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      language: LanguageGraphQlEnum,
      text: String,
      transcription: [String]? = nil,
      partOfSpeech: String? = nil,
      forms: [String]? = nil,
      translations: List<TranslationGraphQLModel> = [],
      lessCommonTranslations: List<TranslationGraphQLModel> = [],
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.language = language
      self.text = text
      self.transcription = transcription
      self.partOfSpeech = partOfSpeech
      self.forms = forms
      self.translations = translations
      self.lessCommonTranslations = lessCommonTranslations
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}
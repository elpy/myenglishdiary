// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "27a457c64e41fdd15ead7496e70aca37"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: LexemeGraphQLModel.self)
    ModelRegistry.register(modelType: TranslationGraphQLModel.self)
    ModelRegistry.register(modelType: ExampleGraphQLModel.self)
    ModelRegistry.register(modelType: TagGraphQLModel.self)
  }
}
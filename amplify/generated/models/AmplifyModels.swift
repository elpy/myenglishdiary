// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "3a402704f268c622ff81474c0b54144d"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: LexemeGraphQLModel.self)
    ModelRegistry.register(modelType: TranslationGraphQLModel.self)
    ModelRegistry.register(modelType: ExampleGraphQLModel.self)
    ModelRegistry.register(modelType: TagGraphQLModel.self)
  }
}
//
//  AmplifyService.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 28.11.2021.
//

import Amplify
import AWSDataStorePlugin
import AWSAPIPlugin

final class AmplifyService {
    var hubEventSubscriber: Any?
    init() {
        initializeAmplifyService()
    }

    private func initializeAmplifyService() {
        let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())

        do {
            try Amplify.add(plugin: dataStorePlugin)
            try Amplify.add(plugin: AWSAPIPlugin())
            try Amplify.configure()

//            Amplify.Logging.logLevel = .verbose
//            hubEventSubscriber = Amplify.Hub.publisher(for: .dataStore).sink { event in
//                if event.eventName == HubPayload.EventName.DataStore.ready {
//                    print("**EVENT**: \(event.eventName)")
//                    print("**EVENT DATA**: \(event.data)")
//                }
//            }
        } catch {
            fatalError("Amplify configuration failed with \(error.localizedDescription)")
        }
    }
}

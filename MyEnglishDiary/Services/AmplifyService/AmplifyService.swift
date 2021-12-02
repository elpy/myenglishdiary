//
//  AmplifyService.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 28.11.2021.
//

import Amplify
import AWSDataStorePlugin

final class AmplifyService {
    init() {
        initializeAmplifyService()
    }

    private func initializeAmplifyService() {
        let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())

        do {
            try Amplify.add(plugin: dataStorePlugin)
            try Amplify.configure()
        } catch {
            fatalError("Amplify configuration failed with \(error.localizedDescription)")
        }
    }
}

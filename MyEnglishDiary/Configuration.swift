//
//  Configuration.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 17.01.2021.
//

import Foundation

enum Configuration {
    case option(value: String)
    case missingKey
    case invalidValue

    // MARK: mongodb/realm configuration options

    static var realmDictionaryProviderAppId: Configuration {
        return Configuration.readValue(for: "RealmDictionaryProviderAppId")
    }

    static var realmMongoDBServiceName: Configuration {
        return Configuration.readValue(for: "RealmMongoDBServiceName")
    }

    static var realmDictionaryDatabaseName: Configuration {
        return Configuration.readValue(for: "RealmDictionaryDatabaseName")
    }

    // MARK: Sentry configuration options

    static var sentryDSN: Configuration {
        return Configuration.readValue(for: "SentryDSN")
    }

    static var sentryDebug: Configuration {
        return Configuration.readValue(for: "SentryDebug")
    }

    private static func readValue(for key: String) -> Configuration {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            return .missingKey
        }

        if let value = object as? String {
            return .option(value: value)
        } else {
            return .invalidValue
        }
    }
}

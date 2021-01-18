//
//  LoggingService.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 18.01.2021.
//

import Foundation
import Sentry

final class LoggingService {
    init() {
        initializeCrashReporting()
    }

    private func initializeCrashReporting() {
        if
            case .option(let sentryDSN) = Configuration.sentryDSN,
            case .option(let sentryDebugString) = Configuration.sentryDebug,
            let sentryDebug = Bool(sentryDebugString)
        {
            SentrySDK.start { options in
                options.dsn = sentryDSN
                options.debug = sentryDebug
            }
        } else {
            fatalError("Invalid Sentry Configuration in Info.plist")
        }
    }
}

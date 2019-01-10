//
//  DonateShortcutIntentAction.swift
//  FlintCore-iOS
//
//  Created by Marc Palmer on 10/01/2019.
//  Copyright © 2019 Montana Floss Co. Ltd. All rights reserved.
//

import Foundation

/// Action that donates the given input (a wrapped INIntent) as a possible shortcut.
///
/// Called from tthe action dispatch observer for actions that indicate ethey should be donated.
/// - see: SiriShortcutDonatingActionDispatchObserver
final class DonateShortcutIntentAction: UIAction {
    typealias InputType = FlintIntentWrapper
    let description = "Donate a shortcut for the specified action, if desired"
    
    static func perform(context: ActionContext<FlintIntentWrapper>, presenter: Void, completion: Completion) -> Completion.Status {
        if #available(iOS 12.0, *) {
            donateToSiri(intent: context.input.intent)
        }
        return completion.completedSync(.success)
    }
}

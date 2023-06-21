//
//  GlobalAppState.swift
//  OpenAI_iOS_Starter
//
//  Created by David Crook on 6/14/23.
//

import Foundation

class GlobalAppState : ObservableObject {
    @Published var excursions: [Excursion]
    @Published var conversation: Conversation

    init(excursions: [Excursion] = Excursion.sampleData, conversation: Conversation = Conversation.sampleData) {
            self.excursions = excursions
            self.conversation = conversation
        }
}

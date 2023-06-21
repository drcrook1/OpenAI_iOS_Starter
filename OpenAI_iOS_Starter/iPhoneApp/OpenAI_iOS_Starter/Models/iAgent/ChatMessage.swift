//
//  ChatMessage.swift
//  OpenAI_iOS_Starter
//
//  Created by David Crook on 6/14/23.
//

import Foundation

class ChatMessage: ObservableObject, Identifiable, Hashable {
    
    public func hash(into hasher: inout Hasher){
        return hasher.combine(self.id)
    }
    
    static func == (lhs: ChatMessage, rhs: ChatMessage) -> Bool {
        if(lhs.id == rhs.id){
            return true
        }
        return false
    }
    
    var id: UUID
    var actor: ChatActor
    var date: Date
    var message: String
    
    init(id: UUID = UUID(), actor: ChatActor, date: Date, message: String) {
            self.id = id
            self.actor = actor
            self.date = date
            self.message = message
        }
}

extension ChatMessage {
    static var empty: ChatMessage {
        ChatMessage(actor: ChatActor(name: "User", isMe: true), date: Date.now, message: "")
    }
}

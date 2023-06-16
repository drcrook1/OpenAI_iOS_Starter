//
//  Conversation.swift
//  OpenAI_iOS_Starter
//
//  Created by David Crook on 6/14/23.
//

import Foundation

struct Conversation {
    var messages: [ChatMessage]
    var date: Date
    
    //init(messages: [ChatMessage], date: Date){
     //   self.messages = messages
     //   self.date = date
    //}
}


extension Conversation {
    static let sampleData: Conversation = Conversation(messages:
    [
        ChatMessage(
            actor: ChatActor(name: "User", isMe: true),
            date: Date.nowPlusComponents(minute:1),
            message: "I would like to go to Boone, NC."
        ),
        ChatMessage(
            actor: ChatActor(name: "iAgent", isMe: false),
            date: Date.nowPlusComponents(minute:2),
            message: "You should go to grandfather mountain!"
        ),
        ChatMessage(
            actor: ChatActor(name: "User", isMe: true),
            date: Date.nowPlusComponents(minute:1),
            message: "Can you make an itinerary around a visit to grandfather mountain including lunch which is dog friendly starting at 9am?"
        ),
        ChatMessage(
            actor: ChatActor(name: "iAgent", isMe: false),
            date: Date.nowPlusComponents(minute:1),
            message: "Most Certainly, here you are sir! <LIST OUT THE ITINERARY>.  Would you like me to save this or would you like to continue to modify it with me?  You can also modify it yourself after it is saved."
        ),
        ChatMessage(
            actor: ChatActor(name: "User", isMe: true),
            date: Date.nowPlusComponents(minute:1),
            message: "Please save it."
        ),
    ],
    date: Date.now)
}

extension Conversation {
    static var empty: Conversation {
        Conversation(messages: [], date: Date.now)
    }
}

//
//  MessageCardView.swift
//  OpenAI_iOS_Starter
//
//  Created by David Crook on 6/14/23.
//

import SwiftUI

struct MessageCardView: View {
    var message: ChatMessage
    var body: some View {
        VStack(alignment: message.actor.isMe ? .trailing : .leading){
            HStack{
                Text("\(message.actor.name)")
                    .scaleEffect(0.75, anchor: .leading)
                Text("\(message.date.timeAsString())")
                    .scaleEffect(0.75, anchor: .leading)
            }
            Text("\(message.message)")
        }
        .padding(3)
    }
}

struct MessageCardView_Previews: PreviewProvider {
    static var previews: some View {
        MessageCardView(message: Conversation.sampleData.messages[3])
    }
}

//
//  MessageInputView.swift
//  OpenAI_iOS_Starter
//
//  Created by David Crook on 6/14/23.
//

import SwiftUI

struct MessageInputView: View {
    @EnvironmentObject var appState: GlobalAppState
    @State var message: ChatMessage = ChatMessage.empty
    var body: some View {


                HStack{
                    TextField("Your Message", text: $message.message, axis: .vertical)
                        .lineLimit(5)
                    Button("Send"){
                        appState.conversation.messages.append(message)
                        message = ChatMessage.empty
                    }
                }
                .padding()


    }
}

struct MessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        MessageInputView()
    }
}

//
//  iAgent.swift
//  OpenAI_iOS_Starter
//
//  Created by David Crook on 6/14/23.
//

import SwiftUI

struct iAgentView: View {
    @EnvironmentObject var appState: GlobalAppState
    var body: some View {
        ScrollViewReader { scrollView in
            VStack{
                ScrollView(.vertical) {
                    VStack{
                        ForEach(appState.conversation.messages){ message in
                            MessageCardView(message: message)
                                .background(message.actor.isMe ? Color.clear : Color.accentColor)
                                .foregroundColor(Color.primary)
                                .cornerRadius(6)
                                .frame(maxWidth: .infinity, alignment: message.actor.isMe ? .trailing : .leading)
                        }
                    }.id("messagesView")
                    
                }
                .onChange(of: appState.conversation.messages){ _ in
                    withAnimation{
                        scrollView.scrollTo("messagesView", anchor: .bottom)
                    }
                }
                Spacer()
                MessageInputView()
                    .background(.ultraThinMaterial)
            }
        }
       // .safeAreaInset(edge: .bottom){

        //}
    }
}

struct iAgentView_Previews: PreviewProvider {
    static var previews: some View {
        iAgentView().environmentObject(GlobalAppState())
    }
}

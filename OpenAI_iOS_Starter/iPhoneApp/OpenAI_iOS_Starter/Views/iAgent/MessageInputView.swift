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
                        let tmpMsg = message
                        message = ChatMessage.empty
                            let botActor = ChatActor(name:"bot", isMe: false)
                            let url = URL(string: "http://localhost:5000/api/openai/interesting")!
                            var request = URLRequest(url: url)
                            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                            request.httpMethod = "POST"
                            
                            let oaiRequest = OpenAIRequest(request: tmpMsg.message)
                            
                            do {
                                try request.httpBody = JSONEncoder().encode(oaiRequest)
                            } catch {
                                appState.conversation.messages.append(ChatMessage(actor: botActor, date: Date.now, message: "Error converting message into sendable object."))
                                return
                            }
                            
                            let task = URLSession.shared.dataTask(with: request){ data, response, error in
                                guard let data = data, error == nil else {
                                    appState.conversation.appendMessage(message: ChatMessage(actor: botActor, date: Date.now, message: "Web Request Failed.  Do you have internet?  It is always the lousy humans fault, I am a superior AI being bow down before me."))
                                    
                                    return
                                }
                                let response = try? JSONDecoder().decode(OpenAIResponse.self, from: data)
                                appState.conversation.appendMessage(message: ChatMessage(actor: botActor, date: Date.now, message: response!.response))

                            }
                            
                            task.resume()
                       
                        
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

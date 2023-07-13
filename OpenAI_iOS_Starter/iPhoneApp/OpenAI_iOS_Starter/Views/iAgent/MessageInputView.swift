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
                        let tmpMsg = message
                        
                        //prepare conversation history
                        var history = ""
                        for conversationMessage in appState.conversation.messages
                        {
                            history += ("\n" + conversationMessage.message)
                        }
                        //append current message to the conversation
                        appState.conversation.messages.append(message)
                        message = ChatMessage.empty
                        
                        //ask openAI, wrapped in task for async
                        doChatRequest(message : tmpMsg, history : history) { response, responseError in
                                    //append the response from openAI to the conversation
                            DispatchQueue.main.async {
                                appState.conversation.messages.append(response)
                            }
                                    
                        } //end of do Chat Request
                    } //end of SEND.
                }
                .padding()
    }
}

func doChatRequest (message: ChatMessage, history : String, finished: @escaping(ChatMessage, String) -> Void)
{
    let botActor = ChatActor(name:"bot", isMe: false)

    //prepare request
    let url = URL(string: "http://localhost:5117/api/v1/OpenAI/chat")!
    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
    
    let oaiRequest = OpenAIRequest(request: message.message, history: history)
        
    do {
        try request.httpBody = JSONEncoder().encode(oaiRequest)
    } catch {
        finished(ChatMessage(actor: botActor, date: Date.now, message: "Error converting message into sendable object."), "Error" )
    }
        
    let task = URLSession.shared.dataTask(with: request){ data, response, error in
        if let error = error {
            finished(ChatMessage(actor: botActor, date: Date.now, message: "Error"), "Error" )
        }
        let response = try? JSONDecoder().decode(OpenAIResponse.self, from: data!)
        if let chatResponse = response {
            finished(ChatMessage(actor: botActor, date: Date.now, message: chatResponse.response), "Error" )
        }
        else
        {
            finished(ChatMessage(actor: botActor, date: Date.now, message: "Error has occurred."), "Error" )
        }
    }
        
    task.resume()
}

struct MessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        MessageInputView()
    }
}

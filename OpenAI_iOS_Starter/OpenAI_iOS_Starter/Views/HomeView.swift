//
//  ScrumsView.swift
//  OpenAI_iOS_Starter
//
//  Created by David Crook on 6/5/23.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var excursions: [Excursion]
    @State private var addExcursion = Excursion.empty
    @State private var isPresentingEditView = false
    
    var body: some View {
        NavigationStack{
            List($excursions) { $excursion in
                NavigationLink(destination: ExcursionView(excursion: $excursion)){
                    ExcursionCardView(excursion: excursion)
                }
            }
            .navigationTitle("Upcoming Excursions")
            .toolbar {
                    Button(action: {isPresentingEditView = true}){
                        Image(systemName: "plus")
                    }
            }
            .sheet(isPresented: $isPresentingEditView) {
                NavigationStack {
                    ExcursionEditView(excursion: $addExcursion)
                        .navigationTitle("New Excursion")
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isPresentingEditView = false
                                    addExcursion = Excursion.empty
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Add") {
                                    isPresentingEditView = false
                                    excursions.append(addExcursion)
                                    addExcursion = Excursion.empty
                                }
                            }
                        }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(excursions: .constant(Excursion.sampleData))
    }
}

//
//  ScrumsView.swift
//  OpenAI_iOS_Starter
//
//  Created by David Crook on 6/5/23.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var excursions: [Excursion]
    
    var body: some View {
        NavigationStack{
            List($excursions) { $excursion in
                NavigationLink(destination: ExcursionView(excursion: $excursion)){
                    ExcursionCardView(excursion: excursion)
                }
            }
            .navigationTitle("Upcoming Excursions")
            .toolbar {
                Button(action: {}){
                    Image(systemName: "plus")
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

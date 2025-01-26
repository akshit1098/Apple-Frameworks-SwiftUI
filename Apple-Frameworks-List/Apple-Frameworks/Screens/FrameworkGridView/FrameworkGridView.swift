//
//  ContentView.swift
//  Apple-Frameworks
//
//  Created by Akshit Saxena on 1/22/25.
//

import SwiftUI

struct FrameworkGridView: View {
    
    // State object will stay and persist and maintain it's state even when everytime the struct is destroyed and re-render
    @StateObject var viewModel = FrameworkGridVewModel()
    
    
    
    var body: some View {
        NavigationView{
            
            List {
                // ForEcah will use framework id to iterate over
                //List has inbuilt onTap
                ForEach(MockData.frameworks) { framework in
                    NavigationLink(destination: FrameworkDetailView(framework: framework, isShowingDetailView: $viewModel.isShowingDetailView)){
                        FrameworkTitleView(framework: framework)
                    }
                    
                    
                }
                
                
            }
            
            .navigationTitle("Apple Frameworks")
            
        }
        .accentColor(Color(.label))

        
        
        
    }
}

#Preview {
    FrameworkGridView()
        .preferredColorScheme(.dark)
}



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
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    // ForEcah will use framework id to iterate over
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                // we are assigning the slectedFramework to the framework
                                viewModel.selectedFramework = framework
                            }
                    }
                    
                    
                }
            }
            .navigationTitle("Apple Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                FrameworkDetailView(framework: viewModel.selectedFramework!, isShowingDetailView: $viewModel.isShowingDetailView)
            }
        }
        .preferredColorScheme(.dark)
        
        
      
    }
}

#Preview {
    FrameworkGridView()
        .preferredColorScheme(.dark)
}



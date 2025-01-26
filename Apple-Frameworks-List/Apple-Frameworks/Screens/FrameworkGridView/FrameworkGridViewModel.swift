//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Akshit Saxena on 1/24/25.
//

import SwiftUI

//Observable so that it can say whenever changes happen
    // final keyword is used when we don't want the classes to subclass further

final class FrameworkGridVewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet {
            // whenever selected framework changes, it will make isShowDeatilVIew true (when we tap)
            isShowingDetailView = true
        }
    }
    
    
    
    // we are setting up isShowingDetailView as publishable so that whenever isShowDetail changes, it will publish the change
    // and our GridView will listen to that and change when it updates
    @Published var isShowingDetailView = false
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())] // number of vertical columns = 2
    
}

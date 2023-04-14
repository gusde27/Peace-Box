import SwiftUI

struct ContentView: View {
    var body: some View {
        
        //call main VC
        MainVCView()
        
    }
}

//bridge SwiftUI and UIKit
struct MainVCView: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        //view controller object
        //return MainViewController()
        return UINavigationController(rootViewController: StoryViewController())
        
    }
    
}




import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Linked List", destination: LinkedListView())
                NavigationLink("Union Find", destination: UnionFindView())
            }
            .navigationTitle("AADS")
        }
    }
}

//
//  ContentView.swift
//  capital-one-greatest-percentage
//
//  Created by Michael Barry on 1/5/22.
//

import SwiftUI

struct Course: Hashable, Codable {
  let name: String
  let image: String
}
class ViewModel: ObservableObject {
  @Published var courses: [Course] = []
  func fetch() {
    guard let url = URL(string:
      "https://iosacademy.io/api/v1/courses/index.php") else {
      return
    }
    let task = URLSession.shared.dataTask(with: url) { [weak
      self] data, _,error in
      guard let data = data, error == nil else {
        return
      }
      // Convert to JSON
      do {
        let courses = try JSONDecoder().decode([Course].self,
          from: data)
        DispatchQueue.main.async {
          self?.courses = courses
        }
      }
      catch {
        print("Error")
        print(error)
      }
    }
    task.resume()
  }
}
struct ContentView: View {
  @StateObject var viewModel = ViewModel()
  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.courses, id: \.self) { course in
          HStack {
            Text(course.name).bold()
          }.padding(3)
        }
      }
      .onAppear {viewModel.fetch()}
    }
  }
}
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

import SwiftUI

struct ContentView: View {
    @State private var numberOfTeams: Int = 2
    @State private var groups: [String] = []
    
    var body: some View {
        VStack {
            Text("Number of Teams: \(numberOfTeams)")
                .font(.headline)
            
            Stepper(value: $numberOfTeams, in: 2...10) {
                Text("\(numberOfTeams)")
                    .font(.title)
            }
            .padding()
            
            Button(action: {
                groups = generateGroups(numberOfTeams: numberOfTeams)
            }) {
                Text("Generate Groups")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            
            VStack {
                ForEach(0..<groups.count, id: \.self) { index in
                    Text("Group \(index + 1): \(groups[index])")
                        .font(.title)
                }
            }
        }
        .padding()
    }
    
    func generateGroups(numberOfTeams: Int) -> [String] {
        var teams = Array(1...numberOfTeams)
        var groups: [String] = []
        
        while teams.count > 0 {
            let randomIndex = Int.random(in: 0..<teams.count)
            let team = teams.remove(at: randomIndex)
            groups.append("Team \(team)")
        }
        
        return groups
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

import SwiftUI
import MapKit
import _MapKit_SwiftUI

struct ContentView: View {
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -14.400, longitude: -51.000),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
    @State private var selectedLocation: Location? = nil
    @State private var showingSheet = false
    @State private var lugares: [Location] = []

    var body: some View {
        ZStack {
            Map(position: $position) {
                ForEach(lugares) { lugar in
                    Annotation(lugar.name, coordinate: lugar.coordenate, content: {
                        AsyncImage(url: URL(string: "https://cdn-icons-png.flaticon.com/512/191/191566.png")) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60)
                            case .failure:
                                Text("Failed to load image")
                            @unknown default:
                                Text("Unknown error")
                            }
                        }
                        .onTapGesture {
                            showingSheet.toggle()
                        }
                    })
                }
            }
            .ignoresSafeArea()
            
            VStack {
                Text("\(selectedLocation?.name ?? "desconhecido")")
                
                Spacer()
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(lugares) { lugar in
                            Button(action: {
                                position = MapCameraPosition.region(
                                    MKCoordinateRegion(
                                        center: lugar.coordenate,
                                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                                    )
                                )
                                selectedLocation = lugar
                            }) {
                                HStack {
                                    Text(lugar.name)
                                }
                            }
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }
                        .padding(.bottom, 10)
                    }
                }
                .padding()
            }
        }
        .sheet(isPresented: $showingSheet) {
            if let location = selectedLocation {
                LocationDetailView(location: location)
            }
        }
        .onAppear(perform: fetchUserData)
    }

    func fetchUserData() {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        
        guard let url = URL(string: urlString) else {
            print("URL inválida")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Erro na solicitação: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Resposta inválida ou status code não OK")
                return
            }
            
            guard let data = data else {
                print("Dados não encontrados")
                return
            }
            
            do {
                let users = try JSONDecoder().decode([UserResponse].self, from: data)
                
                // Mapeia os usuários para a estrutura Location
                DispatchQueue.main.async {
                    lugares = users.map { user in
                        Location(
                            name: user.name,
                            coordenate: CLLocationCoordinate2D(
                                latitude: Double(user.address.geo.lat) ?? 0,
                                longitude: Double(user.address.geo.lng) ?? 0
                            ),
                            flag: "https://upload.wikimedia.org/wikipedia/commons/6/6f/Blue_dot.svg", // Imagem genérica
                            description: "Descrição do usuário \(user.name)"
                        )
                    }
                }
            } catch {
                print("Erro ao decodificar os dados: \(error.localizedDescription)")
            }
        }.resume()
    }
}

struct LocationDetailView: View {
    let location: Location
    
    var body: some View {
        VStack {
            Text(location.name)
                .font(.largeTitle)
                .padding()
            
            AsyncImage(url: URL(string: location.flag)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                case .failure:
                    Text("Failed to load image")
                @unknown default:
                    Text("Unknown error")
                }
            }
            
            Text(location.description)
                .padding()
            
            Spacer()
        }
        .navigationTitle("Details")
    }
}

#Preview {
    ContentView()
}

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordenate: CLLocationCoordinate2D
    let flag: String
    let description: String
}

struct UserResponse: Codable {
    let id: Int
    let name: String
    let address: Address
}

struct Address: Codable {
    let geo: Geo
}

struct Geo: Codable {
    let lat: String
    let lng: String
}

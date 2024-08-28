//
//  ContentView.swift
//  mapa
//
//  Created by Turma02-24 on 28/08/24.
//
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
    
    var body: some View {
        VStack {
            Text("\(selectedLocation?.name ?? "desconhecido")")
            Map(position: $position)
                .ignoresSafeArea()
            
            ScrollView(.horizontal) {
                HStack{
                ForEach(lugares) { lugar in
                    
                    Button(action: {
                        position = MapCameraPosition.region(
                            MKCoordinateRegion(
                                center: lugar.coordenate,
                                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                            )
                        )
                        selectedLocation = lugar
                        showingSheet = true
                    }) {
                        HStack{
                            AsyncImage(url: URL(string: "\(lugar.flag)")) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30)
                                case .failure:
                                    Text("Failed to load image")
                                @unknown default:
                                    Text("Unknown error")
                                }
                            }
                            Text(lugar.name)
                            
                        }
                    }.padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.bottom, 10)
                }
            }
            .padding()
        }
        .sheet(isPresented: $showingSheet) {
            if let location = selectedLocation {
                LocationDetailView(location: location)
            }
        }
    }
}

struct LocationDetailView: View {
    let location: Location
    
    var body: some View {
        VStack {
            Text(location.name)
                .font(.largeTitle)
                .padding()
            
        
            AsyncImage(url: URL(string: "\(location.flag)")) { phase in
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

var lugares: [Location] = [
    Location(name: "Varzea Alegre", coordenate: CLLocationCoordinate2D(latitude: -5.35, longitude: -40.3833), flag: "https://upload.wikimedia.org/wikipedia/commons/d/d7/Bandeiravarzeaalegre.jpg", description: "Melhor lugar do mundo"),
    Location(name: "Granito City", coordenate: CLLocationCoordinate2D(latitude: -7.71212, longitude: -39.6145), flag: "https://upload.wikimedia.org/wikipedia/commons/d/d0/Granito-pe.png", description: "Lar da mulher mais linda do mundo")
]

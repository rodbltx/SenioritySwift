//
//  Webservice.swift
//  SenioritySwift
//
//  Created by Carlos Rodrigo Salas Centeno on 21/03/23.
//

import Foundation

class Webservice {

    func downloadSkills(completion: @escaping ([Skill]) -> ()) {
        guard let url = URL(string: "https://rodbltx.github.io/senioritydata/skills.json") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error al descargar el archivo JSON: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No se encontró el archivo JSON")
                return
            }

            do {
                let decoder = JSONDecoder()
                let skills = try decoder.decode([Skill].self, from: data)
                completion(skills)
            } catch let error {
                print("Error al decodificar el archivo JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}


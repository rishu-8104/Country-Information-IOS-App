//
//  CountryManager.swift
//  EUMembers
//
//  Created by Rishu Kumar on 21.4.2023.
//

import Foundation

class CountryManager: ObservableObject {
    @Published var countries: [Country]
    
    init() {
        self.countries = []
        self.loadCountriesWithURLSession()
    }
    
    // AWS Lambda function URL to load the country data from (will be deactivated
    // after the course final iOS app assignment deadline has passed):
    let urlString = "https://wy3dsyi6k62vlns5tmm72zlbcu0vnxda.lambda-url.eu-north-1.on.aws/"
    
    // Recommended method: Load the country data from the URL asynchronously
    // using URLSession. Note that the published property must be updated
    // from the main thread, that is why it is wrapped in DispatchQueue.main.async block.
    private func loadCountriesWithURLSession() {
        if let url = URL(string: urlString) {
            print("About to hit lambda function URL to get countries (URLSession)")
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let jsonData = data {
                    let decoder = JSONDecoder()
                    if let countries = try? decoder.decode([Country].self, from: jsonData) {
                        print("Countries loaded from lambda function URL (URLSession)")
                        
                        // Whenever the published property is changed,
                        // it will be reflected in the UI. But the changes
                        // must be made on the main thread, where the UI runs.
                        DispatchQueue.main.async {
                            self.countries = []
                        }
                        
                        // At this point everything has been downloaded from the network.
                        // Just for fun, add the countries one by one, with a small delay.
                        
                        for country in countries {
                            DispatchQueue.main.async {
                                self.countries.append(country)
                            }
                            Thread.sleep(forTimeInterval: 0.01)
                        }
                    }
                    else {
                        print("Error parsing JSON data")
                    }
                } else if let error = error {
                    print("Unable to retrieve JSON data, error: \(error)")
                }
            }
            task.resume()  // It's easy to forget this! Ask me how I know :-)
        }
        else {
            print("Bad URL")
        }
    }
    
    // When you get the network download working asynchronously,
    // you can delete everything from here down!
    // But parsing JSON from a string can still be useful for quick testing.
    
    // Reads the data from the URL synchronously.
    // Not recommended, since this can block the UI thread.
    // Xcode will warn you about that.
    private func loadCountries() {
        if let url = URL(string: urlString) {
            print("About to hit lambda function URL to get countries (Data)")
            if let jsonData = try? Data(contentsOf: url) {
                let decoder = JSONDecoder()
                if let countries = try? decoder.decode([Country].self, from: jsonData) {
                    self.countries = countries
                    print("Countries loaded from lambda function URL")
                }
                else {
                    print("Error parsing JSON data")
                }
            }
            else {
                print("Unable to retrieve JSON data")
            }
        }
        else {
            print("Bad URL")
        }
    }
    
    
}

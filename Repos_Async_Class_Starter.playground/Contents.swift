import SwiftUI
import Foundation

// Simplified decodable structs from earlier exercise
struct Repositories: Decodable {
  let repos: [Repository]

  enum CodingKeys : String, CodingKey {
    case repos = "items"
  }
}

struct Repository: Decodable {
  let name: String
  let htmlURL: String

  enum CodingKeys : String, CodingKey {
    case name
    case htmlURL = "html_url"
  }
}

// Our initial function (needs fixing...)
func fetchRepositories() async throws -> [Repository] {
  let url = URL(string: "https://api.github.com/search/repositories?q=language:swift&sort=stars&order=desc")!
  let (data, _) = try await URLSession.shared.data(from: url)
  return try JSONDecoder().decode(Repositories.self, from: data).repos
}


// A task to utilize this function
// - call function then loop over repos array to print out the name & url for each
// - interject lots of print statements with 'Step X' to see how things are progressing
Task {
  print("Step 1")
  let repos = try await fetchRepositories()
  print("Step 2")
  do {
    print("Step 3")
    for repo in repos {
      print(" - \(repo.name): \(repo.htmlURL) ")
    }
    
  } catch {
    print("Step 4")
    print(error)
  }

  // ...

  print("Step 5")
}
print("Step 6")


/*
 CONSOLE OUTPUT:
 Step 1
 Step 6
 Step 2
 Step 3
  - awesome-ios: https://github.com/vsouza/awesome-ios
  - Alamofire: https://github.com/Alamofire/Alamofire
  - iina: https://github.com/iina/iina
  - ShadowsocksX-NG: https://github.com/shadowsocks/ShadowsocksX-NG
  - swift-algorithm-club: https://github.com/kodecocodes/swift-algorithm-club
  - Charts: https://github.com/danielgindi/Charts
  - lottie-ios: https://github.com/airbnb/lottie-ios
  - RxSwift: https://github.com/ReactiveX/RxSwift
  - vapor: https://github.com/vapor/vapor
  - SwiftyJSON: https://github.com/SwiftyJSON/SwiftyJSON
  - Hero: https://github.com/HeroTransitions/Hero
  - Kingfisher: https://github.com/onevcat/Kingfisher
  - clashX: https://github.com/yichengchen/clashX
  - Aerial: https://github.com/JohnCoates/Aerial
  - ReactiveCocoa: https://github.com/ReactiveCocoa/ReactiveCocoa
  - MonitorControl: https://github.com/MonitorControl/MonitorControl
  - Rectangle: https://github.com/rxhanson/Rectangle
  - SnapKit: https://github.com/SnapKit/SnapKit
  - SwiftLint: https://github.com/realm/SwiftLint
  - UTM: https://github.com/utmapp/UTM
  - IQKeyboardManager: https://github.com/hackiftekhar/IQKeyboardManager
  - SwiftGuide: https://github.com/ipader/SwiftGuide
  - CodeEdit: https://github.com/CodeEditApp/CodeEdit
  - Carthage: https://github.com/Carthage/Carthage
  - OpenEmu: https://github.com/OpenEmu/OpenEmu
  - Moya: https://github.com/Moya/Moya
  - Spring: https://github.com/MengTo/Spring
  - PromiseKit: https://github.com/mxcl/PromiseKit
  - Perfect: https://github.com/PerfectlySoft/Perfect
  - Design-Patterns-In-Swift: https://github.com/ochococo/Design-Patterns-In-Swift
 Step 5
 */

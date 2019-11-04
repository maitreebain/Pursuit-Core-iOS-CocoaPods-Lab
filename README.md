# Pursuit-Core-iOS-CocoaPods-Lab

### [Random User Generator API](https://randomuser.me/documentation)

Display a list of at least 50 users showing their name and email address.  Selecting a user should segue to a detailVC showing their full address, phone number, and date of birth.  The detail View Controller should be done programmatically, without a using Storyboards.  Use AlamoFire for networking, and SnapKit to draw your UI:

Use the following Pods in your project

- [AlamoFire](https://github.com/Alamofire/Alamofire)
- [SnapKit](https://github.com/SnapKit/SnapKit)

Focus on the Pod integrations: you can use the following structs to model the data:

```swift
import Foundation

struct ResultsWrapper: Codable {
    let results: [User]
}

struct User: Codable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let dob: BirthdayInfo
    let phone: String
    let cell: String
    let picture: UserImageInfo
    
    static func getUsers(from jsonData: Data) -> [User] {
        do {
            let resultsWrapper = try JSONDecoder().decode(ResultsWrapper.self, from: jsonData)
            return resultsWrapper.results
        } catch {
            print(error)
            return []
        }
    }
}

struct Name: Codable {
    let title: String
    let first: String
    let last: String
}

struct Location: Codable {
    let street: Street
    let city: String
    let state: String
    let postcode: String
    
    enum CodingKeys: String, CodingKey {
        case street, city, state, postcode
    }
    
    //https://stackoverflow.com/questions/47935705/using-codable-with-key-that-is-sometimes-an-int-and-other-times-a-string
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        street = try container.decode(Street.self, forKey: .street)
        city = try container.decode(String.self, forKey: .city)
        state = try container.decode(String.self, forKey: .state)
        if let postCodeInt = try? container.decode(Int.self, forKey: .postcode) {
            postcode = String(postCodeInt)
        } else {
            postcode = try container.decode(String.self, forKey: .postcode)
        }
    }
}

struct Street: Codable {
    let number: Int
    let name: String
}

struct BirthdayInfo: Codable {
    let date: String
    let age: Int
}

struct UserImageInfo: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}
```

## Bonus

- Refactor your Table View to use a [Slanted Collection View](https://github.com/yacir/CollectionViewSlantedLayout?utm_source=mybridge&utm_medium=blog&utm_campaign=read_more)
- Add in a pod of your choice from the list [here](https://medium.mybridge.co/23-amazing-ios-ui-libraries-written-in-swift-for-the-past-year-v-2019-3e5456318768)

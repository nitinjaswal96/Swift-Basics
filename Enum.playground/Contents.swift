import UIKit

// 1. Enum

enum SocialPlatform {
    case twitter
    case facebook
    case instagram
    case linkedIn
}

func shareImage(on platform: SocialPlatform) {

    switch platform {
    case .twitter:
        debugPrint("This is where the code would go to share the image on Twitter")
    case .facebook:
        debugPrint("This is where the code would go to share the image on Facebook")
    case .instagram:
        debugPrint("This is where the code would go to share the image on Instagram")
    case .linkedIn:
        debugPrint("This is where the code would go to share the image on LinkedIn")
    }
}

shareImage(on: .linkedIn)

// 2. Enum Constants

enum ItemInfoType {
    case location
    case repos
    case gists
    case followers
    case following
}


enum SFSymbols {
    static let location  = UIImage(systemName: "mappin.and.ellipse")
    static let repos     = UIImage(systemName: "folder")
    static let gists     = UIImage(systemName: "text.alignleft")
    static let followers = UIImage(systemName: "heart")
    static let following = UIImage(systemName: "person.2")
}



func set(itemInfoType: ItemInfoType, withCount count: Int) {
    let symbolImageView = UIImageView()
    
    switch itemInfoType {
    case .location:
        symbolImageView.image = SFSymbols.location
        debugPrint("location: \(count)")
    case .repos:
        symbolImageView.image = SFSymbols.repos
        debugPrint("repos: \(count)")
    case .gists:
        symbolImageView.image = SFSymbols.gists
        debugPrint("gists: \(count)")
    case .followers:
        symbolImageView.image = SFSymbols.followers
        debugPrint("followers: \(count)")
    case .following:
        symbolImageView.image = SFSymbols.following
        debugPrint("following: \(count)")
    }
}

set(itemInfoType: .followers, withCount: 5)


// 3. Enum with Raw Value and Case Iterable

enum SocialPlatforms: String, CaseIterable {
    case twitters   = "This is my favourite!"
    case facebooks  = "I never use this."
    case instagrams = "Pretty Pictures"
    case linkedIns  = "I need to start posting here"
}

func getOpinnion(on platform: SocialPlatforms) {
    let opinion = platform.rawValue
    print(opinion)
}

getOpinnion(on: .facebooks)

debugPrint(SocialPlatforms.allCases.count)

for platform in SocialPlatforms.allCases {
    print(platform.rawValue)
}

// 4. Enum with Associated Values

enum SocialMediaPlatform {
    case twitter(followings: Int)
    case youtube(subscriers: Int)
    case instagram
    case linkedIn
}

func allowPostVideo(for platform: SocialMediaPlatform) {
    switch platform {
    case .twitter(let followings) where followings > 10_000:
        debugPrint("Eligible for Tweeting")
    case .youtube(let subscriers) where subscriers > 25_000:
        debugPrint("Eligible for VideoUploading")
    default:
        debugPrint("Not Eligible")
    }
}

allowPostVideo(for: .twitter(followings: 1000))


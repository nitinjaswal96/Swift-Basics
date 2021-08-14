import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


class Developer
{

    var didAddTwoNumbers : ((Int) -> Void)?
    func developerWillAddTwoNumber(a: Int, b: Int)
    {
        didAddTwoNumbers!(a + b)
    }
}

class Manager
{
    var developer: Developer?

    init(_developer: Developer) {
        developer = _developer
        developer?.didAddTwoNumbers = {additionResult in debugPrint("addition result = \(additionResult)")}
    }

    func addTwoNumber(x: Int, y: Int)
    {
        developer?.developerWillAddTwoNumber(a: x, b: y)
        
    }
}

let objManager = Manager(_developer: Developer())
objManager.addTwoNumber(x: 10, y: 20)



/**
 To keep simple if definition of function is different use Closures otherwise if its common and one want to reuse it go with Protocol.   Note: we can make the function in protocol @objc optional, to avoid it to force to define the function
 */
struct Image
{
    static let imageUrl = "https://www.syanart.com/wp-content/uploads/bfi_thumb/Dragon-Ball-Super-Goku-Ultra-Instinct-White-4K-1024x576-3700nnnlymflyci783q8e8.jpg"

    static let headerProfileImage = "https://i.redd.it/crk5dwksgkd31.jpg"
}


@objc protocol ImageDownloadDelegate : class
{
    func didFinishDownloadingImage(imageData: Data?)
    @objc optional func didPauseDownload()
}

class ImageDownloader //Just like the developer class
{
    weak var delegate: ImageDownloadDelegate?

    func downloadImageFromServer(url: URL)
    {
        URLSession.shared.dataTask(with:url) { (imageData, response, error) in
            //return the result to the calling class
            self.delegate?.didFinishDownloadingImage(imageData: imageData)
        }.resume()
    }
}

class ProfileImageViewer : ImageDownloadDelegate //Just like the manager class
{
//    func didPauseDownload() {
//
//    }

    var imageDownloader: ImageDownloader?
    var profileHeaderImageDownloader : ImageDownloader?

    init(_imageDownloader: ImageDownloader) {
        imageDownloader = _imageDownloader

        //profile image
        imageDownloader?.delegate = self
        imageDownloader?.downloadImageFromServer(url: URL(string: Image.imageUrl)!)

        //header image
        profileHeaderImageDownloader?.delegate = self
        profileHeaderImageDownloader?.downloadImageFromServer(url: URL(string: Image.headerProfileImage)!)

    }

    func didFinishDownloadingImage(imageData: Data?)
    {
        _ = UIImage(data: imageData!)
    }
}

let objProfileImageViewer = ProfileImageViewer(_imageDownloader: ImageDownloader())


class ImageClosureDownloader //Just like the developer class
{

    var didDownloadImage : ((Data?) -> Void)?
    var didPauseDownloadImage : (()-> Void)?

    func downloadImageFromServer(url: URL)
    {
        URLSession.shared.dataTask(with:url) { (imageData, response, error) in
            //return the result to the calling class
            self.didDownloadImage!(imageData)
        }.resume()
    }
}

class ProfileClosureImageViewer //Just like the manager class
{
    var imageClosureDownloader: ImageClosureDownloader?
    var profileHeaderClosureDownloader : ImageClosureDownloader?

    init(_imageClosureDownloader: ImageClosureDownloader) {
        imageClosureDownloader = _imageClosureDownloader

        imageClosureDownloader?.didDownloadImage = {downloadedImage in
            debugPrint("image = \(String(describing: downloadedImage))")
            _ = UIImage(data: downloadedImage!)
        }

        profileHeaderClosureDownloader?.downloadImageFromServer(url: URL(string: Image.headerProfileImage)!)

        profileHeaderClosureDownloader?.didDownloadImage = {profileHeaderImage in
             debugPrint("image = \(String(describing: profileHeaderImage))")
                       _ = UIImage(data: profileHeaderImage!)
        }

        imageClosureDownloader?.downloadImageFromServer(url: URL(string: Image.imageUrl)!)
    }
}

let objProfileClosureImageViewer = ProfileClosureImageViewer(_imageClosureDownloader: ImageClosureDownloader())


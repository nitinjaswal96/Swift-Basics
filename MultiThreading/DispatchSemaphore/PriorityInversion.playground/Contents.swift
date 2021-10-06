import UIKit

let highPriority = DispatchQueue.global(qos: .userInitiated)
let lowPriority = DispatchQueue.global(qos: .utility)
let defaultPriority = DispatchQueue.global(qos: .default)

let semaphore = DispatchSemaphore(value: 1)

func printEmoji(queue: DispatchQueue, emoji: String)
{
    queue.async {

        debugPrint("\(emoji) waiting")
        semaphore.wait()

        for i in 0...10 {
            debugPrint("\(emoji) \(i)")
        }

        debugPrint("\(emoji) signal")
        semaphore.signal()
    }
}

printEmoji(queue: highPriority, emoji: "🚑")
printEmoji(queue: lowPriority, emoji: "🚙")
printEmoji(queue: defaultPriority, emoji: "🏎")

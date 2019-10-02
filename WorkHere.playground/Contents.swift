import UIKit
import PlaygroundSupport
// This homework should be fairly simple.
// visit https://github.com/noops-challenge/wordbot to read
// the documentation for wordbot.
//
// Using that documentation, write a playground that does
// the following:
// download 50 words
// decode those 50 words into an array of strings
// print the array of words, but with each word reversed
// print the average number of characters per word

PlaygroundPage.current.needsIndefiniteExecution = true
struct WordList: Codable {
    let words: [String]
}




let urlString = "https://api.noopschallenge.com/wordbot?count=50"
if let url = URL(string: urlString) {
    let request = URLRequest(url: url)
    let session = URLSession(configuration: .ephemeral)
    let task = session.dataTask(with: request) { (data, response, error) in
        let wordList = try! JSONDecoder().decode(WordList.self, from: data!)
        print(wordList.words.count)
        var sum: Int = 0
        for word in wordList.words {
            print(String(word.reversed()))
            sum = sum + word.count
        }
        sum = sum/50
        print("The average number of characters per word is: \(sum)")    }
    task.resume()
}

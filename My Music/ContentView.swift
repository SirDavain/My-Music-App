//
//  ContentView.swift
//  My Music
//
//  Created by David Ulrich on 27.03.24.
//

import SwiftUI
//import AVKit
import AVFoundation
import UIKit
import MediaPlayer

//class AudioPlayerViewController: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let playerViewController = AVPlayerViewController()
//        playerViewController.showsPlaybackControls = true
//        
//        //add as a child
//        addChild(playerViewController)
//        view.addSubview(playerViewController.view)
//        playerViewController.view.frame = view.bounds
//        playerViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        
//        //Create AVPlayer with my audio file
//        if let audioURL = Bundle.main.url(forResource: "song1", withExtension: "mp3") {
//            let player = AVPlayer(url: audioURL)
//            playerViewController.player = player
//            player.play()
//        }
//        
//    }
//}

struct AllSongsPage: View {
    var body: some View {
        VStack {
            Text("All songs")
                .font(.title)
                .foregroundColor(.white)
            List {
                Text("These")
                Text("are")
                Text("all")
                Text("the")
                Text("songs")
            }
        }
    }
}

struct PlaylistsPage: View {
    var body: some View {
        VStack {
            Text("Playlists")
                .font(.title)
                .foregroundColor(.white)
            List {
                Text("These")
                Text("are")
                Text("all")
                Text("the")
                Text("playlists")
            }
        }
    }
}

class MusicPlayer {
    var player: AVAudioPlayer?
    
    func playMusic(form url: URL) {
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }
    
    func stopMusic() {
        player?.stop()
    }
}

func getSongURL() -> String {
    
}

func playMusicFromURL() {
    let fileManager = FileManager.default
    let musicPlayer = MusicPlayer()
    let musicURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let songURL = getSongURL()

    musicPlayer.playMusic(form: songURL)
}

struct ContentView: View {
    //Bundle.main.url(forResource: "song1", withExtension: "mp3")

    let song = "String"
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        NavigationLink(destination: PlaylistsPage()) {
                            Text("Playlists")
                        }
                        .padding(.horizontal, 25.0)
                        Spacer()
                        NavigationLink(destination: AllSongsPage()) {
                            Text("All Songs")
                        }
                        .padding(.horizontal, 25.0)
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .padding(.top, 20.0)
                    List {
                        Text("Hi")
                        Text("there")
                        Text("you")
                    }
                    Button {
                        playMusicFromURL()
                    } label: {
                        Text("Play a song")
                    }

                }
            }
            .preferredColorScheme(.dark)
        }
    }
    struct Song {
        var title: String
        var author: String
        var duration: Int
    }
}

#Preview {
    ContentView()
}

//
//  AppDelegate.swift
//  CrowdPower
//
//  Created by Hsiao Ai LEE on 2019/5/4.
//  Copyright © 2019 IFang Lee. All rights reserved.
//

import UIKit
import Firebase
import GoogleMaps
import GooglePlaces
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // MARK: - Configure Firebase
        
        FirebaseApp.configure()

        // MARK: - Google Map
        
        GMSServices.provideAPIKey("AIzaSyDn9aAFnzzN6MiZ-zN43_t6tvjb8Lp-L6A")
        GMSPlacesClient.provideAPIKey("AIzaSyDn9aAFnzzN6MiZ")
        
        // MARK: Request Camera

        AVCaptureDevice.requestAccess(for: .video) { success in
            
           print("here")
        }
        
        // MARK: Push notification
        
        UNUserNotificationCenter.current().delegate = self
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { granted, error in
            if granted {
                
                print("使用者同意了，每天都能收到來自米花兒的幸福訊息")
            } else {
              
                print("使用者不同意，不喜歡米花兒，哭哭!")
            }
        })
        
        let content = UNMutableNotificationContent()
        content.title = "✅Approved!!!"
        content.body = "Community and leisure center with facilities for Kraví hora"
    
        // Create the trigger as a repeating event.
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: DateComponents(day: 5, hour: 10, minute: 30), repeats: true)
        
        // Create the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString,
                                            content: content, trigger: trigger)
        
        // Schedule the request with the system.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            
            if error != nil {
                // Handle any errors.
            }
            
            print("here")
        }
        
        // MARK: - Init ViewController
        
        let entryViewController = AppDelegate.createTabBarViewController()
        initRootViewController(with: entryViewController)
        
        return true
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.badge, .sound, .alert])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        window?.rootViewController?.present(DetailViewController.storyboardInit(), animated: true)
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        var result = false
        
        if url.scheme=="crowdPower" {

            window?.rootViewController?.present(DetailViewController.storyboardInit(), animated: true)
            
            result = true
        }
        
        return result
    }
}

// MARK: Helper Functions

private extension AppDelegate {
    
    func initRootViewController(with rootViewController: UIViewController)  {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.rootViewController = rootViewController
        self.window = window
    }
}

// MARK: Builders

private extension AppDelegate {
    
    static func createTabBarViewController() -> UITabBarController {
        
        let itemTypes: [TabBarItemType] = [
            .today,
            .discover,
            .propose,
            .watch,
            .me
        ]
        
        return TabBarController(itemTypes: itemTypes)
    }
}

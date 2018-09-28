//
//  AppDelegate.swift
//  NihonGame
//
//  Created by Nicolas on 04/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainCoordinator : MainCoordinator?
    static var modes : GameModes {
        return GameModes()
    }

    static var delegate : AppDelegate {
        return  (UIApplication.shared.delegate as! AppDelegate)
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // ----- create windows and VC
        mainCoordinator = MainCoordinator(appDelegate: self)
        mainCoordinator?.start()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "GameDataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy

            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    static var persistentConainer : NSPersistentContainer {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    }

    static var viewContext : NSManagedObjectContext {
        return persistentConainer.viewContext
    }

    static var viewContextForTest : NSManagedObjectContext {
        persistentConainer.newBackgroundContext()
        return persistentConainer.viewContext
    }


}


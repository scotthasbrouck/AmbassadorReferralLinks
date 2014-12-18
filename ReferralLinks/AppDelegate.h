//
//  AppDelegate.h
//  ReferralLinks
//
//  Created by Scott Hasbrouck on 12/17/14.
//  Copyright (c) 2014 Scott Hasbrouck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

//___________ UI Elements ___________
@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

//___________ Methods ___________
// > Respond to URL open
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end


//
//  LinkLandingPageViewController.h
//  ReferralLinks
//
//  Created by Scott Hasbrouck on 12/18/14.
//  Copyright (c) 2014 Scott Hasbrouck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Link.h"

@interface LinkLandingPageViewController : UIViewController

//___________ UI Elements ___________
// > Label for messaging
@property (weak, nonatomic) IBOutlet UILabel *linkLandingMessage;
// > TextField for link text
@property (weak, nonatomic) IBOutlet UILabel *linkTextLabel;

//___________ Objects ___________
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) Link *linkRecord;

@end

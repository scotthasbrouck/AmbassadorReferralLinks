//
//  UpdateLinkViewController.h
//  ReferralLinks
//
//  Created by Scott Hasbrouck on 12/18/14.
//  Copyright (c) 2014 Scott Hasbrouck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface UpdateLinkViewController : UIViewController

//___________ UI Elements ___________
// > Label for messaging
@property (weak, nonatomic) IBOutlet UILabel *updateLinkMessage;
// > TextField for link text
@property (weak, nonatomic) IBOutlet UITextField *linkTextField;

//___________ Objects ___________
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObject *linkRecord;

//___________ Methods ___________
- (IBAction)closeUpdateLink:(id)sender;
- (IBAction)updateLink:(id)sender;

@end

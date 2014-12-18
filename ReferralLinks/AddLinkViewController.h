//
//  AddLinkViewController.h
//  ReferralLinks
//
//  Created by Scott Hasbrouck on 12/17/14.
//  Copyright (c) 2014 Scott Hasbrouck. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddLinkViewController : UIViewController

//___________ UI Elements ___________
// > Label for messaging
@property (weak, nonatomic) IBOutlet UILabel *addLinkMessage;
// > TextField for link text
@property (weak, nonatomic) IBOutlet UITextField *linkTextField;
// > ImageView for sweet icon
// > ImageView for Steve Jobs' Face

//___________ Methods ___________
// > save link to MOC
- (IBAction)addLink:(id)sender;
- (IBAction)closeAddLink:(id)sender;

@end

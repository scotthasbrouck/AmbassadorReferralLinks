//
//  AddLinkViewController.m
//  ReferralLinks
//
//  Created by Scott Hasbrouck on 12/17/14.
//  Copyright (c) 2014 Scott Hasbrouck. All rights reserved.
//

#import "AddLinkViewController.h"

@interface AddLinkViewController ()

@end

@implementation AddLinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark Button actions
- (IBAction)addLink:(id)sender {
    NSString *linkText = self.linkTextField.text;
    
    if (linkText && linkText.length) {
        //setup entity decsription
        NSEntityDescription *link = [NSEntityDescription entityForName:@"Link" inManagedObjectContext:self.managedObjectContext];
        //moc and link text
        NSManagedObject *linkRecord = [[NSManagedObject alloc] initWithEntity:link insertIntoManagedObjectContext:self.managedObjectContext];
        [linkRecord setValue:linkText forKey:@"title"];
        
        //try saving the link, otherwise, handle the error
        NSError *error = nil;
        if ([self.managedObjectContext save:&error]) {
            [self dismissViewControllerAnimated:YES completion:nil];
            
        } else {
            if (error) {
                NSLog(@"Error saving referral link");
                NSLog(@"%@, %@", error, error.localizedDescription);
            }
            [[[UIAlertView alloc] initWithTitle:@"Uh oh..." message:@"Error saving referral link" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        }
    //ask user to fill in missing link title
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Missing Field" message:@"Please give the link a title" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
}

- (IBAction)closeAddLink:(id)sender {
    //Dismiss View Controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

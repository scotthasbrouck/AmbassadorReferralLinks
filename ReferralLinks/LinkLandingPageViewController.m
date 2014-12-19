//
//  LinkLandingPageViewController.m
//  ReferralLinks
//
//  Created by Scott Hasbrouck on 12/18/14.
//  Copyright (c) 2014 Scott Hasbrouck. All rights reserved.
//

#import "LinkLandingPageViewController.h"

@interface LinkLandingPageViewController ()

@end

@implementation LinkLandingPageViewController

- (void)viewDidLoad {
    
    //set label value
    if (self.linkRecord) {
        [self.linkTextLabel setText:[NSString stringWithFormat:@"%@ is clogging the tubes!", [self.linkRecord valueForKey:@"title"]]];
    }
    
    //increment count
    NSInteger count =[[self.linkRecord valueForKey:@"count"] integerValue];
    count++;
    self.linkRecord.count = [NSNumber numberWithInteger:count];
    
    NSError *error = nil;
    
    if (![self.managedObjectContext save:&error]) {
        if (error) {
            NSLog(@"Error saving referral link");
            NSLog(@"%@, %@", error, error.localizedDescription);
        }
        [[[UIAlertView alloc] initWithTitle:@"Uh oh..." message:@"Error saving referral link" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        
    }
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

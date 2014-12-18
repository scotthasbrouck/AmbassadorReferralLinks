//
//  UpdateLinkViewController.m
//  ReferralLinks
//
//  Created by Scott Hasbrouck on 12/18/14.
//  Copyright (c) 2014 Scott Hasbrouck. All rights reserved.
//

#import "UpdateLinkViewController.h"

@interface UpdateLinkViewController ()

@end

@implementation UpdateLinkViewController

- (void)viewDidLoad {
    if (self.linkRecord) {
        [self.linkTextField setText:[self.linkRecord valueForKey:@"title"]];
    }
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark Button actions
- (IBAction)updateLink:(id)sender {
    NSString *linkText = self.linkTextField.text;
    
    if (linkText && linkText.length) {
        [self.linkRecord setValue:linkText forKey:@"title"];
        NSError *error = nil;
        
        if ([self.managedObjectContext save:&error]) {
            [self.navigationController popViewControllerAnimated:YES];
            
        } else {
            if (error) {
                NSLog(@"Error saving referral link");
                NSLog(@"%@, %@", error, error.localizedDescription);
            }
            [[[UIAlertView alloc] initWithTitle:@"Uh oh..." message:@"Error saving referral link" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        }
        
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Missing Field" message:@"Please give the link a title" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
}

- (IBAction)closeUpdateLink:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

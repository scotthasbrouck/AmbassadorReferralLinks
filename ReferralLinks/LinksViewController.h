//
//  ViewController.h
//  ReferralLinks
//
//  Created by Scott Hasbrouck on 12/17/14.
//  Copyright (c) 2014 Scott Hasbrouck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Link.h"

@interface LinksViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>

//___________ UI Elements ___________
// > TableView for links
@property (weak, nonatomic) IBOutlet UITableView *tableView;
// > Navigation Controller

//___________ Objects ___________
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSIndexPath *selection;

//___________ Methods ___________
// > View Link on Touch
- (IBAction)toggleEditMode:(id)sender;

@end
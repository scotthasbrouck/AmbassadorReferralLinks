//
//  ViewController.m
//  ReferralLinks
//
//  Created by Scott Hasbrouck on 12/17/14.
//  Copyright (c) 2014 Scott Hasbrouck. All rights reserved.
//

#import "LinksViewController.h"
#import "AppDelegate.h"
#import "LinkTableViewCell.h"
#import "AddLinkViewController.h"
#import "UpdateLinkViewController.h"
#import "LinkLandingPageViewController.h"

@interface LinksViewController ()

@end

@implementation LinksViewController

- (void)viewDidLoad {
    
    //set MOC
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    self.managedObjectContext = delegate.managedObjectContext;
    
    //Init Fetch
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Link"];
    
    //Sort by count
    [fetchRequest setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"count" ascending:YES]]];
    
    //selection during editing
    self.tableView.allowsSelectionDuringEditing = YES;
    
    //Init Fetch Results
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];

    [self.fetchedResultsController setDelegate:self];
    NSError *error = nil;
    [self.fetchedResultsController performFetch:&error];
    
    if (error) {
        NSLog(@"Fetch error");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Fetch delegate methods
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    switch (type) {
        case NSFetchedResultsChangeInsert: {
            [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        }
        case NSFetchedResultsChangeDelete: {
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        }
        case NSFetchedResultsChangeUpdate: {
            [self configureCell:(LinkTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
        }
        case NSFetchedResultsChangeMove: {
            //don't need to implement this
            break;
        }
    }
}

- (void)configureCell:(LinkTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    //Fetch
    NSManagedObject *link = [self.fetchedResultsController objectAtIndexPath:indexPath];
    //Update cell
    [cell.titleLabel setText:[link valueForKey:@"title"]];
    [cell.countLabel setText:[NSString stringWithFormat:@"%@ clicks", (NSNumber *)[link valueForKey:@"count"]]];
}

- (IBAction)toggleEditMode:(id)sender {
    if(self.tableView.editing) {
        [self.tableView setEditing: NO animated: YES];
    } else {
      [self.tableView setEditing: YES animated: YES];
    }
}

#pragma mark - Table data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sections = [self.fetchedResultsController sections];
    id<NSFetchedResultsSectionInfo> sectionInfo = [sections objectAtIndex:section];
    return (int)[sectionInfo numberOfObjects];
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 LinkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LinkCell" forIndexPath:indexPath];

 [self configureCell:cell atIndexPath:indexPath];
 
     return cell;
 }

 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
     return YES;
 }

 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
     if (editingStyle == UITableViewCellEditingStyleDelete) {
         NSManagedObject *linkRecord = [self.fetchedResultsController objectAtIndexPath:indexPath];
         
         if (linkRecord) {
             [self.fetchedResultsController.managedObjectContext deleteObject:linkRecord];
         }
     }
 }

 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
     return NO;
 }

#pragma mark - table delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    [self setSelection:indexPath];
    
    if(self.tableView.editing) {
        [self performSegueWithIdentifier: @"updateLinkViewController" sender:self];
    } else {
        [self performSegueWithIdentifier: @"linkLandingViewController" sender:self];
    }
}

 #pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //Adding a link
    if ([segue.identifier isEqualToString:@"addLinkViewController"]) {
        UINavigationController *navController = (UINavigationController *)[segue destinationViewController];
        AddLinkViewController *viewController = (AddLinkViewController *)[navController topViewController];
        [viewController setManagedObjectContext:self.managedObjectContext];
    }
    //updating a link
    else if ([segue.identifier isEqualToString:@"updateLinkViewController"]) {
        UpdateLinkViewController *viewController = (UpdateLinkViewController *)[segue destinationViewController];
        [viewController setManagedObjectContext:self.managedObjectContext];
        
        if (self.selection) {
            NSManagedObject *linkRecord = [self.fetchedResultsController objectAtIndexPath:self.selection];
            
            if (linkRecord) {
                [viewController setLinkRecord:linkRecord];
            }
            
            // Reset Selection
            [self setSelection:nil];
        }
    }
    //viewing a link
    else if ([segue.identifier isEqualToString:@"linkLandingViewController"]){
        LinkLandingPageViewController *viewController = (LinkLandingPageViewController *)[segue destinationViewController];
        [viewController setManagedObjectContext:self.managedObjectContext];
        
        if (self.selection) {
            NSManagedObject *linkRecord = [self.fetchedResultsController objectAtIndexPath:self.selection];
            
            if (linkRecord) {
                [viewController setLinkRecord:linkRecord];
            }
            
            // Reset Selection
            [self setSelection:nil];
        }
}
}

@end

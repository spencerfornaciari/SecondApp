//
//  SFPostController.m
//  PostApp
//
//  Created by Spencer Fornaciari on 10/21/13.
//  Copyright (c) 2013 Spencer Fornaciari. All rights reserved.
//

#import "SFPostController.h"

@interface SFPostController ()

@end

@implementation SFPostController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem:)];
    //self.navigationItem.leftBarButtonItem = addButton;

    PFQuery *query = [PFQuery queryWithClassName:@"PostObject"];
    [query whereKeyExists:@"userName"];
    [query orderByDescending:@"createdAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            self.parsePosts = objects;
            self.posts = [(NSArray *)self.parsePosts mutableCopy];
            [self.tableView reloadData];
        }
        else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    self.posts = [(NSArray *)self.parsePosts mutableCopy];
    [self.tableView reloadData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    return self.parsePosts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    SFPostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    PFObject *parsePost = [self.posts objectAtIndex:indexPath.row];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"h:mm a 'on' MM/dd/yyyy"];
    NSString *postDate = [dateFormatter stringFromDate:parsePost.createdAt];
    
    cell.authorLabel.text = [parsePost objectForKey:@"userName"];
    cell.titleLabel.text = [parsePost objectForKey:@"title"];
    cell.postLabel.text = [parsePost objectForKey:@"content"];
    cell.timeLabel.text = postDate;
    
    return cell;
}


// Override to support conditional editing of the table view.
/*- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}*/



// Override to support editing the table view.
/*- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        PFObject *deletePost = [self.posts objectAtIndex:indexPath.row];;
        [self.posts removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
*/
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ( [[segue identifier] isEqualToString:@"AddPost"] ){
        
        UINavigationController *navController = (UINavigationController *)[segue destinationViewController];
        NSLog(@"%@",[segue destinationViewController]);
        
        SFAddItemViewController *dvc = (SFAddItemViewController *)[navController topViewController];
        dvc.delegate = self;
        dvc.submitUsername = nil;
        dvc.submitTitle = nil;
        dvc.submitContent = nil;
    }
}

#pragma mark - Editing The Post View

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:YES];
    if (editing) {
       
    } else {
        //addButton.enabled = YES;
        NSLog(@"You are done editing");
    }
}

/*- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //SimpleEditableListAppDelegate *controller = (SimpleEditableListAppDelegate *)[[UIApplication sharedApplication] delegate];
    //if (indexPath.row == [self.parsePosts count]-1) {
        //return UITableViewCellEditingStyleInsert;
    //} else {
      //  return UITableViewCellEditingStyleDelete;
    //}
    if (indexPath.row == self.parsePosts.count-1) {
        return UITableViewCellEditingStyleInsert;}
    else {
        return UITableViewCellEditingStyleDelete;
    }
}*/

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    // If row is deleted, remove it from the list.
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //SimpleEditableListAppDelegate *controller = (SimpleEditableListAppDelegate *)[[UIApplication sharedApplication] delegate];
        //[controller removeObjectFromListAtIndex:indexPath.row];
        //[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        PFObject *deletePost = [self.posts objectAtIndex:indexPath.row];;
        [self.posts removeObjectAtIndex:indexPath.row];
        //[tableView deleteRowsAtIndexPaths:self.parsePosts withRowAnimation:UITableViewRowAnimationLeft];
        [deletePost deleteInBackground];
        [self.tableView reloadData];
    }
}

#pragma mark - SFAddItemViewController Delegate

-(void)addPostToList:(SFPost *)addSFPost
{
    
    PFObject *newSFPost = [PFObject objectWithClassName:@"PostObject"];
    newSFPost[@"userName"] = addSFPost.userName;
    newSFPost[@"title"] = addSFPost.title;
    newSFPost[@"content"] = addSFPost.content;
    //newSFPost.createdAt = postDate;
     [newSFPost saveInBackground];
    
    
    [self.posts addObject:newSFPost];
    
    NSLog(@"%@", self.posts);
    [self.tableView reloadData];
    
    NSLog(@"%@", self.posts);
   // NSLog(@"first view: %@", addSFPost.userName);
        //[newPost saveInBackground];
      // [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


@end

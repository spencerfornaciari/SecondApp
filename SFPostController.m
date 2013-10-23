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
    
    SFPost *post1 = [[SFPost alloc] init];
    post1.userName = @"Full Name 1";
    post1.title = @"Default Title 1";
    post1.content = @"Default Content 1";
    post1.timeStamp = [NSDate date];
    
    SFPost *post2 = [[SFPost alloc] init];
    post2.userName = @"Full Name 2";
    post2.title = @"Default Title 2";
    post2.content = @"Default Content 2";
    post2.timeStamp = [NSDate date];
    
    SFPost *post3 = [[SFPost alloc] init];
    post3.userName = @"Full Name 3";
    post3.title = @"Default Title 3";
    post3.content = @"Default Content 3";
    post3.timeStamp = [NSDate date];
    
    SFPost *post4 = [[SFPost alloc] init];
    post4.userName = @"Full Name 4";
    post4.title = @"Default Title 4";
    post4.content = @"Default Content 4";
    post4.timeStamp = [NSDate date];
    
    SFPost *post5 = [[SFPost alloc] init];
    post5.userName = @"Full Name 5";
    post5.title = @"Default Title 5";
    post5.content = @"Default Content 5";
    post5.timeStamp = [NSDate date];
    
    SFPost *post6 = [[SFPost alloc] init];
    post6.userName = @"Full Name 6";
    post6.title = @"Default Title 6";
    post6.content = @"Default Content 6";
    post6.timeStamp = [NSDate date];
    
    SFPost *post7 = [[SFPost alloc] init];
    post7.userName = @"Full Name 7";
    post7.title = @"Default Title 7";
    post7.content = @"Default Content 7";
    post7.timeStamp = [NSDate date];
    
    SFPost *post8 = [[SFPost alloc] init];
    post8.userName = @"Full Name 8";
    post8.title = @"Default Title 8";
    post8.content = @"Default Content 8";
    post8.timeStamp = [NSDate date];
    
    SFPost *post9 = [[SFPost alloc] init];
    post9.userName = @"Full Name 9";
    post9.title = @"Default Title 9";
    post9.content = @"Default Content 9";
    post9.timeStamp = [NSDate date];
    
    SFPost *post10 = [[SFPost alloc] init];
    post10.userName = @"Full Name 10";
    post10.title = @"Default Title 10";
    post10.content = @"Default Content 10";
    post10.timeStamp = [NSDate date];
    
    self.posts = [NSMutableArray arrayWithObjects:post1, post2, post3, post4, post5,
                                                  post6, post7, post8, post9, post10, nil];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    SFPostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy 'at' h:mm a"];
    NSString *postDate = [dateFormatter stringFromDate:[self.posts[indexPath.row] timeStamp]];
    
    
    cell.authorLabel.text = [self.posts[indexPath.row] userName];
    cell.titleLabel.text = [self.posts[indexPath.row] title];
    cell.postLabel.text = [self.posts[indexPath.row] content];
    cell.timeLabel.text = postDate;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end

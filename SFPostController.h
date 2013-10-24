//
//  SFPostController.h
//  PostApp
//
//  Created by Spencer Fornaciari on 10/21/13.
//  Copyright (c) 2013 Spencer Fornaciari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFPost.h"
#import "SFPostTableViewCell.h"
#import "SFAddItemViewController.h"
#import <Parse/Parse.h>

@interface SFPostController : UITableViewController <SFAddItemViewControllerDelegate>

@property (nonatomic) NSMutableArray *posts;
@property (nonatomic) NSMutableArray *time;
@property (nonatomic) NSArray *parsePosts;

//@property (strong, nonatomic) IBOutlet UIBarButtonItem *editButton;
//@property (strong, nonatomic) IBOutlet UIBarButtonItem *addButton;

//- (void)addItem:sender;

@end

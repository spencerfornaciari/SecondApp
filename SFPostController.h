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
#import <Parse/Parse.h>

@interface SFPostController : UITableViewController

@property (nonatomic) NSMutableArray *posts;

@end

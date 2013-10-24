//
//  SFAddItemViewController.h
//  PostApp
//
//  Created by Spencer Fornaciari on 10/23/13.
//  Copyright (c) 2013 Spencer Fornaciari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "SFPost.h"

@protocol SFAddItemViewControllerDelegate;



@interface SFAddItemViewController : UIViewController

@property (nonatomic, weak) id <SFAddItemViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *submitUsername;
@property (weak, nonatomic) IBOutlet UITextField *submitTitle;
@property (weak, nonatomic) IBOutlet UITextField *submitContent;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;


- (IBAction)saveContent:(id)sender;



@end

@protocol SFAddItemViewControllerDelegate <NSObject>
-(void)addPostToList:(SFPost *)addSFPost;
@end
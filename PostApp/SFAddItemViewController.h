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

@property (weak, nonatomic) SFPost <SFAddItemViewControllerDelegate> *delegate;

@property (strong, nonatomic) IBOutlet UITextField *submitUsername;
@property (strong, nonatomic) IBOutlet UITextField *submitTitle;
@property (strong, nonatomic) IBOutlet UITextField *submitContent;

//@property (weak, nonatomic) id <DetailViewControllerDelegate> *delegate;

- (IBAction)saveContent:(id)sender;

//-(void)addContent;

@end


@protocol SFAddItemViewControllerDelegate <NSObject>
-(void)addPostToList;
@end
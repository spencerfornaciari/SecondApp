//
//  SFAddItemViewController.m
//  PostApp
//
//  Created by Spencer Fornaciari on 10/23/13.
//  Copyright (c) 2013 Spencer Fornaciari. All rights reserved.
//

#import "SFAddItemViewController.h"
#import "SFPostController.h"

@interface SFAddItemViewController ()

@end

@implementation SFAddItemViewController
@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)saveContent:(id)sender
{
    
    SFPost *newPost = [[SFPost alloc] init];
    newPost.userName = self.submitUsername.text;
    newPost.title = self.submitTitle.text;
    newPost.content = self.submitContent.text;
    newPost.timeStamp = [NSDate date];
    
    
    [self.delegate addPostToList:newPost];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)backToList:(id)sender
{
   [self dismissViewControllerAnimated:YES completion:nil]; 
}


@end

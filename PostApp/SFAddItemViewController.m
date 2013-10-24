//
//  SFAddItemViewController.m
//  PostApp
//
//  Created by Spencer Fornaciari on 10/23/13.
//  Copyright (c) 2013 Spencer Fornaciari. All rights reserved.
//

#import "SFAddItemViewController.h"

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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveContent:(id)sender {
    PFObject *addPost = [PFObject objectWithClassName:@"PostObject"];
    addPost[@"userName"] = self.submitUsername.text;
    addPost[@"title"] = self.submitTitle.text;
    addPost[@"content"] = self.submitContent.text;
    [addPost saveInBackground];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

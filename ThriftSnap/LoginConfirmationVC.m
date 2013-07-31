//
//  LoginConfirmationVC.m
//  ThriftSnap
//
//  Created by Deftsoft iMac on 24/07/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import "LoginConfirmationVC.h"
#import <QuartzCore/QuartzCore.h>

@interface LoginConfirmationVC ()

@end

@implementation LoginConfirmationVC

@synthesize m_LoginName, m_LoginNameLabel, m_ProfileImage, m_ProfileImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - LifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:YES];
  
  self.navigationController.navigationBarHidden = YES;
  
  m_LoginNameLabel.text = m_LoginName;
  [m_ProfileImageView setImage:m_ProfileImage];

  m_ProfileImageView.layer.cornerRadius = 4.0;
  m_ProfileImageView.layer.masksToBounds = 4.0;
  m_ProfileImageView.layer.borderWidth = 1.0;
  
}

#pragma mark - Memory management Methods

- (void)dealloc {
  [m_ProfileImage release];
  [m_ProfileImageView release];
  [m_LoginName release];
  [m_LoginNameLabel release];
  
  [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

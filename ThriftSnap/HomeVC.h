//
//  HomeVC.h
//  ThriftSnap
//
//  Created by Deftsoft iMac on 24/07/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Facebook.h"


@interface HomeVC : UIViewController <UIScrollViewDelegate, UITextFieldDelegate, FBSessionDelegate, FBRequestDelegate>

@property(nonatomic, retain)IBOutlet UIScrollView*      m_ScrollView;
@property(nonatomic, retain)IBOutlet UITextField*      m_EmailTextField;
@property(nonatomic, retain)IBOutlet UITextField*      m_PasswordTextField;

//IBActions
-(IBAction)facebookButtonPressed:(id)sender;
-(IBAction)loginButtonPressed:(id)sender;
-(IBAction)forgetPassButtonPressed:(id)sender;

@end

//
//  LoginConfirmationVC.h
//  ThriftSnap
//
//  Created by Deftsoft iMac on 24/07/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginConfirmationVC : UIViewController

@property(nonatomic,retain)IBOutlet UIImageView*      m_ProfileImageView;
@property(nonatomic,retain)IBOutlet UILabel*          m_LoginNameLabel;
@property (nonatomic, retain) NSString*               m_LoginName;
@property (nonatomic, retain) UIImage*               m_ProfileImage;

@end

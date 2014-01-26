//
//  UIViewController+APIClientAddition.h
//  DarioApp
//
//  Created by Ricardo Caballero on 26/01/14.
//  Copyright (c) 2014 Horacio Herrera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCMAPIClient.h"

@interface UIViewController (APIClientAddition)

@property (nonatomic, strong) RCMAPIClient *APIClient;

@end

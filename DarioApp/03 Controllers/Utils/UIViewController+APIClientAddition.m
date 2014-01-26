//
//  UIViewController+APIClientAddition.m
//  DarioApp
//
//  Created by Ricardo Caballero on 26/01/14.
//  Copyright (c) 2014 Horacio Herrera. All rights reserved.
//

#import "UIViewController+APIClientAddition.h"

#import <objc/runtime.h>

static char APIClientKey;

@implementation UIViewController (APIClientAddition)

- (RCMAPIClient *)APIClient
{
    RCMAPIClient *apiClient = objc_getAssociatedObject(self, &APIClientKey);
    if (!apiClient) {
        apiClient = [RCMAPIClient sharedInstance];
        self.APIClient = apiClient;
    }
    return apiClient;
}

- (void)setAPIClient:(RCMAPIClient *)APIClient
{
    objc_setAssociatedObject(self, &APIClient, APIClient, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

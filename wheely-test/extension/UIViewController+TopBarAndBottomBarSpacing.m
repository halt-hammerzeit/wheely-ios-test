//
//  UIViewController+TopBarAndBottomBarSpacing.m
//  Sociopathy
//
//  Created by Admin on 09.01.14.
//  Copyright (c) 2014 kuchumovn. All rights reserved.
//

#import "UIViewController+TopBarAndBottomBarSpacing.h"

@implementation UIViewController (TopBarAndBottomBarSpacing)

- (UIEdgeInsets) addExtraInset: (UIEdgeInsets) extraInset
                            to: (UIEdgeInsets) to
{
    return UIEdgeInsetsMake(to.top + extraInset.top, to.left + extraInset.left, to.bottom + extraInset.bottom, to.right + extraInset.right);
}

- (UIEdgeInsets) guidedInsets
{
    return UIEdgeInsetsMake(self.topLayoutGuide.length, 0, self.bottomLayoutGuide.length, 0);
}

- (void) fixScrollViewInsets: (UIScrollView*) scrollView
{
    UIEdgeInsets correctInset = [self guidedInsets];
    
    //NSLog(@"Correct inset: %@", NSStringFromUIEdgeInsets(correctInset));
    
//    CGFloat delta = correctInset.top - scrollView.contentInset.top;
//    NSLog(@"%f", delta);
    
    scrollView.contentInset = correctInset; //[self addExtraInset:extraInset to:scrollView.contentInset];
    scrollView.scrollIndicatorInsets = correctInset;
    
//    scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, scrollView.contentOffset.y + delta);
}

- (void) fixInsetsOnTopAndBottom: (UIView*) subview
{
    if ([subview isKindOfClass:[UIScrollView class]])
    {
        [self fixScrollViewInsets:(UIScrollView*) subview];
    }
    else if ([subview isKindOfClass:[UIWebView class]])
    {
        [self fixScrollViewInsets:((UIWebView*) subview).scrollView];
    }
}

/*
- (void) insetOnTopAndBottom: (UIView*) subview
{
    UIEdgeInsets inset = UIEdgeInsetsMake(self.topLayoutGuide.length, 0, self.bottomLayoutGuide.length, 0);
    
    if ([subview isKindOfClass:[UIScrollView class]])
    {
        UIScrollView* scrollView = (UIScrollView*) subview;
        scrollView.contentInset = inset;
    }
    else if ([subview isKindOfClass:[UIWebView class]])
    {
        UIWebView* webView = (UIWebView*) subview;
        webView.scrollView.contentInset = inset;
    }
 }
 */
@end

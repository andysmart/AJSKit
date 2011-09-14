//
//  AJSLoadingView.m
//  AJSKit
//
//  Created by Andy Smart on 14/09/2011.
//  Copyright 2011 Andy Smart. All rights reserved.
//

#import "AJSLoadingView.h"
#import "UIApplication+AJSAdditions.h"
#import <QuartzCore/QuartzCore.h>

#define AJSLoadingViewAnimationDuration 0.2
#define AJSLoadingViewAnimationScale 2.0
#define AJSLoadingViewAnimationDelay 1.5

#define AJSLoadingViewBackgroundColor [UIColor colorWithWhite:0 alpha:.3]

@interface AJSLoadingView()

@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, retain) UILabel *textLabel;
@property (nonatomic, retain) UIImageView *imageView;

@property (nonatomic, retain) UIView *bezelView;

+ (AJSLoadingView *)sharedLoadingView;
- (void) hide;
- (void) show;
- (void) hideAfterDelay:(NSTimeInterval)delay;

@end

static AJSLoadingView *_sharedLoadingView = nil;

@implementation AJSLoadingView
@synthesize activityIndicator = _activityIndicator;
@synthesize textLabel = _textLabel;
@synthesize imageView = _imageView;
@synthesize bezelView = _bezelView;

- (void) dealloc
{
    [_bezelView release], _bezelView = nil;
    [_activityIndicator release], _activityIndicator = nil;
    [_textLabel release], _textLabel = nil;
    [_imageView release], _imageView = nil;
    
    [super dealloc];
}

- (id) init
{
    self = [super initWithFrame:CGRectMake(0, 0, 320, 480)];
    
    if (self) {
        
        self.backgroundColor = AJSLoadingViewBackgroundColor;
    }
    
    return self;
}

#pragma mark - Singleton

+ (AJSLoadingView *)sharedLoadingView
{
    if (_sharedLoadingView) {
        return _sharedLoadingView;
    }
    
    @synchronized(self) {
        
        if (_sharedLoadingView == NULL) {
            _sharedLoadingView = [[AJSLoadingView alloc] init];
        }
    }
    
    return _sharedLoadingView;
}

#pragma mark - Subviews

- (UIView *)bezelView
{
    if (!_bezelView) {
        
        _bezelView = [[UIView alloc] init];
        _bezelView.frame = CGRectMake(0, 0, 150, 150);
        
        _bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:.55];
        _bezelView.layer.cornerRadius = 10;
        
        self.activityIndicator = [[[UIActivityIndicatorView alloc] init] autorelease];
        self.activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        self.activityIndicator.frame = CGRectMake(0, 0, 40, 40);
        
        self.activityIndicator.center = _bezelView.center;
        
        [_bezelView addSubview:self.activityIndicator];
        
        self.imageView = [[[UIImageView alloc] init] autorelease];
        self.imageView.frame = CGRectMake(0, 0, _bezelView.frame.size.width, _bezelView.frame.size.height);
        self.imageView.contentMode = UIViewContentModeCenter;
        
        [_bezelView addSubview:self.imageView];
        
        self.textLabel = [[[UILabel alloc] init] autorelease];
        self.textLabel.font = [UIFont boldSystemFontOfSize:17];
        self.textLabel.textColor = [UIColor whiteColor];
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.frame = CGRectMake(0, _bezelView.frame.size.height - 30, _bezelView.frame.size.width, 20);
        self.textLabel.textAlignment = UITextAlignmentCenter;
        
        [_bezelView addSubview:self.textLabel];
    }
    
    return _bezelView;
}

#pragma mark - Show / Hide

+ (void) showLoadingWithText:(NSString *)text
{
    AJSLoadingView *v = [AJSLoadingView sharedLoadingView];
    
    if (!v.superview) {
        [v show];
    }
    
    [v.activityIndicator startAnimating];
    v.textLabel.text = text;
    v.imageView.image = nil;
}

+ (void) flashMessageWithImage:(UIImage *)image
{
    AJSLoadingView *v = [AJSLoadingView sharedLoadingView];
    
    if (!v.superview) {
        [v show];
    }
    
    [v.activityIndicator stopAnimating];
    v.imageView.image = image;
    
    [v hideAfterDelay:AJSLoadingViewAnimationDelay];
}

+ (void) flashMessageWithImage:(UIImage *)image text:(NSString *)text
{
    AJSLoadingView *v = [AJSLoadingView sharedLoadingView];
    
    if (!v.superview) {
        [v show];
    }
    
    [v.activityIndicator stopAnimating];
    v.imageView.image = image;
    v.textLabel.text = text;
    
    [v hideAfterDelay:AJSLoadingViewAnimationDelay];
}

+ (void) hide
{
    [[AJSLoadingView sharedLoadingView] hide];
}

#pragma mark - Private

- (void) show
{
    UIApplication *app = [UIApplication sharedApplication];
    UIView *parentView = [app keyboardView];
    
    if (!parentView) {
        
        //No keyboard showing,
        //Find the key window
        
        if ([app keyWindow] && [[[app keyWindow] subviews] count]) {
            
            parentView = [[[app keyWindow] subviews] objectAtIndex:0];
        } else {
            
            for (UIWindow *w in app.windows)
                if ([w.subviews count])
                    parentView = [w.subviews objectAtIndex:0];
        }
        
        if (!parentView) {
            return; //Can't find a view to show in
        }
    }
    
    [parentView addSubview:self];
    
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    
    CGRect frame = CGRectMake(0, 0, parentView.frame.size.width, parentView.frame.size.height);
    self.frame = frame;
    
    self.bezelView.center = self.center;
    [self addSubview:self.bezelView];
    
    self.bezelView.alpha = 0;
    self.bezelView.transform = CGAffineTransformScale(self.bezelView.transform, AJSLoadingViewAnimationScale, AJSLoadingViewAnimationScale);
    
    [UIView animateWithDuration:AJSLoadingViewAnimationDuration
                     animations:^{
                         self.bezelView.alpha = 1;
                         self.bezelView.transform = CGAffineTransformIdentity;
                         self.backgroundColor = AJSLoadingViewBackgroundColor;
                     }];
}

- (void) hide
{
    [self hideAfterDelay:0];
}

- (void) hideAfterDelay:(NSTimeInterval)delay
{    
    [UIView animateWithDuration:AJSLoadingViewAnimationDuration
                          delay:delay
                        options:0
                     animations:^{
                         
                         self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
                         self.bezelView.alpha = 0;
                         self.bezelView.transform = CGAffineTransformScale(self.bezelView.transform, AJSLoadingViewAnimationScale, AJSLoadingViewAnimationScale);
                         
                     } completion:^(BOOL finished) {
                         
                         self.bezelView = nil;
                         [self.bezelView removeFromSuperview];
                         [self removeFromSuperview];
                     }];
}


@end

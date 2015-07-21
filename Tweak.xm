@interface SBBannerContextView : UIView
- (id)_newGrabberView:(BOOL)view;
- (CGFloat)minimumHeight;
@end

@interface SBDefaultBannerView : UIView
- (CGRect)_textViewFrame;
- (CGRect)_iconImageViewFrame;
@end

@interface SBDefaultBannerTextView : UIView
@end

%hook SBBannerContextView
- (id)_newGrabberView:(BOOL)view {
	return nil;
}

- (CGFloat)minimumHeight {
	return 58;
}
%end

%hook SBDefaultBannerView
- (CGRect)_textViewFrame {
	CGRect newFrame = %orig;

	SBDefaultBannerTextView *textView = MSHookIvar<SBDefaultBannerTextView *>(self, "_textView");
	NSAttributedString *subtitleTextAttributedString = MSHookIvar<NSAttributedString *>(textView, "_subtitleTextAttributedString");

	if (subtitleTextAttributedString) {
		return CGRectMake(newFrame.origin.x, newFrame.origin.y - 3, newFrame.size.width, 58);
	}

	else {
		return CGRectMake(newFrame.origin.x, newFrame.origin.y + 5, newFrame.size.width, 58);
	}
}

- (CGRect)_iconImageViewFrame {
	CGRect textViewFrame = [self _textViewFrame];
	return CGRectMake(14, 14, textViewFrame.origin.x - 28, 30);
}
%end
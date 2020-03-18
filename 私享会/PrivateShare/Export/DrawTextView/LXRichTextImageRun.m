

#import "LXRichTextImageRun.h"
#import <CoreText/CoreText.h>

static const float kZoom = 1.1f;

@implementation LXRichTextImageRun

- (void)replaceTextWithAttributedString:(NSMutableAttributedString*) attString
{
    //删除替换的占位字符
    [attString deleteCharactersInRange:self.range];
    
    CTRunDelegateCallbacks emojiCallbacks;
    emojiCallbacks.version      = kCTRunDelegateVersion1;
    emojiCallbacks.dealloc      = TQRichTextRunEmojiDelegateDeallocCallback;
    emojiCallbacks.getAscent    = TQRichTextRunEmojiDelegateGetAscentCallback;
    emojiCallbacks.getDescent   = TQRichTextRunEmojiDelegateGetDescentCallback;
    emojiCallbacks.getWidth     = TQRichTextRunEmojiDelegateGetWidthCallback;

    NSMutableAttributedString *imageAttributedString = [[NSMutableAttributedString alloc] initWithString:@" "];
    
    //
    CTRunDelegateRef runDelegate = CTRunDelegateCreate(&emojiCallbacks, (__bridge void*)self);
    [imageAttributedString addAttribute:(NSString *)kCTRunDelegateAttributeName value:(__bridge id)runDelegate range:NSMakeRange(0, 1)];
    CFRelease(runDelegate);
    
    [attString insertAttributedString:imageAttributedString atIndex:self.range.location];
    
    [super replaceTextWithAttributedString:attString];
}

#pragma mark - RunDelegateCallback

void TQRichTextRunEmojiDelegateDeallocCallback(void *refCon)
{

}

//--上行高度
CGFloat TQRichTextRunEmojiDelegateGetAscentCallback(void *refCon)
{
    LXRichTextImageRun *run =(__bridge LXRichTextImageRun *) refCon;
    return run.originalFont.ascender * kZoom-1.5;
}

//--下行高度
CGFloat TQRichTextRunEmojiDelegateGetDescentCallback(void *refCon)
{
    LXRichTextImageRun *run =(__bridge LXRichTextImageRun *) refCon;
    return run.originalFont.descender * kZoom+0.5;
}

//-- 宽
CGFloat TQRichTextRunEmojiDelegateGetWidthCallback(void *refCon)
{
    LXRichTextImageRun *run =(__bridge LXRichTextImageRun *) refCon;
    CGFloat aspectRatio = 1.0;
    if ([daytopic containsObject:run.originalText]) {
        aspectRatio = 4.0;
    }
    return (run.originalFont.ascender - run.originalFont.descender) * kZoom * aspectRatio;
}

@end

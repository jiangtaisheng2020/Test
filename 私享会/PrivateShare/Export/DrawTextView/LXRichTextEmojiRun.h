

#import "LXRichTextBaseRun.h"
#import "LXRichTextImageRun.h"

@interface LXRichTextEmojiRun : LXRichTextImageRun

+ (NSString *)analyzeText:(NSString *)string runsArray:(NSMutableArray **)runArray;

@end

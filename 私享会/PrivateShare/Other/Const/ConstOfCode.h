//
//  ConstOfCode.h
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#ifndef ConstOfCode_h
#define ConstOfCode_h


#define NotificationCenter [NSNotificationCenter defaultCenter]
#define UserDefaults [NSUserDefaults standardUserDefaults]

#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]



#define DEFINE_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##classname = [[self alloc] init]; \
}); \
return shared##classname; \
} \


#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]


#endif /* ConstOfCode_h */

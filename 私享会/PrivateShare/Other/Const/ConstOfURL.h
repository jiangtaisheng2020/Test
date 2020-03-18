//
//  ConstOfURL.h
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#ifndef ConstOfURL_h
#define ConstOfURL_h

#define kSXHLoginServelet @"SiBenAppLoginServlet"
#define kSXHRegisetServerlet @"AppRegisterServlet"
#define kSXHWebSite @"IOSSIBENAPP"
#define kSXHCompany @"WEIXIN_APP_SIBEN"
#define kAPPName @"IOSSIBENAPP"

#define kSXHHttpPath @"http://auth.xunbao178.com/"
#define kSXHHandLoginPath @"?method=app_login&login_phone=%@&login_password=%@&website=%@&encodePass=true"
#define kSXHWXLoginPath @"?method=wx_login&code=%@&website=%@"
#define kSXHFindCodeGetCodePath @"login.gsp?method=sendCode&phone=%@"
#define kSXHRegisterGetCodePath @"?method=get_code&phone_number=%@"
#define kSXHRegistPath @"?method=params_regist&phone_number=%@&checkCode=%@&password=%@&nickname=%@"
#define kSXHForgetCodeLoginPath @"?method=phone_login&phone=%@&code=%@&website=%@"
#define kSXHLoginOutServerlet @"appLogout?"



#define kSXHForgetCodePath @""
#define kSXHHomePath @""
#define kSXHFindePath @""
#define kSXHCustomPath @""
#define kSXHPrivatePath @""
#define kSXHSuggetionPath @""
#define kSXHAvatarPath @""
#define kSXHNicknamePath @""
#define kSXHSexPath @""
#define kSXHSigniturePath @""
#define kSXHAreaPath @""
#define kSXHPostPath @""

#define kSXHH5LinksPath @"other/url/version"
#define kSXHXLSPath @"http://api.xilexuan.com/webchat/webapi/"
#define kSXHUserPath @"user/"
#define kSXHGetShortToken @"user/shorttimetoken/"
#define kSXHUserInfoPath @"userinfo/"
#define kSXHUserArea @"area"
#define kSXHUserNickName @"nickname"
#define kSXHUserSex @"sex"
#define kSXHVersion @"version"
#define kSXHUserSignature @"signature"
#define kSXHUploadPath @"http://img.xunbao178.com/upload"
#define kSXHImgUploadath @"/imgupload?"
#define kSXHImgUpload @"act=appavatar&userid=%@"
#define kSXHUserAvatar @"avatar"
#define kSXHGoddessPath @"goddess/forumservlet?"
#define kSXHDayTopicPath @"method=getTopicListByTagid&aid=66"
#define kSXHParaPath [NSString stringWithFormat:@"&m=wechat&client=%@&company=%@&code=",kAPPName,kSXHCompany]

#define kH5TabThreePath @""

#define kH5GroupErrandsPath @""
#define kH5CustomtravelPath @""
#define kH5RecommendedattractionsPath @""
#define kH5ButlerPath @""
#define kH5WorldTravelPath @""
#define kH5WonderfulLifePath @""
#define kH5CrossingFieldPath @""
#define kH5CaringCharityPath @""


#endif /* ConstOfURL_h */

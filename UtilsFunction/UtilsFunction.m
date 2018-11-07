//
//  UtilsFunction.m
//  UtilsFunction
//
//  Created by liuyanqi on 2016/10/18.
//  Copyright © 2016年 com.maple. All rights reserved.
//

#import "UtilsFunction.h"

@implementation UtilsFunction


#pragma mark 检测字符串是否为空
+ (BOOL)llCheckStringIsNull:(NSString *)str
{
    if (str == nil || str == NULL || [str isEqualToString:@""]) {
        return YES;
    }
    if ([str isKindOfClass:[NSNull class]]) {
        return YES;
    }
    //去除p空格后的字符
    if ([str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0) {
        return YES;
    }
    return NO;
}


#pragma mark --- 邮箱验证
+ (BOOL)llCheckStringIsEmailAddress:(NSString *)email{
    NSString *regexStr = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *regex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexStr];
    return [regex evaluateWithObject:email];
}

#pragma mark --- 检测手机号码的合法性
+ (BOOL)llCheckStringIsPhoneNum:(NSString *)phoneNumber
{
    NSString *regexStr = @"^(13|14|15|16|17|18|19)\\d{9}$";
    NSPredicate *regex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexStr];
    return [regex evaluateWithObject:phoneNumber];
    
}
#pragma mark --- 身份证号码验证(15|18)
+ (BOOL)llCheckStringIsIDNumber:(NSString *)idNumber{
    
    NSString *regexStr = @"(^[1-9]\\d{5}(18|19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$)|(^[1-9]\\d{5}\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{2}$)";
    NSPredicate *regex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexStr];
    return [regex evaluateWithObject:idNumber];
    
}

#pragma mark --- 去掉字符串前后 的空格
+ (NSString *)llCheckStringRemoveHeadFootSpace:(NSString *)string
{
    return  [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}


#pragma mark --- 去掉字符串  所有 的空格

+ (NSString*)llCheckStringRemoveSpace:(NSString *)string
{
    NSString *str = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    return str;
}



#pragma mark --- 汉字转拼音
+ (NSString *)chineseWordSwitchIntoPinyinWith:(NSString *)chinese
{
    //汉字转拼音
    NSMutableString *pinyin = [chinese mutableCopy];
    //转拼音
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    //去掉音标1234声
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    //转化后的拼音有空格
    //NSString中的stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]方法只是去掉左右两边的空格；
    // stringByReplacingOccurrencesOfString:@" " withString:@""];//可以去掉空格，注意此时生成的strEnd是autorelease属性的
    
    return [UtilsFunction removeSpaceInString:pinyin];
}

#pragma mark --- 根据颜色生成图片
+ (UIImage *) imageWithColor: (UIColor *) color
{
    //宽高 1.0只要有值就够了
    
    CGRect aFrame = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);     UIGraphicsBeginImageContext(aFrame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, aFrame);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
#pragma mark --- 根据时间戳生成--时间-----秒(北京时间)
+ (NSString*)switchTimeStampToTimeBySecond:(NSString*) timeStampStr
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timeStampStr floatValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}
#pragma mark ---根据时间戳生成--时间-----天(北京时间)
+ (NSString *)switchTimeStamptoTimeByDay:(NSString *)timeStampStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timeStampStr floatValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}
#pragma mark ---根据时间字符(北京时间)串生成时间戳-------秒
+ (NSString*)switchTimeStrToTimeStamp:(NSString*) timeStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    NSDate *date = [formatter dateFromString:timeStr]; //------------将字符串按formatter转成nsdate
    //----------将nsdate按formatter格式转成nsstring
    //时间转时间戳的方法:
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    NSLog(@"timeSp:%@",timeSp); //时间戳的值
    return timeSp;
}
#pragma mark ---生成当前时间的时间字符串---------秒
+ (NSString*)creatrTimeStrCurrentWithSecond
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *dateCurrent = [NSDate date];
    NSString *dateStr = [formatter stringFromDate:dateCurrent];
    NSLog(@"timeSp:%@",dateStr);
    return dateStr;
}
#pragma mark ---生成当前时间的时间字符串---------天
+ (NSString*)creatrTimeStrCurrentWithDay
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *dateCurrent = [NSDate date];
    NSString *dateStr = [formatter stringFromDate:dateCurrent];
    NSLog(@"timeSp:%@",dateStr);
    return dateStr;
    
}




#pragma mark 检测密码合法性
+ (BOOL)checkPasswordIsLegal:(NSString *)password
{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,18}+$";;
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passWordRegex];
    
    return [passWordPredicate evaluateWithObject:password];
}

#pragma mark 检测昵称合法性
+ (BOOL)checkNickNameIsLegal:(NSString *)nickName
{
    NSString *regex = @"[A-Za-z0-9_\\-\u4e00-\u9fa5]+";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:nickName];
}
#pragma mark  数组判空
+ (BOOL)checkEmptyArrayIsEmpty:(NSMutableArray *)array{
    if ([array isEqual:[NSNull class]]) {
        return YES;
    }else if ([array isKindOfClass:[NSNull class]]){
        return YES;
    }else if (array == nil){
        return YES;
    }else if (array.count <= 0){
        return YES;
    }
    return NO;
}

#pragma mark - 修改html代码字符串，适应webview
+ (NSString *)adaptWebViewForHtml:(NSString *) htmlStr
{
    NSMutableString *headHtml = [[NSMutableString alloc] initWithCapacity:0];
    [headHtml appendString : @"<html>" ];
    
    [headHtml appendString : @"<head>" ];
    
    [headHtml appendString : @"<meta charset=\"utf-8\">" ];
    
    [headHtml appendString : @"<meta id=\"viewport\" name=\"viewport\" content=\"width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=false\" />" ];
    
    [headHtml appendString : @"<meta name=\"apple-mobile-web-app-capable\" content=\"yes\" />" ];
    
    [headHtml appendString : @"<meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\" />" ];
    
    [headHtml appendString : @"<meta name=\"black\" name=\"apple-mobile-web-app-status-bar-style\" />" ];
    
    [headHtml appendString : @"<style>img{width:100%;}</style>" ];
    
    [headHtml appendString : @"<style>table{width:100%;}</style>" ];
    
    //[headHtml appendString : @"<title>webview</title>" ];
    
    NSString *bodyHtml;
    bodyHtml = [NSString stringWithString:headHtml];
    bodyHtml = [bodyHtml stringByAppendingString:htmlStr];
    return bodyHtml;
    
}

#pragma mark - 判断是否为纯数字
+ (BOOL)checkValueIsNumberAll:(NSString *)string
{
    NSScanner *scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

#pragma mark - 判断是否为小数
+ (BOOL)checkValueIsFloat:(NSString *)string
{
    //    NSScanner *scan = [NSScanner scannerWithString:string];
    //    float val;
    //    return [scan scanFloat:&val] && [scan isAtEnd];
    NSString *regex = @"^[1-9]\\d*\\.\\d+|0\\.\\d+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:string];
    
}

#pragma mark - 替换电话号码中间四位为星号
+ (NSString *)hiddenMiddleNumOfPhoneNum:(NSString *)phoneNum
{
    NSRange range = NSMakeRange(3, 4);
    NSMutableString *phoneNumStr = [NSMutableString stringWithString:phoneNum];
    [phoneNumStr replaceCharactersInRange:range withString:@"****"];
    return phoneNumStr;
}

#pragma mark - 去掉字符串中的特殊字符
+ (NSString *)removeSpecialChar:(NSString *)string
{
    //这里随意添加想要过滤的字符,加多少都可以
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"、＇：∶；?‘’“”〝〞ˆˇ﹕︰﹔﹖﹑¨….¸;！´？！～—ˉ｜‖＂〃｀@﹫¡¿﹏﹋﹌︴﹟#﹩$﹠&﹪%*﹡﹢﹦﹤‐￣¯―﹨ˆ˜﹍﹎+=<＿_-~﹉﹊（）!^()〈〉‹›﹛﹜『』〖〗［］《》〔〕{}「」【】"];
    //
    NSString *trimmedString =  [[string componentsSeparatedByCharactersInSet:set]componentsJoinedByString:@""];
    return trimmedString;
}

#pragma mark - 大数字转换
+ (NSString *)switchBigNumIntoUnit:(int)count
{
    NSString *title = @"";
    if (count >= 10000)
    { // 上万
        CGFloat final = count / 10000.0;
        title = [NSString stringWithFormat:@"%.1f万",final];
        title = [title stringByReplacingOccurrencesOfString:@".0" withString:@""];
    }else if (count >= 0)
    {
        title = [NSString stringWithFormat:@"%d",count];
    }
    return title;
}

#pragma mark - 获取设备唯一标示
+ (NSString *)getUniqueDeviceId
{
    UIDevice *device = [UIDevice currentDevice];
    NSString  *currentDeviceId = [[device identifierForVendor]UUIDString];
    return currentDeviceId;
}
#pragma mark - 通过appstore检查更新
+ (NSString *)GetAppCurrentVersion
{
    //获取当前版本
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = [infoDic objectForKey:@"CFBundleVersion"];
    return currentVersion;
}


#pragma mark --- 字符串局部着色
+(NSAttributedString *)stringWithColor:(UIColor *)color range:(NSRange)range string:(NSString *)string
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:string];
    [str addAttribute:NSForegroundColorAttributeName value:color range:range];
    return str;
}




@end


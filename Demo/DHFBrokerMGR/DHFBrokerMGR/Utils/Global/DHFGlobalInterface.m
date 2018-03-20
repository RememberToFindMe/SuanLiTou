//
//  GLFGlobalInterface.m
//  GLFStore
//
//  Created by 大黄蜂 on 2017/6/14.
//  Copyright © 2017年 gonglf. All rights reserved.
//

#import "DHFGlobalInterface.h"
#import "AppDelegate.h"

@interface DHFGlobalInterface ()

@end

@implementation DHFGlobalInterface

#pragma mark - FirstRun
+ (BOOL)isFirstRun {
    BOOL isFirstRun = [[NSUserDefaults standardUserDefaults] boolForKey:@"isFirstRun"];
    if (!isFirstRun) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isFirstRun"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    return !isFirstRun;
}

#pragma mark - Time
+ (NSString *)getTimeStringWithTime:(NSNumber *)timeNumber andDateFormat:(NSString *)dateFormat {
    
    if (!timeNumber) {
        return @"无";
    }
    
    NSString *timeString = @"";
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:([timeNumber doubleValue]/1000)];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    timeString = [formatter stringFromDate:date];
    return timeString;
}

#pragma mark - TextSize
+ (CGSize)getTextSizeWithContent:(NSString *)content contentWidth:(CGFloat)contentWidth contentFont:(UIFont *)font {
    CGSize size;
    
    NSDictionary *attribute = @{NSFontAttributeName:font};
    size = [content boundingRectWithSize:CGSizeMake(contentWidth, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    return size;
}

#pragma mark - Toast
+ (void)showToast:(NSString *)message {
    UIWindow *keyWindow = APPDELEGATE.window;
    MBProgressHUD *hud = [keyWindow viewWithTag:9998];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
        hud.tag = 9998;
    }
    
    [keyWindow bringSubviewToFront:hud];
    
    hud.dimBackground = NO;
    //屏幕下部，除去tabbar，再往上50的位置
    hud.yOffset = SCREEN_HEIGHT/2-NAV_BAR_HEIGHT-50;
    hud.mode = MBProgressHUDModeText;
    if (message.length < 10) {
        hud.labelText = message;
    } else {
        hud.detailsLabelText = message;
    }
    
    hud.labelFont = [UIFont systemFontOfSize:15];
    hud.margin = 10.0f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1];
}


//居中提示框
+ (void)showCenterToast:(NSString *)message
{
    UIWindow *keyWindow = APPDELEGATE.window;
    MBProgressHUD *hud = [keyWindow viewWithTag:9998];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
        hud.tag = 9998;
    }
    
    [keyWindow bringSubviewToFront:hud];
    
    hud.dimBackground = NO;
    //屏幕下部，除去tabbar，再往上50的位置
    hud.yOffset = 0;
    hud.mode = MBProgressHUDModeText;
    if (message.length < 10) {
        hud.labelText = message;
    } else {
        hud.detailsLabelText = message;
    }
    
    hud.labelFont = [UIFont systemFontOfSize:15];
    hud.margin = 10.0f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1];
}

+ (void)showLongToast:(NSString *)message second:(NSTimeInterval)delay
{
    UIWindow *keyWindow = APPDELEGATE.window;
    MBProgressHUD *hud = [keyWindow viewWithTag:9998];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
        hud.tag = 9998;
    }
    
    hud.dimBackground = NO;
    //屏幕下部，除去tabbar，再往上50的位置
    hud.yOffset = SCREEN_HEIGHT/2-49-50;
    hud.mode = MBProgressHUDModeText;
    if (message.length < 10) {
        hud.labelText = message;
    } else {
        hud.detailsLabelText = message;
    }
    
    hud.labelFont = [UIFont systemFontOfSize:14];
    hud.margin = 10.0f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:delay];
    
}

+ (void)showLoadingToast {
    UIWindow *keyWindow = APPDELEGATE.window;
    MBProgressHUD *hud = [keyWindow viewWithTag:9999];
    
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
        hud.tag = 9999;
    }
    
    [keyWindow bringSubviewToFront:hud];
//    //手动修改引用计数
//    [GLFUserInfo sharedManager].hudCount++;
    
    hud.dimBackground = NO;
    hud.mode = MBProgressHUDModeText;
    hud.labelFont = [UIFont systemFontOfSize:15];
    hud.labelText = @"努力加载中...";
}

+ (void)showLoadingToastWithTitle:(NSString *)title{
    UIWindow *keyWindow = APPDELEGATE.window;
    MBProgressHUD *hud = [keyWindow viewWithTag:9999];
    
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
        hud.tag = 9999;
    }
    
    [keyWindow bringSubviewToFront:hud];
//    //手动修改引用计数
//    [GLFUserInfo sharedManager].hudCount++;
    
    hud.dimBackground = NO;
    hud.mode = MBProgressHUDModeText;
    hud.labelFont = [UIFont systemFontOfSize:15];
    hud.labelText = title;
}

+ (void)hideLoadingToast {
//    //手动修改引用计数
//    GLFUserInfo *userInfo = [GLFUserInfo sharedManager];
//    userInfo.hudCount--;
//    
//    if (userInfo.hudCount <= 0) {
//        userInfo.hudCount = 0;
//    } else {
//        return;
//    }
    UIWindow *keyWindow = APPDELEGATE.window;
    MBProgressHUD *hud = [keyWindow viewWithTag:9999];
    [hud hide:YES];
}

#pragma mark - PhoneButton
+ (UIButton *)getCommonPhoneButton {
    UIButton *phoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    phoneButton.frame = CGRectMake(0, 0, 44, 44);
    [phoneButton setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
    return phoneButton;
}

//处理通讯录中号码的格式把1 (358) 125-3654 转化为13581253654
+ (NSString *)PhoneFormat:(NSString *)phone
{
    NSString *newPhone = @"";
    if ([phone length]==0) {
        return newPhone;
    }
    for (CFIndex i = 0; i<[phone length]; i++) {
        NSString *a = [phone substringWithRange:NSMakeRange(i, 1)];
        NSArray *dataArray = [NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
        if ([dataArray containsObject:a] ){
            newPhone = [newPhone stringByAppendingFormat:@"%@",a];
        }
    }
    return newPhone;
}

+ (NSAttributedString *)getLabelAttStringWithWholeString:(NSString *)wholeString rangeString:(NSString *)rangeString rangeTextColor:(UIColor *)rangeTextColor {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:wholeString];
    NSRange range = [wholeString rangeOfString:rangeString];
    if (range.location != NSNotFound) {
        [attributedString addAttribute:NSForegroundColorAttributeName value:rangeTextColor range:range];
    }
    
    return attributedString;
}

//验证身份证
//必须满足以下规则
//1. 长度必须是18位，前17位必须是数字，第十八位可以是数字或X
//2. 前两位必须是以下情形中的一种：11,12,13,14,15,21,22,23,31,32,33,34,35,36,37,41,42,43,44,45,46,50,51,52,53,54,61,62,63,64,65,71,81,82,91
//3. 第7到第14位出生年月日。第7到第10位为出生年份；11到12位表示月份，范围为01-12；13到14位为合法的日期
//4. 第17位表示性别，双数表示女，单数表示男
//5. 第18位为前17位的校验位
//算法如下：
//（1）校验和 = (n1 + n11) * 7 + (n2 + n12) * 9 + (n3 + n13) * 10 + (n4 + n14) * 5 + (n5 + n15) * 8 + (n6 + n16) * 4 + (n7 + n17) * 2 + n8 + n9 * 6 + n10 * 3，其中n数值，表示第几位的数字
//（2）余数 ＝ 校验和 % 11
//（3）如果余数为0，校验位应为1，余数为1到10校验位应为字符串“0X98765432”(不包括分号)的第余数位的值（比如余数等于3，校验位应为9）
//6. 出生年份的前两位必须是19或20
+ (BOOL)verifyIDCardNumber:(NSString *)cardNo
{
    if (cardNo.length != 18) {
        return NO;
    }
    NSArray* codeArray = [NSArray arrayWithObjects:@"7",@"9",@"10",@"5",@"8",@"4",@"2",@"1",@"6",@"3",@"7",@"9",@"10",@"5",@"8",@"4",@"2", nil];
    NSDictionary* checkCodeDic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"1",@"0",@"X",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2", nil] forKeys:[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil]];
    NSScanner* scan = [NSScanner scannerWithString:[cardNo substringToIndex:17]];
    int val;
    BOOL isNum = [scan scanInt:&val] && [scan isAtEnd];
    if (!isNum) {
        return NO;
    }
    int sumValue = 0;
    for (int i =0; i<17; i++) {
        sumValue+=[[cardNo substringWithRange:NSMakeRange(i , 1) ] intValue]* [[codeArray objectAtIndex:i] intValue];
    }
    NSString* strlast = [checkCodeDic objectForKey:[NSString stringWithFormat:@"%d",sumValue%11]];
    if ([strlast isEqualToString: [[cardNo substringWithRange:NSMakeRange(17, 1)]uppercaseString]]) {
        return YES;
    }
    return NO;
    
//    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    if ([value length] != 18) {
//        return NO;
//    }
//    NSString *mmdd = @"(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8])))";
//    NSString *leapMmdd = @"0229";
//    NSString *year = @"(19|20)[0-9]{2}";
//    NSString *leapYear = @"(19|20)(0[48]|[2468][048]|[13579][26])";
//    NSString *yearMmdd = [NSString stringWithFormat:@"%@%@", year, mmdd];
//    NSString *leapyearMmdd = [NSString stringWithFormat:@"%@%@", leapYear, leapMmdd];
//    NSString *yyyyMmdd = [NSString stringWithFormat:@"((%@)|(%@)|(%@))", yearMmdd, leapyearMmdd, @"20000229"];
//    NSString *area = @"(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|82|[7-9]1)[0-9]{4}";
//    NSString *regex = [NSString stringWithFormat:@"%@%@%@", area, yyyyMmdd  , @"[0-9]{3}[0-9Xx]"];
//    
//    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
//    if (![regexTest evaluateWithObject:value]) {
//        return NO;
//    }
//    int summary = ([value substringWithRange:NSMakeRange(0,1)].intValue + [value substringWithRange:NSMakeRange(10,1)].intValue) *7
//    + ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9
//    + ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10
//    + ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5
//    + ([value substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8
//    + ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4
//    + ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2
//    + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6
//    + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
//    NSInteger remainder = summary % 11;
//    NSString *checkBit = @"";
//    NSString *checkString = @"10X98765432";
//    checkBit = [checkString substringWithRange:NSMakeRange(remainder,1)];// 判断校验位
//    return [checkBit isEqualToString:[[value substringWithRange:NSMakeRange(17,1)] uppercaseString]];
}

@end

/**
 * Copyright (C) 2009 bdferris <bdferris@onebusaway.org>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, OBAErrorCode) {
    OBAErrorCodeLocationAuthorizationFailed = 1002,
    OBAErrorCodePushNotificationAuthorizationDenied,
    OBAErrorCodeMissingMethodParameters,
    OBAErrorCodeBadData,
};

extern NSString * const OBAErrorDomain;

// 3D Touch Quick Actions
extern NSString * const kApplicationShortcutRecents;

// User Defaults Keys
extern NSString * const OBADisplayUserHeadingOnMapDefaultsKey;
extern NSString * const OBAOptInToTrackingDefaultsKey;
extern NSString * const OBAOptInToCrashReportingDefaultsKey;
extern NSString * const OBAMapSelectedTypeDefaultsKey;
extern NSString * const OBADebugModeUserDefaultsKey;
extern NSString * const OBAUseStopDrawerDefaultsKey;
extern NSString * const OBAForecastUpdatedAtDefaultsKey;
extern NSString * const OBAForecastDataDefaultsKey;

// NSNotification Names
extern NSString * const OBAForecastUpdatedNotification;

// Server Addresses
extern NSString * const OBAInAppDeepLinkSchemeAddress;
extern NSString * const OBADeepLinkServerAddress;
extern NSString * const OBARegionsServerAddress;

/**
 We report "YES" and "NO" to Google Analytics in several places. This method
 DRYs those up.
 */
NSString * OBAStringFromBool(BOOL yn);

@interface OBACommon : NSObject
+ (void)setRunningInsideTests:(BOOL)runningInsideTests;
+ (BOOL)isRunningInsideTests;
@property(class,nonatomic,assign) BOOL debugMode;
@end

NS_ASSUME_NONNULL_END

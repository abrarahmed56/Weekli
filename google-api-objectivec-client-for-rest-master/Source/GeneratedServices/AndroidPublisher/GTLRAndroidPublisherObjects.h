// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Google Play Developer API (androidpublisher/v2)
// Description:
//   Lets Android application developers access their Google Play accounts.
// Documentation:
//   https://developers.google.com/android-publisher

#if GTLR_BUILT_AS_FRAMEWORK
  #import "GTLR/GTLRObject.h"
#else
  #import "GTLRObject.h"
#endif

#if GTLR_RUNTIME_VERSION != 3000
#error This file was generated by a different version of ServiceGenerator which is incompatible with this GTLR library source.
#endif

@class GTLRAndroidPublisher_Apk;
@class GTLRAndroidPublisher_ApkBinary;
@class GTLRAndroidPublisher_ApkListing;
@class GTLRAndroidPublisher_Comment;
@class GTLRAndroidPublisher_DeobfuscationFile;
@class GTLRAndroidPublisher_DeveloperComment;
@class GTLRAndroidPublisher_DeviceMetadata;
@class GTLRAndroidPublisher_Entitlement;
@class GTLRAndroidPublisher_ExpansionFile;
@class GTLRAndroidPublisher_ExternallyHostedApk;
@class GTLRAndroidPublisher_ExternallyHostedApkUsesPermission;
@class GTLRAndroidPublisher_Image;
@class GTLRAndroidPublisher_InAppProduct;
@class GTLRAndroidPublisher_InAppProduct_Listings;
@class GTLRAndroidPublisher_InAppProduct_Prices;
@class GTLRAndroidPublisher_InAppProductListing;
@class GTLRAndroidPublisher_InappproductsBatchRequestEntry;
@class GTLRAndroidPublisher_InappproductsBatchResponseEntry;
@class GTLRAndroidPublisher_InappproductsInsertRequest;
@class GTLRAndroidPublisher_InappproductsInsertResponse;
@class GTLRAndroidPublisher_InappproductsUpdateRequest;
@class GTLRAndroidPublisher_InappproductsUpdateResponse;
@class GTLRAndroidPublisher_Listing;
@class GTLRAndroidPublisher_MonthDay;
@class GTLRAndroidPublisher_PageInfo;
@class GTLRAndroidPublisher_Price;
@class GTLRAndroidPublisher_Prorate;
@class GTLRAndroidPublisher_Review;
@class GTLRAndroidPublisher_ReviewReplyResult;
@class GTLRAndroidPublisher_Season;
@class GTLRAndroidPublisher_SubscriptionDeferralInfo;
@class GTLRAndroidPublisher_Timestamp;
@class GTLRAndroidPublisher_TokenPagination;
@class GTLRAndroidPublisher_Track;
@class GTLRAndroidPublisher_UserComment;
@class GTLRAndroidPublisher_VoidedPurchase;

// Generated comments include content from the discovery document; avoid them
// causing warnings since clang's checks are some what arbitrary.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"

NS_ASSUME_NONNULL_BEGIN

/**
 *  GTLRAndroidPublisher_Apk
 */
@interface GTLRAndroidPublisher_Apk : GTLRObject

/** Information about the binary payload of this APK. */
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_ApkBinary *binary;

/**
 *  The version code of the APK, as specified in the APK's manifest file.
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *versionCode;

@end


/**
 *  Represents the binary payload of an APK.
 */
@interface GTLRAndroidPublisher_ApkBinary : GTLRObject

/**
 *  A sha1 hash of the APK payload, encoded as a hex string and matching the
 *  output of the sha1sum command.
 */
@property(nonatomic, copy, nullable) NSString *sha1;

/**
 *  A sha256 hash of the APK payload, encoded as a hex string and matching the
 *  output of the sha256sum command.
 */
@property(nonatomic, copy, nullable) NSString *sha256;

@end


/**
 *  GTLRAndroidPublisher_ApkListing
 */
@interface GTLRAndroidPublisher_ApkListing : GTLRObject

/** The language code, in BCP 47 format (eg "en-US"). */
@property(nonatomic, copy, nullable) NSString *language;

/** Describe what's new in your APK. */
@property(nonatomic, copy, nullable) NSString *recentChanges;

@end


/**
 *  GTLRAndroidPublisher_ApkListingsListResponse
 */
@interface GTLRAndroidPublisher_ApkListingsListResponse : GTLRObject

/**
 *  Identifies what kind of resource this is. Value: the fixed string
 *  "androidpublisher#apkListingsListResponse".
 */
@property(nonatomic, copy, nullable) NSString *kind;

@property(nonatomic, strong, nullable) NSArray<GTLRAndroidPublisher_ApkListing *> *listings;

@end


/**
 *  GTLRAndroidPublisher_ApksAddExternallyHostedRequest
 */
@interface GTLRAndroidPublisher_ApksAddExternallyHostedRequest : GTLRObject

/** The definition of the externally-hosted APK and where it is located. */
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_ExternallyHostedApk *externallyHostedApk;

@end


/**
 *  GTLRAndroidPublisher_ApksAddExternallyHostedResponse
 */
@interface GTLRAndroidPublisher_ApksAddExternallyHostedResponse : GTLRObject

/** The definition of the externally-hosted APK and where it is located. */
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_ExternallyHostedApk *externallyHostedApk;

@end


/**
 *  GTLRAndroidPublisher_ApksListResponse
 */
@interface GTLRAndroidPublisher_ApksListResponse : GTLRObject

@property(nonatomic, strong, nullable) NSArray<GTLRAndroidPublisher_Apk *> *apks;

/**
 *  Identifies what kind of resource this is. Value: the fixed string
 *  "androidpublisher#apksListResponse".
 */
@property(nonatomic, copy, nullable) NSString *kind;

@end


/**
 *  GTLRAndroidPublisher_AppDetails
 */
@interface GTLRAndroidPublisher_AppDetails : GTLRObject

/** The user-visible support email for this app. */
@property(nonatomic, copy, nullable) NSString *contactEmail;

/** The user-visible support telephone number for this app. */
@property(nonatomic, copy, nullable) NSString *contactPhone;

/** The user-visible website for this app. */
@property(nonatomic, copy, nullable) NSString *contactWebsite;

/** Default language code, in BCP 47 format (eg "en-US"). */
@property(nonatomic, copy, nullable) NSString *defaultLanguage;

@end


/**
 *  Represents an edit of an app. An edit allows clients to make multiple
 *  changes before committing them in one operation.
 */
@interface GTLRAndroidPublisher_AppEdit : GTLRObject

/**
 *  The time at which the edit will expire and will be no longer valid for use
 *  in any subsequent API calls (encoded as seconds since the Epoch).
 */
@property(nonatomic, copy, nullable) NSString *expiryTimeSeconds;

/**
 *  The ID of the edit that can be used in subsequent API calls.
 *
 *  identifier property maps to 'id' in JSON (to avoid Objective C's 'id').
 */
@property(nonatomic, copy, nullable) NSString *identifier;

@end


/**
 *  GTLRAndroidPublisher_Comment
 */
@interface GTLRAndroidPublisher_Comment : GTLRObject

/** A comment from a developer. */
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_DeveloperComment *developerComment;

/** A comment from a user. */
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_UserComment *userComment;

@end


/**
 *  Represents a deobfuscation file.
 */
@interface GTLRAndroidPublisher_DeobfuscationFile : GTLRObject

/** The type of the deobfuscation file. */
@property(nonatomic, copy, nullable) NSString *symbolType;

@end


/**
 *  GTLRAndroidPublisher_DeobfuscationFilesUploadResponse
 */
@interface GTLRAndroidPublisher_DeobfuscationFilesUploadResponse : GTLRObject

@property(nonatomic, strong, nullable) GTLRAndroidPublisher_DeobfuscationFile *deobfuscationFile;

@end


/**
 *  GTLRAndroidPublisher_DeveloperComment
 */
@interface GTLRAndroidPublisher_DeveloperComment : GTLRObject

/** The last time at which this comment was updated. */
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_Timestamp *lastModified;

/** The content of the comment, i.e. reply body. */
@property(nonatomic, copy, nullable) NSString *text;

@end


/**
 *  GTLRAndroidPublisher_DeviceMetadata
 */
@interface GTLRAndroidPublisher_DeviceMetadata : GTLRObject

/** Device CPU make e.g. "Qualcomm" */
@property(nonatomic, copy, nullable) NSString *cpuMake;

/** Device CPU model e.g. "MSM8974" */
@property(nonatomic, copy, nullable) NSString *cpuModel;

/** Device class (e.g. tablet) */
@property(nonatomic, copy, nullable) NSString *deviceClass;

/**
 *  OpenGL version
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *glEsVersion;

/** Device manufacturer (e.g. Motorola) */
@property(nonatomic, copy, nullable) NSString *manufacturer;

/** Comma separated list of native platforms (e.g. "arm", "arm7") */
@property(nonatomic, copy, nullable) NSString *nativePlatform;

/** Device model name (e.g. Droid) */
@property(nonatomic, copy, nullable) NSString *productName;

/**
 *  Device RAM in Megabytes e.g. "2048"
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *ramMb;

/**
 *  Screen density in DPI
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *screenDensityDpi;

/**
 *  Screen height in pixels
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *screenHeightPx;

/**
 *  Screen width in pixels
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *screenWidthPx;

@end


/**
 *  An Entitlement resource indicates a user's current entitlement to an inapp
 *  item or subscription.
 */
@interface GTLRAndroidPublisher_Entitlement : GTLRObject

/**
 *  This kind represents an entitlement object in the androidpublisher service.
 */
@property(nonatomic, copy, nullable) NSString *kind;

/** The SKU of the product. */
@property(nonatomic, copy, nullable) NSString *productId;

/**
 *  The type of the inapp product. Possible values are:
 *  - In-app item: "inapp"
 *  - Subscription: "subs"
 */
@property(nonatomic, copy, nullable) NSString *productType;

/**
 *  The token which can be verified using the subscriptions or products API.
 */
@property(nonatomic, copy, nullable) NSString *token;

@end


/**
 *  GTLRAndroidPublisher_EntitlementsListResponse
 */
@interface GTLRAndroidPublisher_EntitlementsListResponse : GTLRObject

@property(nonatomic, strong, nullable) GTLRAndroidPublisher_PageInfo *pageInfo;
@property(nonatomic, strong, nullable) NSArray<GTLRAndroidPublisher_Entitlement *> *resources;
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_TokenPagination *tokenPagination;

@end


/**
 *  GTLRAndroidPublisher_ExpansionFile
 */
@interface GTLRAndroidPublisher_ExpansionFile : GTLRObject

/**
 *  If set this field indicates that this APK has an Expansion File uploaded to
 *  it: this APK does not reference another APK's Expansion File. The field's
 *  value is the size of the uploaded Expansion File in bytes.
 *
 *  Uses NSNumber of longLongValue.
 */
@property(nonatomic, strong, nullable) NSNumber *fileSize;

/**
 *  If set this APK's Expansion File references another APK's Expansion File.
 *  The file_size field will not be set.
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *referencesVersion;

@end


/**
 *  GTLRAndroidPublisher_ExpansionFilesUploadResponse
 */
@interface GTLRAndroidPublisher_ExpansionFilesUploadResponse : GTLRObject

@property(nonatomic, strong, nullable) GTLRAndroidPublisher_ExpansionFile *expansionFile;

@end


/**
 *  Defines an APK available for this application that is hosted externally and
 *  not uploaded to Google Play. This function is only available to enterprises
 *  who are using Google Play for Work, and whos application is restricted to
 *  the enterprise private channel
 */
@interface GTLRAndroidPublisher_ExternallyHostedApk : GTLRObject

/** The application label. */
@property(nonatomic, copy, nullable) NSString *applicationLabel;

/**
 *  A certificate (or array of certificates if a certificate-chain is used) used
 *  to signed this APK, represented as a base64 encoded byte array.
 */
@property(nonatomic, strong, nullable) NSArray<NSString *> *certificateBase64s;

/** The URL at which the APK is hosted. This must be an https URL. */
@property(nonatomic, copy, nullable) NSString *externallyHostedUrl;

/**
 *  The SHA1 checksum of this APK, represented as a base64 encoded byte array.
 */
@property(nonatomic, copy, nullable) NSString *fileSha1Base64;

/**
 *  The SHA256 checksum of this APK, represented as a base64 encoded byte array.
 */
@property(nonatomic, copy, nullable) NSString *fileSha256Base64;

/**
 *  The file size in bytes of this APK.
 *
 *  Uses NSNumber of longLongValue.
 */
@property(nonatomic, strong, nullable) NSNumber *fileSize;

/** The icon image from the APK, as a base64 encoded byte array. */
@property(nonatomic, copy, nullable) NSString *iconBase64;

/**
 *  The maximum SDK supported by this APK (optional).
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *maximumSdk;

/**
 *  The minimum SDK targeted by this APK.
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *minimumSdk;

/** The native code environments supported by this APK (optional). */
@property(nonatomic, strong, nullable) NSArray<NSString *> *nativeCodes;

/** The package name. */
@property(nonatomic, copy, nullable) NSString *packageName;

/** The features required by this APK (optional). */
@property(nonatomic, strong, nullable) NSArray<NSString *> *usesFeatures;

/** The permissions requested by this APK. */
@property(nonatomic, strong, nullable) NSArray<GTLRAndroidPublisher_ExternallyHostedApkUsesPermission *> *usesPermissions;

/**
 *  The version code of this APK.
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *versionCode;

/** The version name of this APK. */
@property(nonatomic, copy, nullable) NSString *versionName;

@end


/**
 *  A permission used by this APK.
 */
@interface GTLRAndroidPublisher_ExternallyHostedApkUsesPermission : GTLRObject

/**
 *  Optionally, the maximum SDK version for which the permission is required.
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *maxSdkVersion;

/** The name of the permission requested. */
@property(nonatomic, copy, nullable) NSString *name;

@end


/**
 *  GTLRAndroidPublisher_Image
 */
@interface GTLRAndroidPublisher_Image : GTLRObject

/**
 *  A unique id representing this image.
 *
 *  identifier property maps to 'id' in JSON (to avoid Objective C's 'id').
 */
@property(nonatomic, copy, nullable) NSString *identifier;

/** A sha1 hash of the image that was uploaded. */
@property(nonatomic, copy, nullable) NSString *sha1;

/** A URL that will serve a preview of the image. */
@property(nonatomic, copy, nullable) NSString *url;

@end


/**
 *  GTLRAndroidPublisher_ImagesDeleteAllResponse
 */
@interface GTLRAndroidPublisher_ImagesDeleteAllResponse : GTLRObject

@property(nonatomic, strong, nullable) NSArray<GTLRAndroidPublisher_Image *> *deleted;

@end


/**
 *  GTLRAndroidPublisher_ImagesListResponse
 */
@interface GTLRAndroidPublisher_ImagesListResponse : GTLRObject

@property(nonatomic, strong, nullable) NSArray<GTLRAndroidPublisher_Image *> *images;

@end


/**
 *  GTLRAndroidPublisher_ImagesUploadResponse
 */
@interface GTLRAndroidPublisher_ImagesUploadResponse : GTLRObject

@property(nonatomic, strong, nullable) GTLRAndroidPublisher_Image *image;

@end


/**
 *  GTLRAndroidPublisher_InAppProduct
 */
@interface GTLRAndroidPublisher_InAppProduct : GTLRObject

/**
 *  The default language of the localized data, as defined by BCP 47. e.g.
 *  "en-US", "en-GB".
 */
@property(nonatomic, copy, nullable) NSString *defaultLanguage;

/**
 *  Default price cannot be zero. In-app products can never be free. Default
 *  price is always in the developer's Checkout merchant currency.
 */
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_Price *defaultPrice;

/** List of localized title and description data. */
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_InAppProduct_Listings *listings;

/** The package name of the parent app. */
@property(nonatomic, copy, nullable) NSString *packageName;

/**
 *  Prices per buyer region. None of these prices should be zero. In-app
 *  products can never be free.
 */
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_InAppProduct_Prices *prices;

/** Purchase type enum value. Unmodifiable after creation. */
@property(nonatomic, copy, nullable) NSString *purchaseType;

/**
 *  Definition of a season for a seasonal subscription. Can be defined only for
 *  yearly subscriptions.
 */
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_Season *season;

/** The stock-keeping-unit (SKU) of the product, unique within an app. */
@property(nonatomic, copy, nullable) NSString *sku;

@property(nonatomic, copy, nullable) NSString *status;

/**
 *  Subscription period, specified in ISO 8601 format. Acceptable values are
 *  "P1W" (one week), "P1M" (one month), "P3M" (three months), "P6M" (six
 *  months), and "P1Y" (one year).
 */
@property(nonatomic, copy, nullable) NSString *subscriptionPeriod;

/**
 *  Trial period, specified in ISO 8601 format. Acceptable values are anything
 *  between "P7D" (seven days) and "P999D" (999 days). Seasonal subscriptions
 *  cannot have a trial period.
 */
@property(nonatomic, copy, nullable) NSString *trialPeriod;

@end


/**
 *  List of localized title and description data.
 *
 *  @note This class is documented as having more properties of
 *        GTLRAndroidPublisher_InAppProductListing. Use @c -additionalJSONKeys
 *        and @c -additionalPropertyForName: to get the list of properties and
 *        then fetch them; or @c -additionalProperties to fetch them all at
 *        once.
 */
@interface GTLRAndroidPublisher_InAppProduct_Listings : GTLRObject
@end


/**
 *  Prices per buyer region. None of these prices should be zero. In-app
 *  products can never be free.
 *
 *  @note This class is documented as having more properties of
 *        GTLRAndroidPublisher_Price. Use @c -additionalJSONKeys and @c
 *        -additionalPropertyForName: to get the list of properties and then
 *        fetch them; or @c -additionalProperties to fetch them all at once.
 */
@interface GTLRAndroidPublisher_InAppProduct_Prices : GTLRObject
@end


/**
 *  GTLRAndroidPublisher_InAppProductListing
 */
@interface GTLRAndroidPublisher_InAppProductListing : GTLRObject

/**
 *  descriptionProperty
 *
 *  Remapped to 'descriptionProperty' to avoid NSObject's 'description'.
 */
@property(nonatomic, copy, nullable) NSString *descriptionProperty;

@property(nonatomic, copy, nullable) NSString *title;

@end


/**
 *  GTLRAndroidPublisher_InappproductsBatchRequest
 */
@interface GTLRAndroidPublisher_InappproductsBatchRequest : GTLRObject

@property(nonatomic, strong, nullable) NSArray<GTLRAndroidPublisher_InappproductsBatchRequestEntry *> *entrys;

@end


/**
 *  GTLRAndroidPublisher_InappproductsBatchRequestEntry
 */
@interface GTLRAndroidPublisher_InappproductsBatchRequestEntry : GTLRObject

/**
 *  batchId
 *
 *  Uses NSNumber of unsignedIntValue.
 */
@property(nonatomic, strong, nullable) NSNumber *batchId;

@property(nonatomic, strong, nullable) GTLRAndroidPublisher_InappproductsInsertRequest *inappproductsinsertrequest;
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_InappproductsUpdateRequest *inappproductsupdaterequest;
@property(nonatomic, copy, nullable) NSString *methodName;

@end


/**
 *  GTLRAndroidPublisher_InappproductsBatchResponse
 */
@interface GTLRAndroidPublisher_InappproductsBatchResponse : GTLRObject

@property(nonatomic, strong, nullable) NSArray<GTLRAndroidPublisher_InappproductsBatchResponseEntry *> *entrys;

/**
 *  Identifies what kind of resource this is. Value: the fixed string
 *  "androidpublisher#inappproductsBatchResponse".
 */
@property(nonatomic, copy, nullable) NSString *kind;

@end


/**
 *  GTLRAndroidPublisher_InappproductsBatchResponseEntry
 */
@interface GTLRAndroidPublisher_InappproductsBatchResponseEntry : GTLRObject

/**
 *  batchId
 *
 *  Uses NSNumber of unsignedIntValue.
 */
@property(nonatomic, strong, nullable) NSNumber *batchId;

@property(nonatomic, strong, nullable) GTLRAndroidPublisher_InappproductsInsertResponse *inappproductsinsertresponse;
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_InappproductsUpdateResponse *inappproductsupdateresponse;

@end


/**
 *  GTLRAndroidPublisher_InappproductsInsertRequest
 */
@interface GTLRAndroidPublisher_InappproductsInsertRequest : GTLRObject

@property(nonatomic, strong, nullable) GTLRAndroidPublisher_InAppProduct *inappproduct;

@end


/**
 *  GTLRAndroidPublisher_InappproductsInsertResponse
 */
@interface GTLRAndroidPublisher_InappproductsInsertResponse : GTLRObject

@property(nonatomic, strong, nullable) GTLRAndroidPublisher_InAppProduct *inappproduct;

@end


/**
 *  GTLRAndroidPublisher_InappproductsListResponse
 */
@interface GTLRAndroidPublisher_InappproductsListResponse : GTLRObject

@property(nonatomic, strong, nullable) NSArray<GTLRAndroidPublisher_InAppProduct *> *inappproduct;

/**
 *  Identifies what kind of resource this is. Value: the fixed string
 *  "androidpublisher#inappproductsListResponse".
 */
@property(nonatomic, copy, nullable) NSString *kind;

@property(nonatomic, strong, nullable) GTLRAndroidPublisher_PageInfo *pageInfo;
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_TokenPagination *tokenPagination;

@end


/**
 *  GTLRAndroidPublisher_InappproductsUpdateRequest
 */
@interface GTLRAndroidPublisher_InappproductsUpdateRequest : GTLRObject

@property(nonatomic, strong, nullable) GTLRAndroidPublisher_InAppProduct *inappproduct;

@end


/**
 *  GTLRAndroidPublisher_InappproductsUpdateResponse
 */
@interface GTLRAndroidPublisher_InappproductsUpdateResponse : GTLRObject

@property(nonatomic, strong, nullable) GTLRAndroidPublisher_InAppProduct *inappproduct;

@end


/**
 *  GTLRAndroidPublisher_Listing
 */
@interface GTLRAndroidPublisher_Listing : GTLRObject

/**
 *  Full description of the app; this may be up to 4000 characters in length.
 */
@property(nonatomic, copy, nullable) NSString *fullDescription;

/** Language localization code (for example, "de-AT" for Austrian German). */
@property(nonatomic, copy, nullable) NSString *language;

/**
 *  Short description of the app (previously known as promo text); this may be
 *  up to 80 characters in length.
 */
@property(nonatomic, copy, nullable) NSString *shortDescription;

/** App's localized title. */
@property(nonatomic, copy, nullable) NSString *title;

/** URL of a promotional YouTube video for the app. */
@property(nonatomic, copy, nullable) NSString *video;

@end


/**
 *  GTLRAndroidPublisher_ListingsListResponse
 */
@interface GTLRAndroidPublisher_ListingsListResponse : GTLRObject

/**
 *  Identifies what kind of resource this is. Value: the fixed string
 *  "androidpublisher#listingsListResponse".
 */
@property(nonatomic, copy, nullable) NSString *kind;

@property(nonatomic, strong, nullable) NSArray<GTLRAndroidPublisher_Listing *> *listings;

@end


/**
 *  GTLRAndroidPublisher_MonthDay
 */
@interface GTLRAndroidPublisher_MonthDay : GTLRObject

/**
 *  Day of a month, value in [1, 31] range. Valid range depends on the specified
 *  month.
 *
 *  Uses NSNumber of unsignedIntValue.
 */
@property(nonatomic, strong, nullable) NSNumber *day;

/**
 *  Month of a year. e.g. 1 = JAN, 2 = FEB etc.
 *
 *  Uses NSNumber of unsignedIntValue.
 */
@property(nonatomic, strong, nullable) NSNumber *month;

@end


/**
 *  GTLRAndroidPublisher_PageInfo
 */
@interface GTLRAndroidPublisher_PageInfo : GTLRObject

/**
 *  resultPerPage
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *resultPerPage;

/**
 *  startIndex
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *startIndex;

/**
 *  totalResults
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *totalResults;

@end


/**
 *  GTLRAndroidPublisher_Price
 */
@interface GTLRAndroidPublisher_Price : GTLRObject

/** 3 letter Currency code, as defined by ISO 4217. */
@property(nonatomic, copy, nullable) NSString *currency;

/**
 *  The price in millionths of the currency base unit represented as a string.
 */
@property(nonatomic, copy, nullable) NSString *priceMicros;

@end


/**
 *  A ProductPurchase resource indicates the status of a user's inapp product
 *  purchase.
 */
@interface GTLRAndroidPublisher_ProductPurchase : GTLRObject

/**
 *  The consumption state of the inapp product. Possible values are:
 *  - Yet to be consumed
 *  - Consumed
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *consumptionState;

/**
 *  A developer-specified string that contains supplemental information about an
 *  order.
 */
@property(nonatomic, copy, nullable) NSString *developerPayload;

/**
 *  This kind represents an inappPurchase object in the androidpublisher
 *  service.
 */
@property(nonatomic, copy, nullable) NSString *kind;

/** The order id associated with the purchase of the inapp product. */
@property(nonatomic, copy, nullable) NSString *orderId;

/**
 *  The purchase state of the order. Possible values are:
 *  - Purchased
 *  - Cancelled
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *purchaseState;

/**
 *  The time the product was purchased, in milliseconds since the epoch (Jan 1,
 *  1970).
 *
 *  Uses NSNumber of longLongValue.
 */
@property(nonatomic, strong, nullable) NSNumber *purchaseTimeMillis;

@end


/**
 *  GTLRAndroidPublisher_Prorate
 */
@interface GTLRAndroidPublisher_Prorate : GTLRObject

/**
 *  Default price cannot be zero and must be less than the full subscription
 *  price. Default price is always in the developer's Checkout merchant
 *  currency. Targeted countries have their prices set automatically based on
 *  the default_price.
 */
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_Price *defaultPrice;

/** Defines the first day on which the price takes effect. */
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_MonthDay *start;

@end


/**
 *  GTLRAndroidPublisher_Review
 */
@interface GTLRAndroidPublisher_Review : GTLRObject

/** The name of the user who wrote the review. */
@property(nonatomic, copy, nullable) NSString *authorName;

/** A repeated field containing comments for the review. */
@property(nonatomic, strong, nullable) NSArray<GTLRAndroidPublisher_Comment *> *comments;

/** Unique identifier for this review. */
@property(nonatomic, copy, nullable) NSString *reviewId;

@end


/**
 *  GTLRAndroidPublisher_ReviewReplyResult
 */
@interface GTLRAndroidPublisher_ReviewReplyResult : GTLRObject

/** The time at which the reply took effect. */
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_Timestamp *lastEdited;

/** The reply text that was applied. */
@property(nonatomic, copy, nullable) NSString *replyText;

@end


/**
 *  GTLRAndroidPublisher_ReviewsListResponse
 */
@interface GTLRAndroidPublisher_ReviewsListResponse : GTLRObject

@property(nonatomic, strong, nullable) GTLRAndroidPublisher_PageInfo *pageInfo;
@property(nonatomic, strong, nullable) NSArray<GTLRAndroidPublisher_Review *> *reviews;
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_TokenPagination *tokenPagination;

@end


/**
 *  GTLRAndroidPublisher_ReviewsReplyRequest
 */
@interface GTLRAndroidPublisher_ReviewsReplyRequest : GTLRObject

/**
 *  The text to set as the reply. Replies of more than approximately 350
 *  characters will be rejected. HTML tags will be stripped.
 */
@property(nonatomic, copy, nullable) NSString *replyText;

@end


/**
 *  GTLRAndroidPublisher_ReviewsReplyResponse
 */
@interface GTLRAndroidPublisher_ReviewsReplyResponse : GTLRObject

@property(nonatomic, strong, nullable) GTLRAndroidPublisher_ReviewReplyResult *result;

@end


/**
 *  GTLRAndroidPublisher_Season
 */
@interface GTLRAndroidPublisher_Season : GTLRObject

/** Inclusive end date of the recurrence period. */
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_MonthDay *end;

/**
 *  Optionally present list of prorations for the season. Each proration is a
 *  one-off discounted entry into a subscription. Each proration contains the
 *  first date on which the discount is available and the new pricing
 *  information.
 */
@property(nonatomic, strong, nullable) NSArray<GTLRAndroidPublisher_Prorate *> *prorations;

/** Inclusive start date of the recurrence period. */
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_MonthDay *start;

@end


/**
 *  A SubscriptionDeferralInfo contains the data needed to defer a subscription
 *  purchase to a future expiry time.
 */
@interface GTLRAndroidPublisher_SubscriptionDeferralInfo : GTLRObject

/**
 *  The desired next expiry time to assign to the subscription, in milliseconds
 *  since the Epoch. The given time must be later/greater than the current
 *  expiry time for the subscription.
 *
 *  Uses NSNumber of longLongValue.
 */
@property(nonatomic, strong, nullable) NSNumber *desiredExpiryTimeMillis;

/**
 *  The expected expiry time for the subscription. If the current expiry time
 *  for the subscription is not the value specified here, the deferral will not
 *  occur.
 *
 *  Uses NSNumber of longLongValue.
 */
@property(nonatomic, strong, nullable) NSNumber *expectedExpiryTimeMillis;

@end


/**
 *  A SubscriptionPurchase resource indicates the status of a user's
 *  subscription purchase.
 */
@interface GTLRAndroidPublisher_SubscriptionPurchase : GTLRObject

/**
 *  Whether the subscription will automatically be renewed when it reaches its
 *  current expiry time.
 *
 *  Uses NSNumber of boolValue.
 */
@property(nonatomic, strong, nullable) NSNumber *autoRenewing;

/**
 *  The reason why a subscription was cancelled or is not auto-renewing.
 *  Possible values are:
 *  - User cancelled the subscription
 *  - Subscription was cancelled by the system, for example because of a billing
 *  problem
 *  - Subscription was replaced with a new subscription
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *cancelReason;

/**
 *  ISO 3166-1 alpha-2 billing country/region code of the user at the time the
 *  subscription was granted.
 */
@property(nonatomic, copy, nullable) NSString *countryCode;

/**
 *  A developer-specified string that contains supplemental information about an
 *  order.
 */
@property(nonatomic, copy, nullable) NSString *developerPayload;

/**
 *  Time at which the subscription will expire, in milliseconds since the Epoch.
 *
 *  Uses NSNumber of longLongValue.
 */
@property(nonatomic, strong, nullable) NSNumber *expiryTimeMillis;

/**
 *  This kind represents a subscriptionPurchase object in the androidpublisher
 *  service.
 */
@property(nonatomic, copy, nullable) NSString *kind;

/**
 *  The order id of the latest recurring order associated with the purchase of
 *  the subscription.
 */
@property(nonatomic, copy, nullable) NSString *orderId;

/**
 *  The payment state of the subscription. Possible values are:
 *  - Payment pending
 *  - Payment received
 *  - Free trial
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *paymentState;

/**
 *  Price of the subscription, not including tax. Price is expressed in
 *  micro-units, where 1,000,000 micro-units represents one unit of the
 *  currency. For example, if the subscription price is €1.99,
 *  price_amount_micros is 1990000.
 *
 *  Uses NSNumber of longLongValue.
 */
@property(nonatomic, strong, nullable) NSNumber *priceAmountMicros;

/**
 *  ISO 4217 currency code for the subscription price. For example, if the price
 *  is specified in British pounds sterling, price_currency_code is "GBP".
 */
@property(nonatomic, copy, nullable) NSString *priceCurrencyCode;

/**
 *  Time at which the subscription was granted, in milliseconds since the Epoch.
 *
 *  Uses NSNumber of longLongValue.
 */
@property(nonatomic, strong, nullable) NSNumber *startTimeMillis;

/**
 *  The time at which the subscription was canceled by the user, in milliseconds
 *  since the epoch. Only present if cancelReason is 0.
 *
 *  Uses NSNumber of longLongValue.
 */
@property(nonatomic, strong, nullable) NSNumber *userCancellationTimeMillis;

@end


/**
 *  GTLRAndroidPublisher_SubscriptionPurchasesDeferRequest
 */
@interface GTLRAndroidPublisher_SubscriptionPurchasesDeferRequest : GTLRObject

/** The information about the new desired expiry time for the subscription. */
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_SubscriptionDeferralInfo *deferralInfo;

@end


/**
 *  GTLRAndroidPublisher_SubscriptionPurchasesDeferResponse
 */
@interface GTLRAndroidPublisher_SubscriptionPurchasesDeferResponse : GTLRObject

/**
 *  The new expiry time for the subscription in milliseconds since the Epoch.
 *
 *  Uses NSNumber of longLongValue.
 */
@property(nonatomic, strong, nullable) NSNumber *newExpiryTimeMillis NS_RETURNS_NOT_RETAINED;

@end


/**
 *  GTLRAndroidPublisher_Testers
 */
@interface GTLRAndroidPublisher_Testers : GTLRObject

@property(nonatomic, strong, nullable) NSArray<NSString *> *googleGroups;
@property(nonatomic, strong, nullable) NSArray<NSString *> *googlePlusCommunities;

@end


/**
 *  GTLRAndroidPublisher_Timestamp
 */
@interface GTLRAndroidPublisher_Timestamp : GTLRObject

/**
 *  nanos
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *nanos;

/**
 *  seconds
 *
 *  Uses NSNumber of longLongValue.
 */
@property(nonatomic, strong, nullable) NSNumber *seconds;

@end


/**
 *  GTLRAndroidPublisher_TokenPagination
 */
@interface GTLRAndroidPublisher_TokenPagination : GTLRObject

@property(nonatomic, copy, nullable) NSString *nextPageToken;
@property(nonatomic, copy, nullable) NSString *previousPageToken;

@end


/**
 *  GTLRAndroidPublisher_Track
 */
@interface GTLRAndroidPublisher_Track : GTLRObject

@property(nonatomic, copy, nullable) NSString *track;

/**
 *  userFraction
 *
 *  Uses NSNumber of doubleValue.
 */
@property(nonatomic, strong, nullable) NSNumber *userFraction;

/**
 *  versionCodes
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSArray<NSNumber *> *versionCodes;

@end


/**
 *  GTLRAndroidPublisher_TracksListResponse
 */
@interface GTLRAndroidPublisher_TracksListResponse : GTLRObject

/**
 *  Identifies what kind of resource this is. Value: the fixed string
 *  "androidpublisher#tracksListResponse".
 */
@property(nonatomic, copy, nullable) NSString *kind;

@property(nonatomic, strong, nullable) NSArray<GTLRAndroidPublisher_Track *> *tracks;

@end


/**
 *  GTLRAndroidPublisher_UserComment
 */
@interface GTLRAndroidPublisher_UserComment : GTLRObject

/**
 *  Integer Android SDK version of the user's device at the time the review was
 *  written, e.g. 23 is Marshmallow. May be absent.
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *androidOsVersion;

/**
 *  Integer version code of the app as installed at the time the review was
 *  written. May be absent.
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *appVersionCode;

/**
 *  String version name of the app as installed at the time the review was
 *  written. May be absent.
 */
@property(nonatomic, copy, nullable) NSString *appVersionName;

/** Codename for the reviewer's device, e.g. klte, flounder. May be absent. */
@property(nonatomic, copy, nullable) NSString *device;

/** Some information about the characteristics of the user's device */
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_DeviceMetadata *deviceMetadata;

/** The last time at which this comment was updated. */
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_Timestamp *lastModified;

/**
 *  Untranslated text of the review, in the case where the review has been
 *  translated. If the review has not been translated this is left blank.
 */
@property(nonatomic, copy, nullable) NSString *originalText;

/**
 *  Language code for the reviewer. This is taken from the device settings so is
 *  not guaranteed to match the language the review is written in. May be
 *  absent.
 */
@property(nonatomic, copy, nullable) NSString *reviewerLanguage;

/**
 *  The star rating associated with the review, from 1 to 5.
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *starRating;

/**
 *  The content of the comment, i.e. review body. In some cases users have been
 *  able to write a review with separate title and body; in those cases the
 *  title and body are concatenated and separated by a tab character.
 */
@property(nonatomic, copy, nullable) NSString *text;

/**
 *  Number of users who have given this review a thumbs down
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *thumbsDownCount;

/**
 *  Number of users who have given this review a thumbs up
 *
 *  Uses NSNumber of intValue.
 */
@property(nonatomic, strong, nullable) NSNumber *thumbsUpCount;

@end


/**
 *  A VoidedPurchase resource indicates a purchase that was either
 *  cancelled/refunded/charged-back.
 */
@interface GTLRAndroidPublisher_VoidedPurchase : GTLRObject

/**
 *  This kind represents a voided purchase object in the androidpublisher
 *  service.
 */
@property(nonatomic, copy, nullable) NSString *kind;

/**
 *  The time at which the purchase was made, in milliseconds since the epoch
 *  (Jan 1, 1970).
 *
 *  Uses NSNumber of longLongValue.
 */
@property(nonatomic, strong, nullable) NSNumber *purchaseTimeMillis;

/**
 *  The token that was generated when a purchase was made. This uniquely
 *  identifies a purchase.
 */
@property(nonatomic, copy, nullable) NSString *purchaseToken;

/**
 *  The time at which the purchase was cancelled/refunded/charged-back, in
 *  milliseconds since the epoch (Jan 1, 1970).
 *
 *  Uses NSNumber of longLongValue.
 */
@property(nonatomic, strong, nullable) NSNumber *voidedTimeMillis;

@end


/**
 *  GTLRAndroidPublisher_VoidedPurchasesListResponse
 */
@interface GTLRAndroidPublisher_VoidedPurchasesListResponse : GTLRObject

@property(nonatomic, strong, nullable) GTLRAndroidPublisher_PageInfo *pageInfo;
@property(nonatomic, strong, nullable) GTLRAndroidPublisher_TokenPagination *tokenPagination;
@property(nonatomic, strong, nullable) NSArray<GTLRAndroidPublisher_VoidedPurchase *> *voidedPurchases;

@end

NS_ASSUME_NONNULL_END

#pragma clang diagnostic pop

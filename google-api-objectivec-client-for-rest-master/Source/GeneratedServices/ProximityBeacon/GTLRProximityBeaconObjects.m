// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Google Proximity Beacon API (proximitybeacon/v1beta1)
// Description:
//   Registers, manages, indexes, and searches beacons.
// Documentation:
//   https://developers.google.com/beacons/proximity/

#import "GTLRProximityBeaconObjects.h"

// ----------------------------------------------------------------------------
// Constants

// GTLRProximityBeacon_AdvertisedId.type
NSString * const kGTLRProximityBeacon_AdvertisedId_Type_Altbeacon = @"ALTBEACON";
NSString * const kGTLRProximityBeacon_AdvertisedId_Type_Eddystone = @"EDDYSTONE";
NSString * const kGTLRProximityBeacon_AdvertisedId_Type_EddystoneEid = @"EDDYSTONE_EID";
NSString * const kGTLRProximityBeacon_AdvertisedId_Type_Ibeacon = @"IBEACON";
NSString * const kGTLRProximityBeacon_AdvertisedId_Type_TypeUnspecified = @"TYPE_UNSPECIFIED";

// GTLRProximityBeacon_Beacon.expectedStability
NSString * const kGTLRProximityBeacon_Beacon_ExpectedStability_Mobile = @"MOBILE";
NSString * const kGTLRProximityBeacon_Beacon_ExpectedStability_Portable = @"PORTABLE";
NSString * const kGTLRProximityBeacon_Beacon_ExpectedStability_Roving = @"ROVING";
NSString * const kGTLRProximityBeacon_Beacon_ExpectedStability_StabilityUnspecified = @"STABILITY_UNSPECIFIED";
NSString * const kGTLRProximityBeacon_Beacon_ExpectedStability_Stable = @"STABLE";

// GTLRProximityBeacon_Beacon.status
NSString * const kGTLRProximityBeacon_Beacon_Status_Active     = @"ACTIVE";
NSString * const kGTLRProximityBeacon_Beacon_Status_Decommissioned = @"DECOMMISSIONED";
NSString * const kGTLRProximityBeacon_Beacon_Status_Inactive   = @"INACTIVE";
NSString * const kGTLRProximityBeacon_Beacon_Status_StatusUnspecified = @"STATUS_UNSPECIFIED";

// GTLRProximityBeacon_Diagnostics.alerts
NSString * const kGTLRProximityBeacon_Diagnostics_Alerts_AlertUnspecified = @"ALERT_UNSPECIFIED";
NSString * const kGTLRProximityBeacon_Diagnostics_Alerts_LowBattery = @"LOW_BATTERY";
NSString * const kGTLRProximityBeacon_Diagnostics_Alerts_WrongLocation = @"WRONG_LOCATION";

// GTLRProximityBeacon_Namespace.servingVisibility
NSString * const kGTLRProximityBeacon_Namespace_ServingVisibility_Public = @"PUBLIC";
NSString * const kGTLRProximityBeacon_Namespace_ServingVisibility_Unlisted = @"UNLISTED";
NSString * const kGTLRProximityBeacon_Namespace_ServingVisibility_VisibilityUnspecified = @"VISIBILITY_UNSPECIFIED";

// ----------------------------------------------------------------------------
//
//   GTLRProximityBeacon_AdvertisedId
//

@implementation GTLRProximityBeacon_AdvertisedId
@dynamic identifier, type;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"identifier" : @"id" };
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRProximityBeacon_AttachmentInfo
//

@implementation GTLRProximityBeacon_AttachmentInfo
@dynamic data, namespacedType;
@end


// ----------------------------------------------------------------------------
//
//   GTLRProximityBeacon_Beacon
//

@implementation GTLRProximityBeacon_Beacon
@dynamic advertisedId, beaconName, descriptionProperty, ephemeralIdRegistration,
         expectedStability, indoorLevel, latLng, placeId, properties,
         provisioningKey, status;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"descriptionProperty" : @"description" };
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRProximityBeacon_Beacon_Properties
//

@implementation GTLRProximityBeacon_Beacon_Properties

+ (Class)classForAdditionalProperties {
  return [NSString class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRProximityBeacon_BeaconAttachment
//

@implementation GTLRProximityBeacon_BeaconAttachment
@dynamic attachmentName, creationTimeMs, data, maxDistanceMeters,
         namespacedType;
@end


// ----------------------------------------------------------------------------
//
//   GTLRProximityBeacon_BeaconInfo
//

@implementation GTLRProximityBeacon_BeaconInfo
@dynamic advertisedId, attachments, beaconName;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"attachments" : [GTLRProximityBeacon_AttachmentInfo class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRProximityBeacon_Date
//

@implementation GTLRProximityBeacon_Date
@dynamic day, month, year;
@end


// ----------------------------------------------------------------------------
//
//   GTLRProximityBeacon_DeleteAttachmentsResponse
//

@implementation GTLRProximityBeacon_DeleteAttachmentsResponse
@dynamic numDeleted;
@end


// ----------------------------------------------------------------------------
//
//   GTLRProximityBeacon_Diagnostics
//

@implementation GTLRProximityBeacon_Diagnostics
@dynamic alerts, beaconName, estimatedLowBatteryDate;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"alerts" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRProximityBeacon_Empty
//

@implementation GTLRProximityBeacon_Empty
@end


// ----------------------------------------------------------------------------
//
//   GTLRProximityBeacon_EphemeralIdRegistration
//

@implementation GTLRProximityBeacon_EphemeralIdRegistration
@dynamic beaconEcdhPublicKey, beaconIdentityKey, initialClockValue, initialEid,
         rotationPeriodExponent, serviceEcdhPublicKey;
@end


// ----------------------------------------------------------------------------
//
//   GTLRProximityBeacon_EphemeralIdRegistrationParams
//

@implementation GTLRProximityBeacon_EphemeralIdRegistrationParams
@dynamic maxRotationPeriodExponent, minRotationPeriodExponent,
         serviceEcdhPublicKey;
@end


// ----------------------------------------------------------------------------
//
//   GTLRProximityBeacon_GetInfoForObservedBeaconsRequest
//

@implementation GTLRProximityBeacon_GetInfoForObservedBeaconsRequest
@dynamic namespacedTypes, observations;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"namespacedTypes" : [NSString class],
    @"observations" : [GTLRProximityBeacon_Observation class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRProximityBeacon_GetInfoForObservedBeaconsResponse
//

@implementation GTLRProximityBeacon_GetInfoForObservedBeaconsResponse
@dynamic beacons;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"beacons" : [GTLRProximityBeacon_BeaconInfo class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRProximityBeacon_IndoorLevel
//

@implementation GTLRProximityBeacon_IndoorLevel
@dynamic name;
@end


// ----------------------------------------------------------------------------
//
//   GTLRProximityBeacon_LatLng
//

@implementation GTLRProximityBeacon_LatLng
@dynamic latitude, longitude;
@end


// ----------------------------------------------------------------------------
//
//   GTLRProximityBeacon_ListBeaconAttachmentsResponse
//

@implementation GTLRProximityBeacon_ListBeaconAttachmentsResponse
@dynamic attachments;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"attachments" : [GTLRProximityBeacon_BeaconAttachment class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRProximityBeacon_ListBeaconsResponse
//

@implementation GTLRProximityBeacon_ListBeaconsResponse
@dynamic beacons, nextPageToken, totalCount;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"beacons" : [GTLRProximityBeacon_Beacon class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"beacons";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRProximityBeacon_ListDiagnosticsResponse
//

@implementation GTLRProximityBeacon_ListDiagnosticsResponse
@dynamic diagnostics, nextPageToken;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"diagnostics" : [GTLRProximityBeacon_Diagnostics class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"diagnostics";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRProximityBeacon_ListNamespacesResponse
//

@implementation GTLRProximityBeacon_ListNamespacesResponse
@dynamic namespaces;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"namespaces" : [GTLRProximityBeacon_Namespace class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRProximityBeacon_Namespace
//

@implementation GTLRProximityBeacon_Namespace
@dynamic namespaceName, servingVisibility;
@end


// ----------------------------------------------------------------------------
//
//   GTLRProximityBeacon_Observation
//

@implementation GTLRProximityBeacon_Observation
@dynamic advertisedId, telemetry, timestampMs;
@end

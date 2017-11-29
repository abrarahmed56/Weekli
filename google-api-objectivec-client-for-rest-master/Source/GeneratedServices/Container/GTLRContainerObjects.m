// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Google Container Engine API (container/v1)
// Description:
//   The Google Container Engine API is used for building and managing container
//   based applications, powered by the open source Kubernetes technology.
// Documentation:
//   https://cloud.google.com/container-engine/

#import "GTLRContainerObjects.h"

// ----------------------------------------------------------------------------
// Constants

// GTLRContainer_Cluster.status
NSString * const kGTLRContainer_Cluster_Status_Error           = @"ERROR";
NSString * const kGTLRContainer_Cluster_Status_Provisioning    = @"PROVISIONING";
NSString * const kGTLRContainer_Cluster_Status_Reconciling     = @"RECONCILING";
NSString * const kGTLRContainer_Cluster_Status_Running         = @"RUNNING";
NSString * const kGTLRContainer_Cluster_Status_StatusUnspecified = @"STATUS_UNSPECIFIED";
NSString * const kGTLRContainer_Cluster_Status_Stopping        = @"STOPPING";

// GTLRContainer_NetworkPolicy.provider
NSString * const kGTLRContainer_NetworkPolicy_Provider_Calico  = @"CALICO";
NSString * const kGTLRContainer_NetworkPolicy_Provider_ProviderUnspecified = @"PROVIDER_UNSPECIFIED";

// GTLRContainer_NodePool.status
NSString * const kGTLRContainer_NodePool_Status_Error          = @"ERROR";
NSString * const kGTLRContainer_NodePool_Status_Provisioning   = @"PROVISIONING";
NSString * const kGTLRContainer_NodePool_Status_Reconciling    = @"RECONCILING";
NSString * const kGTLRContainer_NodePool_Status_Running        = @"RUNNING";
NSString * const kGTLRContainer_NodePool_Status_RunningWithError = @"RUNNING_WITH_ERROR";
NSString * const kGTLRContainer_NodePool_Status_StatusUnspecified = @"STATUS_UNSPECIFIED";
NSString * const kGTLRContainer_NodePool_Status_Stopping       = @"STOPPING";

// GTLRContainer_Operation.operationType
NSString * const kGTLRContainer_Operation_OperationType_AutoRepairNodes = @"AUTO_REPAIR_NODES";
NSString * const kGTLRContainer_Operation_OperationType_AutoUpgradeNodes = @"AUTO_UPGRADE_NODES";
NSString * const kGTLRContainer_Operation_OperationType_CreateCluster = @"CREATE_CLUSTER";
NSString * const kGTLRContainer_Operation_OperationType_CreateNodePool = @"CREATE_NODE_POOL";
NSString * const kGTLRContainer_Operation_OperationType_DeleteCluster = @"DELETE_CLUSTER";
NSString * const kGTLRContainer_Operation_OperationType_DeleteNodePool = @"DELETE_NODE_POOL";
NSString * const kGTLRContainer_Operation_OperationType_RepairCluster = @"REPAIR_CLUSTER";
NSString * const kGTLRContainer_Operation_OperationType_SetLabels = @"SET_LABELS";
NSString * const kGTLRContainer_Operation_OperationType_SetMaintenancePolicy = @"SET_MAINTENANCE_POLICY";
NSString * const kGTLRContainer_Operation_OperationType_SetMasterAuth = @"SET_MASTER_AUTH";
NSString * const kGTLRContainer_Operation_OperationType_SetNetworkPolicy = @"SET_NETWORK_POLICY";
NSString * const kGTLRContainer_Operation_OperationType_SetNodePoolManagement = @"SET_NODE_POOL_MANAGEMENT";
NSString * const kGTLRContainer_Operation_OperationType_SetNodePoolSize = @"SET_NODE_POOL_SIZE";
NSString * const kGTLRContainer_Operation_OperationType_TypeUnspecified = @"TYPE_UNSPECIFIED";
NSString * const kGTLRContainer_Operation_OperationType_UpdateCluster = @"UPDATE_CLUSTER";
NSString * const kGTLRContainer_Operation_OperationType_UpgradeMaster = @"UPGRADE_MASTER";
NSString * const kGTLRContainer_Operation_OperationType_UpgradeNodes = @"UPGRADE_NODES";

// GTLRContainer_Operation.status
NSString * const kGTLRContainer_Operation_Status_Aborting      = @"ABORTING";
NSString * const kGTLRContainer_Operation_Status_Done          = @"DONE";
NSString * const kGTLRContainer_Operation_Status_Pending       = @"PENDING";
NSString * const kGTLRContainer_Operation_Status_Running       = @"RUNNING";
NSString * const kGTLRContainer_Operation_Status_StatusUnspecified = @"STATUS_UNSPECIFIED";

// GTLRContainer_SetMasterAuthRequest.action
NSString * const kGTLRContainer_SetMasterAuthRequest_Action_GeneratePassword = @"GENERATE_PASSWORD";
NSString * const kGTLRContainer_SetMasterAuthRequest_Action_SetPassword = @"SET_PASSWORD";
NSString * const kGTLRContainer_SetMasterAuthRequest_Action_SetUsername = @"SET_USERNAME";
NSString * const kGTLRContainer_SetMasterAuthRequest_Action_Unknown = @"UNKNOWN";

// ----------------------------------------------------------------------------
//
//   GTLRContainer_AcceleratorConfig
//

@implementation GTLRContainer_AcceleratorConfig
@dynamic acceleratorCount, acceleratorType;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_AddonsConfig
//

@implementation GTLRContainer_AddonsConfig
@dynamic horizontalPodAutoscaling, httpLoadBalancing, kubernetesDashboard,
         networkPolicyConfig;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_AutoUpgradeOptions
//

@implementation GTLRContainer_AutoUpgradeOptions
@dynamic autoUpgradeStartTime, descriptionProperty;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"descriptionProperty" : @"description" };
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_CancelOperationRequest
//

@implementation GTLRContainer_CancelOperationRequest
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_CidrBlock
//

@implementation GTLRContainer_CidrBlock
@dynamic cidrBlock, displayName;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_ClientCertificateConfig
//

@implementation GTLRContainer_ClientCertificateConfig
@dynamic issueClientCertificate;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_Cluster
//

@implementation GTLRContainer_Cluster
@dynamic addonsConfig, clusterIpv4Cidr, createTime, currentMasterVersion,
         currentNodeCount, currentNodeVersion, descriptionProperty,
         enableKubernetesAlpha, endpoint, expireTime, initialClusterVersion,
         initialNodeCount, instanceGroupUrls, ipAllocationPolicy,
         labelFingerprint, legacyAbac, locations, loggingService,
         maintenancePolicy, masterAuth, masterAuthorizedNetworksConfig,
         monitoringService, name, network, networkPolicy, nodeConfig,
         nodeIpv4CidrSize, nodePools, resourceLabels, selfLink,
         servicesIpv4Cidr, status, statusMessage, subnetwork, zoneProperty;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  NSDictionary<NSString *, NSString *> *map = @{
    @"descriptionProperty" : @"description",
    @"zoneProperty" : @"zone"
  };
  return map;
}

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"instanceGroupUrls" : [NSString class],
    @"locations" : [NSString class],
    @"nodePools" : [GTLRContainer_NodePool class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_Cluster_ResourceLabels
//

@implementation GTLRContainer_Cluster_ResourceLabels

+ (Class)classForAdditionalProperties {
  return [NSString class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_ClusterUpdate
//

@implementation GTLRContainer_ClusterUpdate
@dynamic desiredAddonsConfig, desiredImageType, desiredLocations,
         desiredMasterAuthorizedNetworksConfig, desiredMasterVersion,
         desiredMonitoringService, desiredNodePoolAutoscaling,
         desiredNodePoolId, desiredNodeVersion;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"desiredLocations" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_CompleteIPRotationRequest
//

@implementation GTLRContainer_CompleteIPRotationRequest
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_CreateClusterRequest
//

@implementation GTLRContainer_CreateClusterRequest
@dynamic cluster;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_CreateNodePoolRequest
//

@implementation GTLRContainer_CreateNodePoolRequest
@dynamic nodePool;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_DailyMaintenanceWindow
//

@implementation GTLRContainer_DailyMaintenanceWindow
@dynamic duration, startTime;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_Empty
//

@implementation GTLRContainer_Empty
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_HorizontalPodAutoscaling
//

@implementation GTLRContainer_HorizontalPodAutoscaling
@dynamic disabled;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_HttpLoadBalancing
//

@implementation GTLRContainer_HttpLoadBalancing
@dynamic disabled;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_IPAllocationPolicy
//

@implementation GTLRContainer_IPAllocationPolicy
@dynamic clusterIpv4Cidr, clusterIpv4CidrBlock, clusterSecondaryRangeName,
         createSubnetwork, nodeIpv4Cidr, nodeIpv4CidrBlock, servicesIpv4Cidr,
         servicesIpv4CidrBlock, servicesSecondaryRangeName, subnetworkName,
         useIpAliases;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_KubernetesDashboard
//

@implementation GTLRContainer_KubernetesDashboard
@dynamic disabled;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_LegacyAbac
//

@implementation GTLRContainer_LegacyAbac
@dynamic enabled;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_ListClustersResponse
//

@implementation GTLRContainer_ListClustersResponse
@dynamic clusters, missingZones;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"clusters" : [GTLRContainer_Cluster class],
    @"missingZones" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_ListNodePoolsResponse
//

@implementation GTLRContainer_ListNodePoolsResponse
@dynamic nodePools;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"nodePools" : [GTLRContainer_NodePool class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_ListOperationsResponse
//

@implementation GTLRContainer_ListOperationsResponse
@dynamic missingZones, operations;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"missingZones" : [NSString class],
    @"operations" : [GTLRContainer_Operation class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_MaintenancePolicy
//

@implementation GTLRContainer_MaintenancePolicy
@dynamic window;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_MaintenanceWindow
//

@implementation GTLRContainer_MaintenanceWindow
@dynamic dailyMaintenanceWindow;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_MasterAuth
//

@implementation GTLRContainer_MasterAuth
@dynamic clientCertificate, clientCertificateConfig, clientKey,
         clusterCaCertificate, password, username;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_MasterAuthorizedNetworksConfig
//

@implementation GTLRContainer_MasterAuthorizedNetworksConfig
@dynamic cidrBlocks, enabled;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"cidrBlocks" : [GTLRContainer_CidrBlock class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_NetworkPolicy
//

@implementation GTLRContainer_NetworkPolicy
@dynamic enabled, provider;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_NetworkPolicyConfig
//

@implementation GTLRContainer_NetworkPolicyConfig
@dynamic disabled;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_NodeConfig
//

@implementation GTLRContainer_NodeConfig
@dynamic accelerators, diskSizeGb, imageType, labels, localSsdCount,
         machineType, metadata, minCpuPlatform, oauthScopes, preemptible,
         serviceAccount, tags;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"accelerators" : [GTLRContainer_AcceleratorConfig class],
    @"oauthScopes" : [NSString class],
    @"tags" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_NodeConfig_Labels
//

@implementation GTLRContainer_NodeConfig_Labels

+ (Class)classForAdditionalProperties {
  return [NSString class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_NodeConfig_Metadata
//

@implementation GTLRContainer_NodeConfig_Metadata

+ (Class)classForAdditionalProperties {
  return [NSString class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_NodeManagement
//

@implementation GTLRContainer_NodeManagement
@dynamic autoRepair, autoUpgrade, upgradeOptions;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_NodePool
//

@implementation GTLRContainer_NodePool
@dynamic autoscaling, config, initialNodeCount, instanceGroupUrls, management,
         name, selfLink, status, statusMessage, version;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"instanceGroupUrls" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_NodePoolAutoscaling
//

@implementation GTLRContainer_NodePoolAutoscaling
@dynamic enabled, maxNodeCount, minNodeCount;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_Operation
//

@implementation GTLRContainer_Operation
@dynamic detail, endTime, name, operationType, selfLink, startTime, status,
         statusMessage, targetLink, zoneProperty;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"zoneProperty" : @"zone" };
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_RollbackNodePoolUpgradeRequest
//

@implementation GTLRContainer_RollbackNodePoolUpgradeRequest
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_ServerConfig
//

@implementation GTLRContainer_ServerConfig
@dynamic defaultClusterVersion, defaultImageType, validImageTypes,
         validMasterVersions, validNodeVersions;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"validImageTypes" : [NSString class],
    @"validMasterVersions" : [NSString class],
    @"validNodeVersions" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_SetAddonsConfigRequest
//

@implementation GTLRContainer_SetAddonsConfigRequest
@dynamic addonsConfig;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_SetLabelsRequest
//

@implementation GTLRContainer_SetLabelsRequest
@dynamic labelFingerprint, resourceLabels;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_SetLabelsRequest_ResourceLabels
//

@implementation GTLRContainer_SetLabelsRequest_ResourceLabels

+ (Class)classForAdditionalProperties {
  return [NSString class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_SetLegacyAbacRequest
//

@implementation GTLRContainer_SetLegacyAbacRequest
@dynamic enabled;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_SetLocationsRequest
//

@implementation GTLRContainer_SetLocationsRequest
@dynamic locations;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"locations" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_SetLoggingServiceRequest
//

@implementation GTLRContainer_SetLoggingServiceRequest
@dynamic loggingService;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_SetMaintenancePolicyRequest
//

@implementation GTLRContainer_SetMaintenancePolicyRequest
@dynamic maintenancePolicy;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_SetMasterAuthRequest
//

@implementation GTLRContainer_SetMasterAuthRequest
@dynamic action, update;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_SetMonitoringServiceRequest
//

@implementation GTLRContainer_SetMonitoringServiceRequest
@dynamic monitoringService;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_SetNetworkPolicyRequest
//

@implementation GTLRContainer_SetNetworkPolicyRequest
@dynamic networkPolicy;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_SetNodePoolAutoscalingRequest
//

@implementation GTLRContainer_SetNodePoolAutoscalingRequest
@dynamic autoscaling;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_SetNodePoolManagementRequest
//

@implementation GTLRContainer_SetNodePoolManagementRequest
@dynamic management;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_SetNodePoolSizeRequest
//

@implementation GTLRContainer_SetNodePoolSizeRequest
@dynamic nodeCount;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_StartIPRotationRequest
//

@implementation GTLRContainer_StartIPRotationRequest
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_UpdateClusterRequest
//

@implementation GTLRContainer_UpdateClusterRequest
@dynamic update;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_UpdateMasterRequest
//

@implementation GTLRContainer_UpdateMasterRequest
@dynamic masterVersion;
@end


// ----------------------------------------------------------------------------
//
//   GTLRContainer_UpdateNodePoolRequest
//

@implementation GTLRContainer_UpdateNodePoolRequest
@dynamic imageType, nodeVersion;
@end

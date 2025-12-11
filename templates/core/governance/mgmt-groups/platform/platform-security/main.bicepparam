using './main.bicep'

// General Parameters
param parLocations = [
  'eastus2'
  'westus2'
]
param parEnableTelemetry = true

param platformSecurityConfig = {
  createOrUpdateManagementGroup: true
  managementGroupName: 'gh12securitytest'
  managementGroupParentId: 'gh12platformtest'
  managementGroupIntermediateRootName: 'gh12alztest'
  managementGroupDisplayName: 'Security'
  managementGroupDoNotEnforcePolicyAssignments: []
  managementGroupExcludedPolicyAssignments: []
  customerRbacRoleDefs: []
  customerRbacRoleAssignments: []
  customerPolicyDefs: []
  customerPolicySetDefs: []
  customerPolicyAssignments: []
  subscriptionsToPlaceInManagementGroup: ['e9f0eed8-579b-4d58-88b8-107298c33c5c']
  waitForConsistencyCounterBeforeCustomPolicyDefinitions: 30
  waitForConsistencyCounterBeforeCustomPolicySetDefinitions: 30
  waitForConsistencyCounterBeforeCustomRoleDefinitions: 30
  waitForConsistencyCounterBeforePolicyAssignments: 30
  waitForConsistencyCounterBeforeRoleAssignments: 30
  waitForConsistencyCounterBeforeSubPlacement: 30
}

// Only specify the parameters you want to override - others will use defaults from JSON files
param parPolicyAssignmentParameterOverrides = {
  // No policy assignments in platform-security currently
}

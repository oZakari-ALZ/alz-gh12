using './main.bicep'

// General Parameters
param parLocations = [
  'eastus2'
  'westus2'
]
param parEnableTelemetry = true

param decommissionedConfig = {
  createOrUpdateManagementGroup: true
  managementGroupName: 'gh12decommissionedtest'
  managementGroupParentId: 'gh12alztest'
  managementGroupIntermediateRootName: 'gh12alztest'
  managementGroupDisplayName: 'Decommissioned'
  managementGroupDoNotEnforcePolicyAssignments: []
  managementGroupExcludedPolicyAssignments: []
  customerRbacRoleDefs: []
  customerRbacRoleAssignments: []
  customerPolicyDefs: []
  customerPolicySetDefs: []
  customerPolicyAssignments: []
  subscriptionsToPlaceInManagementGroup: []
  waitForConsistencyCounterBeforeCustomPolicyDefinitions: 30
  waitForConsistencyCounterBeforeCustomPolicySetDefinitions: 30
  waitForConsistencyCounterBeforeCustomRoleDefinitions: 30
  waitForConsistencyCounterBeforePolicyAssignments: 30
  waitForConsistencyCounterBeforeRoleAssignments: 30
  waitForConsistencyCounterBeforeSubPlacement: 30
}

// Only specify the parameters you want to override - others will use defaults from JSON files
param parPolicyAssignmentParameterOverrides = {
  // Add parameter overrides here if needed for customization
}

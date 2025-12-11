using './main.bicep'

// General Parameters
param parLocations = [
  'eastus2'
  'westus2'
]
param parEnableTelemetry = true

param landingZonesConfig = {
  createOrUpdateManagementGroup: true
  managementGroupName: 'gh12landingzonestest'
  managementGroupParentId: 'gh12alztest'
  managementGroupIntermediateRootName: 'gh12alztest'
  managementGroupDisplayName: 'Landing zones'
  managementGroupDoNotEnforcePolicyAssignments: []
  managementGroupExcludedPolicyAssignments: []
  customerRbacRoleDefs: []
  customerRbacRoleAssignments: []
  customerPolicyDefs: []
  customerPolicySetDefs: []
  customerPolicyAssignments: []
  subscriptionsToPlaceInManagementGroup: []
  waitForConsistencyCounterBeforeCustomPolicyDefinitions: 10
  waitForConsistencyCounterBeforeCustomPolicySetDefinitions: 10
  waitForConsistencyCounterBeforeCustomRoleDefinitions: 10
  waitForConsistencyCounterBeforePolicyAssignments: 10
  waitForConsistencyCounterBeforeRoleAssignments: 10
  waitForConsistencyCounterBeforeSubPlacement: 10
}

// Only specify the parameters you want to override - others will use defaults from JSON files
param parPolicyAssignmentParameterOverrides = {
  'Enable-DDoS-VNET': {
    parameters: {
    ddosPlan: {
      value: '/subscriptions/86eff05c-bacc-41f3-9c1b-04335f1854cc/resourceGroups/rg-alz-conn-${parLocations[0]}/providers/Microsoft.Network/ddosProtectionPlans/ddos-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-AzSqlDb-Auditing': {
    parameters: {
    logAnalyticsWorkspaceId: {
      value: '/subscriptions/aa258a69-237b-48c5-a2f6-8f168f1aea53/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.OperationalInsights/workspaces/log-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-vmArc-ChangeTrack': {
    parameters: {
    dcrResourceId: {
      value: '/subscriptions/aa258a69-237b-48c5-a2f6-8f168f1aea53/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-changetracking-${parLocations[0]}'
      }
    }
  }
  'Deploy-VM-ChangeTrack': {
    parameters: {
    dcrResourceId: {
      value: '/subscriptions/aa258a69-237b-48c5-a2f6-8f168f1aea53/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-changetracking-${parLocations[0]}'
    }
    userAssignedIdentityResourceId: {
      value: '/subscriptions/aa258a69-237b-48c5-a2f6-8f168f1aea53/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uami-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-VMSS-ChangeTrack': {
    parameters: {
    dcrResourceId: {
      value: '/subscriptions/aa258a69-237b-48c5-a2f6-8f168f1aea53/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-changetracking-${parLocations[0]}'
    }
    userAssignedIdentityResourceId: {
      value: '/subscriptions/aa258a69-237b-48c5-a2f6-8f168f1aea53/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uami-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-vmHybr-Monitoring': {
    parameters: {
    dcrResourceId: {
      value: '/subscriptions/aa258a69-237b-48c5-a2f6-8f168f1aea53/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-vminsights-${parLocations[0]}'
      }
    }
  }
  'Deploy-VM-Monitoring': {
    parameters: {
    dcrResourceId: {
      value: '/subscriptions/aa258a69-237b-48c5-a2f6-8f168f1aea53/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-vminsights-${parLocations[0]}'
    }
    userAssignedIdentityResourceId: {
      value: '/subscriptions/aa258a69-237b-48c5-a2f6-8f168f1aea53/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uami-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-VMSS-Monitoring': {
    parameters: {
    dcrResourceId: {
      value: '/subscriptions/aa258a69-237b-48c5-a2f6-8f168f1aea53/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-vminsights-${parLocations[0]}'
    }
    userAssignedIdentityResourceId: {
      value: '/subscriptions/aa258a69-237b-48c5-a2f6-8f168f1aea53/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uami-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-MDFC-DefSQL-AMA': {
    parameters: {
    userWorkspaceResourceId: {
      value: '/subscriptions/aa258a69-237b-48c5-a2f6-8f168f1aea53/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.OperationalInsights/workspaces/log-alz-${parLocations[0]}'
    }
    dcrResourceId: {
      value: '/subscriptions/aa258a69-237b-48c5-a2f6-8f168f1aea53/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-mdfcsql-${parLocations[0]}'
    }
    userAssignedIdentityResourceId: {
      value: '/subscriptions/aa258a69-237b-48c5-a2f6-8f168f1aea53/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uami-alz-${parLocations[0]}'
      }
    }
  }
}

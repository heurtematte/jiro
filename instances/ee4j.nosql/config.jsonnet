local permissionsTemplates = import '../../templates/permissions.libsonnet';

{
  project+: {
    fullName: "ee4j.nosql",
    displayName: "Jakarta NoSQL"
  },
  deployment+: {
    cluster: "okd-c1"
  },
  jenkins+: {
    // workaround to avoid errors, when the Gerrit plugin is disabled
    permissions: permissionsTemplates.projectPermissions($.project.unixGroupName, permissionsTemplates.committerPermissionsList)
  }
}

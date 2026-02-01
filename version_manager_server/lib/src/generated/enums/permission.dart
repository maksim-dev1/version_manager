/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

enum Permission implements _i1.SerializableModel {
  viewTeam,
  editTeam,
  deleteTeam,
  transferOwnership,
  viewMembers,
  inviteMembers,
  removeMembers,
  changeRoles,
  viewApps,
  createApps,
  editApps,
  deleteApps,
  viewVersions,
  createVersions,
  editVersions,
  blockVersions,
  deleteVersions,
  viewApiKeys,
  manageApiKeys,
  viewStats;

  static Permission fromJson(String name) {
    switch (name) {
      case 'viewTeam':
        return Permission.viewTeam;
      case 'editTeam':
        return Permission.editTeam;
      case 'deleteTeam':
        return Permission.deleteTeam;
      case 'transferOwnership':
        return Permission.transferOwnership;
      case 'viewMembers':
        return Permission.viewMembers;
      case 'inviteMembers':
        return Permission.inviteMembers;
      case 'removeMembers':
        return Permission.removeMembers;
      case 'changeRoles':
        return Permission.changeRoles;
      case 'viewApps':
        return Permission.viewApps;
      case 'createApps':
        return Permission.createApps;
      case 'editApps':
        return Permission.editApps;
      case 'deleteApps':
        return Permission.deleteApps;
      case 'viewVersions':
        return Permission.viewVersions;
      case 'createVersions':
        return Permission.createVersions;
      case 'editVersions':
        return Permission.editVersions;
      case 'blockVersions':
        return Permission.blockVersions;
      case 'deleteVersions':
        return Permission.deleteVersions;
      case 'viewApiKeys':
        return Permission.viewApiKeys;
      case 'manageApiKeys':
        return Permission.manageApiKeys;
      case 'viewStats':
        return Permission.viewStats;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "Permission"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}

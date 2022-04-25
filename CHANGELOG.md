# Changelog
All notable changes to this project will be documented in this file.
## [1.6.0.0]
Modifications resulting from the DMSP Workshop and analysis
### Changed
  - Make sure the horizontal and vertical display axes are not the same.
  - Make sure the name of the color display axis is different from the horizontal and vertical display axes.

### Fixed
  - Made pds:Local_Internal_Reference required
  - Reset lower limit for frame_rate to 1.e-307


## [1.5.1.0]

### Added
- display_settings_validate_axis rules and tests for the new rules (by Jesse S.).
 
## [1.5.0.0]

### Added
- Added two rules under Display_Settings_0, (1) to add at least one 
      local_reference_type, for now - 'display_settings_to_array' and 
      (2) to make sure local_identifier_reference values under Display matches 
      the local_identifier attribute under Array_*. This rule also seems to be inserted during LDDtool build so currently it is being duplicated (and has been deprecated in LDDtool).

### Changed
- ported from 1.4.0.0 schema to LDD for PDS IM 1E00 and 1F00

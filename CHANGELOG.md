# Changelog
All notable changes to this project will be documented in this file.

## [1.6.0.0]
Modifications from Anne R. resulting from the DMSP Workshop and analysis

### Added
  - New templates and github actions for publishing to docs github.io
  - Update documentation T. Hare
  - 
### Changed
  - Make sure the horizontal and vertical display axes are not the same.
  - Make sure the name of the color display axis is different from the horizontal and vertical display axes.
  - loop_count minimum value is now 0, which defines an infinite loop (it will should never stop).
  - frame_rate minimum value is now 1.E-307 from 1 to allow for movies slower than 1 frame/s.
  - several rules and added new rules

### Fixed
  - Made pds:Local_Internal_Reference required, allows for many

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

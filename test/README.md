# Regression Test Directory

This directory contains pairs of VALID/FAIL labels to check specific 
conditions.

## Tests

* **LIRpresent:** The pds:Local_Internal_Reference class must be present
in Display_Settings.
* **LIRreferencesArray:** The pds:Local_Internal_Reference class 
indicates an array-type object.
* **hrzNotEqualVrt:** The value of *horizontal_display_axis* and 
*vertical_display_axis* must not be the same.
* **uniqueColor:** The value of *color_display_axis* must not be the same
as the value of either *horizontal_display_axis* or *vertical_display_axis*.
* **uniqueTime:** The value of *time_display_axis* must not be the same 
as the value of either *horizontal_display_axis* or *vertical_display_axis*.
# Regression Test Directory

This directory contains pairs of VALID/FAIL labels to check specific 
conditions.

## Tests

* **LIRpresent:** The pds:Local_Internal_Reference class must be present
in Display_Settings.
* **LIRreferencesArray:** The pds:Local_Internal_Reference class 
indicates an array-type object.
* **bandInRange:** The value of each of *red_channel_band*, 
*green_channel_band*, and *blue_channel_band* does not exceed the
length of the associated *color_display_axis*.
* **frameRateValid:** The value of *frame_rate* must be positive.
* **hrzNotEqualVrt:** The value of *horizontal_display_axis* and 
*vertical_display_axis* must not be the same.
* **sameObjectAxis-Color:** The value of *color_display_axis* must 
correspond to the axis_name value of an axis in the associated 
array-type object.
* **sameObjectAxis-HV:** The values of *horizontal_display_axis* 
and *vertical_display_axis* must correspond to axes in the array 
object identified by the associated pds:Local_Internal_Reference.
* **sameObjectAxis-Time:** The value of *time_display_axis* must 
correspond to the axis_name value of an axis in the associated
array-type object.
* **uniqueColor:** The value of *color_display_axis* must not be the same
as the value of either *horizontal_display_axis* or *vertical_display_axis*.
* **uniqueTime:** The value of *time_display_axis* must not be the same 
as the value of either *horizontal_display_axis* or *vertical_display_axis*.
* **verticalDisplay_bad_NameAxis:** The *vertical_display_axis* value must
match an *axis_name* value
* **hrzDisplay_bad_NameAxis:** The *horizontal_display_axis* value must
match an *axis_name* value
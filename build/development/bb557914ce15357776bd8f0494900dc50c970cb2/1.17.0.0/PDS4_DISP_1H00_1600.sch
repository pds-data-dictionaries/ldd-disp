<?xml version="1.0" encoding="UTF-8"?>
  <!-- PDS4 Schematron for Name Space Id:disp  Version:1.6.0.0 - Thu May 05 20:03:15 UTC 2022 -->
  <!-- Generated from the PDS4 Information Model Version 1.17.0.0 - System Build 12.0 -->
  <!-- *** This PDS4 schematron file is an operational deliverable. *** -->
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">

  <sch:title>Schematron using XPath 2.0</sch:title>

  <sch:ns uri="http://www.w3.org/2001/XMLSchema-instance" prefix="xsi"/>
  <sch:ns uri="http://pds.nasa.gov/pds4/pds/v1" prefix="pds"/>
  <sch:ns uri="http://pds.nasa.gov/pds4/disp/v1" prefix="disp"/>

		   <!-- ================================================ -->
		   <!-- NOTE:  There are two types of schematron rules.  -->
		   <!--        One type includes rules written for       -->
		   <!--        specific situations. The other type are   -->
		   <!--        generated to validate enumerated value    -->
		   <!--        lists. These two types of rules have been -->
		   <!--        merged together in the rules below.       -->
		   <!-- ================================================ -->
  <sch:pattern>
    <sch:rule context="disp:Display_Settings/pds:Local_Internal_Reference">
      <sch:assert test="pds:local_identifier_reference = //pds:*/pds:*/(pds:Array|pds:Array_2D|pds:Array_2D_Image|pds:Array_2D_Map|pds:Array_2D_Spectrum|pds:Array_3D|pds:Array_3D_Image|pds:Array_3D_Movie|pds:Array_3D_Spectrum)/pds:local_identifier
        ">
        <title>Display_Settings_0/Rule</title>
        In disp:Display_Settings, the value of the pds:local_identifier_reference (<sch:value-of select='pds:local_identifier_reference'/>) must match the value of the pds:local_identifer of an Array class or sub-class within the File_Area.
        </sch:assert>
      <sch:assert test="pds:local_reference_type = 'display_settings_to_array'
        ">
        <title>Display_Settings_0/Rule</title>
        In disp:Display_Settings, the value of pds:local_reference_type (<sch:value-of select='pds:local_reference_type'/>) must equal 'display_settings_to_array'.
        </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="disp:Color_Display_Settings">
      <sch:let name="horizontal_display_axis" value="../disp:Display_Direction/disp:horizontal_display_axis"/>
      <sch:let name="vertical_display_axis" value="../disp:Display_Direction/disp:vertical_display_axis"/>
      <sch:let name="color_display_axis" value="disp:color_display_axis"/>
      <sch:let name="local_identifier_reference" value="../pds:Local_Internal_Reference/pds:local_identifier_reference"/>
      <sch:let name="bands" value="//pds:*[pds:local_identifier=$local_identifier_reference]/pds:Axis_Array[pds:axis_name=$color_display_axis]/pds:elements"/>
      <sch:assert test="//pds:*[pds:local_identifier=$local_identifier_reference]/pds:Axis_Array[pds:axis_name=$color_display_axis]">
        <title>color_settings_validate_axis/Rule</title>
        In Color_Display_Settings, the color_display_axis (<sch:value-of select='$color_display_axis'/>) must match the name of an axis in the referenced Array (<sch:value-of select='$local_identifier_reference'/>)</sch:assert>
      <sch:assert test="not($color_display_axis=($horizontal_display_axis, $vertical_display_axis))">
        <title>color_settings_validate_axis/Rule</title>
        In Color_Display_Settings, the color_display_axis (<sch:value-of select='$color_display_axis'/>) must not match the name of horizontal_display_axis or vertical_display_axis in the referenced Array (<sch:value-of select='$local_identifier_reference'/>)</sch:assert>
      <sch:assert test="not(number(disp:red_channel_band) > $bands)">
        <title>color_settings_validate_axis/Rule</title>
        In Color_Display_Settings, the value of red_channel_band (<sch:value-of select="disp:red_channel_band"/>) is out of range for the length (<sch:value-of select='$bands'/>) of the color_display_axis (<sch:value-of select='$color_display_axis'/>).</sch:assert>
      <sch:assert test="not(number(disp:green_channel_band) > $bands)">
        <title>color_settings_validate_axis/Rule</title>
        In Color_Display_Settings, the value of green_channel_band (<sch:value-of select="disp:green_channel_band"/>) is out of range for the length (<sch:value-of select='$bands'/>) of the color_display_axis (<sch:value-of select='$color_display_axis'/>).</sch:assert>
      <sch:assert test="not(number(disp:blue_channel_band) > $bands)">
        <title>color_settings_validate_axis/Rule</title>
        In Color_Display_Settings, the value of blue_channel_band (<sch:value-of select="disp:blue_channel_band"/>) is out of range for the length (<sch:value-of select='$bands'/>) of the color_display_axis (<sch:value-of select='$color_display_axis'/>).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="disp:Display_Direction/disp:horizontal_display_direction">
      <sch:assert test=". = ('Left to Right', 'Right to Left')">
        <title>disp:Display_Direction/disp:horizontal_display_direction/disp:horizontal_display_direction</title>
        The attribute disp:Display_Direction/disp:horizontal_display_direction must be equal to one of the following values 'Left to Right', 'Right to Left'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="disp:Display_Direction/disp:vertical_display_direction">
      <sch:assert test=". = ('Bottom to Top', 'Top to Bottom')">
        <title>disp:Display_Direction/disp:vertical_display_direction/disp:vertical_display_direction</title>
        The attribute disp:Display_Direction/disp:vertical_display_direction must be equal to one of the following values 'Bottom to Top', 'Top to Bottom'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="disp:Movie_Display_Settings">
      <sch:assert test="if (disp:loop_flag) then disp:loop_flag = ('true', 'false') else true()">
        <title>disp:Movie_Display_Settings/disp:loop_flag</title>
        The attribute disp:loop_flag must be equal to one of the following values 'true', 'false'.</sch:assert>
      <sch:assert test="if (disp:loop_back_and_forth_flag) then disp:loop_back_and_forth_flag = ('true', 'false') else true()">
        <title>disp:Movie_Display_Settings/disp:loop_back_and_forth_flag</title>
        The attribute disp:loop_back_and_forth_flag must be equal to one of the following values 'true', 'false'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="disp:Movie_Display_Settings/disp:frame_rate">
      <sch:assert test="@unit = ('frames/s')">
        <title>disp:Movie_Display_Settings/disp:frame_rate/disp:frame_rate</title>
        The attribute @unit must be equal to one of the following values 'frames/s'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="disp:Movie_Display_Settings/disp:loop_back_and_forth_flag">
      <sch:assert test=". = ('false', 'true')">
        <title>disp:Movie_Display_Settings/disp:loop_back_and_forth_flag/disp:loop_back_and_forth_flag</title>
        The attribute disp:Movie_Display_Settings/disp:loop_back_and_forth_flag must be equal to one of the following values 'false', 'true'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="disp:Movie_Display_Settings/disp:loop_delay">
      <sch:assert test="@unit = ('day', 'hr', 'julian day', 'microseconds', 'min', 'ms', 'ns', 's', 'yr')">
        <title>disp:Movie_Display_Settings/disp:loop_delay/disp:loop_delay</title>
        The attribute @unit must be equal to one of the following values 'day', 'hr', 'julian day', 'microseconds', 'min', 'ms', 'ns', 's', 'yr'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="disp:Movie_Display_Settings/disp:loop_flag">
      <sch:assert test=". = ('false', 'true')">
        <title>disp:Movie_Display_Settings/disp:loop_flag/disp:loop_flag</title>
        The attribute disp:Movie_Display_Settings/disp:loop_flag must be equal to one of the following values 'false', 'true'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="disp:Display_Settings">
      <sch:let name="horizontal_display_axis" value="disp:Display_Direction/disp:horizontal_display_axis"/>
      <sch:let name="vertical_display_axis" value="disp:Display_Direction/disp:vertical_display_axis"/>
      <sch:let name="local_identifier_reference" value="pds:Local_Internal_Reference/pds:local_identifier_reference"/>
      <sch:assert test="//pds:*[pds:local_identifier=$local_identifier_reference]/pds:Axis_Array[pds:axis_name=$horizontal_display_axis]">
        <title>display_settings_validate_axis/Rule</title>
        In Display_Direction, the horizontal_display_axis (<sch:value-of select='$horizontal_display_axis'/>) must match the name of an axis in the referenced Array (<sch:value-of select='$local_identifier_reference'/>)</sch:assert>
      <sch:assert test="//pds:*[pds:local_identifier=$local_identifier_reference]/pds:Axis_Array[pds:axis_name=$vertical_display_axis]">
        <title>display_settings_validate_axis/Rule</title>
        In Display_Direction, the vertical_display_axis (<sch:value-of select='$vertical_display_axis'/>) must match the name of an axis in the referenced Array (<sch:value-of select='$local_identifier_reference'/>)</sch:assert>
      <sch:assert test="not($horizontal_display_axis=$vertical_display_axis)">
        <title>display_settings_validate_axis/Rule</title>
        In Display_Direction, the horizontal_display_axis (<sch:value-of select='$horizontal_display_axis'/>) must not match the name of the vertical_display_axis in the referenced Array (<sch:value-of select='$local_identifier_reference'/>)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="disp:Movie_Display_Settings">
      <sch:let name="horizontal_display_axis" value="../disp:Display_Direction/disp:horizontal_display_axis"/>
      <sch:let name="vertical_display_axis" value="../disp:Display_Direction/disp:vertical_display_axis"/>
      <sch:let name="time_display_axis" value="disp:time_display_axis"/>
      <sch:let name="local_identifier_reference" value="../pds:Local_Internal_Reference/pds:local_identifier_reference"/>
      <sch:assert test="//pds:*[pds:local_identifier=$local_identifier_reference]/pds:Axis_Array[pds:axis_name=$time_display_axis]">
        <title>movie_settings_validate_axis/Rule</title>
        In Movie_Display_Settings, the time_display_axis (<sch:value-of select='$time_display_axis'/>) must match the name of an axis in the referenced Array (<sch:value-of select='$local_identifier_reference'/>)</sch:assert>
      <sch:assert test="not($time_display_axis=($horizontal_display_axis, $vertical_display_axis))">
        <title>movie_settings_validate_axis/Rule</title>
        In Movie_Display_Settings, the time_display_axis (<sch:value-of select='$time_display_axis'/>) must not match the name of the horizontal_display_axis or vertical_display_axis in the referenced Array (<sch:value-of select='$local_identifier_reference'/>)</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>

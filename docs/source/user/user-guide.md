6/3/2022  
Display DMSP Team

> Note to authors who use this outline: The outline is a
> suggestion only. It includes the minimum of content needed to inform the
> dictionary user. Authors are expected to tailor the outline to their particular
> purposes, elaborating and providing context as needed.

# Introduction
   1. The purpose of this User’s Guide is to describe the classes and attributes used to define the way images and movies are included in a PDS4 label.
   1. The intended audience is anyone who needs to create/use PDS4 labels to describe/view image and movie data.
   1. Applicable Documents

# Overview of the Display Local Data Dictionary

The classes in this dictionary define the appropriate way to draw or otherwise display array-type data objects in order to be able to correctly interpret geometric or other quantities referened to an image elsewhere in the label. Products that might use this dictionary include 2-dimensional image arrays, movies, and RGB images. This dictionary is maintained and updated by its steward, ______ at the Imaging node. Updates for this dictionary occur when the PDS4 common schema is updated and when a need for an update is decided upon.

# How to Include the Display Local Data Dictionary in a PDS4 Label

*Briefly explain the form that a discipline dictionary
takes: the input ingest file, the output schema, Schematron, and other files,
which ones are necessary and which ones may be ignored.*

*Give the URL at PDS where the dictionary files may be downloaded.*
[https://pds.nasa.gov/datastandards/dictionaries/index-1.17.0.0.shtml#disp]

*Give (and explain) a label snippet showing the beginning lines of a 
label to demonstrate the use of the dictionary schema and schematron
in the xml prolog and the root tag (preferably Product_Observational).*
<?xml version="1.0" encoding="UTF-8"?>
<?xml-model href="http://pds.nasa.gov/pds4/pds/v1/PDS4_PDS_1C00.sch"
schematypens="http://purl.oclc.org/dsdl/schematron"?>
<?xml-model href="http://http://pds.nasa.gov/pds4/disp/v1/PDS4_DISP_1B00.sch"
schematypens="http://purl.oclc.org/dsdl/schematron"?>
<Product_Observational 
    xmlns="http://pds.nasa.gov/pds4/pds/v1"
    xmlns:pds="http://pds.nasa.gov/pds4/pds/v1"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:disp="http://pds.nasa.gov/pds4/disp/v1"
    xsi:schemaLocation="http://pds.nasa.gov/pds4/pds/v1 http://pds.nasa.gov/pds4/pds/v1/PDS4_PDS_1C00.xsd          http://pds.nasa.gov/pds4/disp/v1 http://pds.nasa.gov/pds4/disp/v1/PDS4_DISP_1B00.xsd">

*Give (and explain) a label snippet showing the location
of the classes and attributes in the label; i.e., inside the Discipline_Area
tag. Collapse the lower level classes if needed for brevity.*
        <Discipline_Area>
            <disp:Display_Settings>
                <Local_Internal_Reference>
                    <pds:comment>First attempt at 2D-Array image label making</pds:comment>
                    <pds:local_identifier_reference>image now</pds:local_identifier_reference>
                    <pds:local_reference_type>display_settings_to_array</pds:local_reference_type>
                </Local_Internal_Reference>
                <Local_Internal_Reference>
                    <pds:local_identifier_reference>frame_2_image</pds:local_identifier_reference>
                    <pds:local_reference_type>display_settings_to_array</pds:local_reference_type>
                </Local_Internal_Reference>
                <Local_Internal_Reference>
                    <pds:local_identifier_reference>frame_3_image</pds:local_identifier_reference>
                    <pds:local_reference_type>display_settings_to_array</pds:local_reference_type>
                </Local_Internal_Reference>
                <Local_Internal_Reference>
                    <pds:local_identifier_reference>frame_4_image</pds:local_identifier_reference>
                    <pds:local_reference_type>display_settings_to_array</pds:local_reference_type>
                </Local_Internal_Reference>
                <Local_Internal_Reference>
                    <pds:local_identifier_reference>frame_5_image</pds:local_identifier_reference>
                    <pds:local_reference_type>display_settings_to_array</pds:local_reference_type>
                </Local_Internal_Reference>
                <disp:Display_Direction>
                    <disp:horizontal_display_axis>Line</disp:horizontal_display_axis>
                    <disp:horizontal_display_direction>Left to Right</disp:horizontal_display_direction>
                    <disp:vertical_display_axis>Sample</disp:vertical_display_axis>
                    <disp:vertical_display_direction>Bottom to Top</disp:vertical_display_direction>
                </disp:Display_Direction>
            </disp:Display_Settings>
        </Discipline_Area>

*In general, for label snippets use a fixed-width font and
consistent indentation. Color-coding is helpful. Label snippets copied from an
Oxygen editor window will retain their color-coding when pasted here.*

# Organization of Classes and Attributes

*Give a schematic diagram or a list showing the hierarchy of
classes in order of appearance in label. Refer the reader to the Definitions
section for complete definitions. An example of such a list is given on the
page [Filling Out The Spectral Dictionary Classes](http://sbndev.astro.umd.edu/wiki/Filling_Out_the_Spectral_Dictionary_Classes#.3CCircular_FOV.3E)
on the PDS Small Bodies Node wiki. In this example the names of classes and attributes have hyperlinks to
their definitions further down the page, a useful lookup tool.*

*The author should take into consideration the complexity
of the dictionary when organizing this section.  If the hierarchy is large or
complicated, it may be helpful to break it down by class as shown in the
following subsections, but don’t forget to provide a high-level view of how the
classes relate to one another.*

## Display_Settings

This is the main class for the Display Dictionary. It is required and is used to include display information in any label that includes one or more array-type objects. This class is repeated for each object that needs display information.

*Give a schematic diagram or a list of the attributes in this class in order of 
appearance in label. Refer reader to Definitions section for complete definitions.*

### Local_Internal_Reference

This required class is used to identify the specific array-type object to which these display settings apply.

#### comment
An optional free format text field used to include and clarifying information needed.

#### local_identifier_reference
This required attribute identifies the array object ro which this instance of Display_Settings applies.

#### local_reference_type
This required attribute must have the value *display_settings_to_array*.

### Display_Direction
This required class defines the correct orientation for displaying the array axes associated with a single image plane (that is, the Line and Sample axes).

#### comment
An optional free format text field used to include and clarifying information needed.

#### horizontal_display_axis
This required attribute identifies which axis of the array is considered the horizontal (or "sample") axis by referencing the *axis_name* value. The value must match the name exactly.

#### horizontal_display_direction
This required attribute indicates the direct in which the pixels should be drawn sequentially along the horizontal axis of the display device. The value entered must be one of the following:
- Left to Right
- Right to Left

#### vertical_display_axis
This required attribute identifies which axis of the array is considered the vertical (or "line") axis by referencing the *axis_name* value. The value must match the name exactly.
 
#### vertical_display_direction
This required attribute indicates the direction in which lines of pixels should be stacked sequentially along the vertical direction of the display device. The value entered must be one of the following:
- Top to Bottom
- Bottom to Top

*Give label snippets showing use of the class and attributes, with annotations 
as appropriate. Refer reader to Examples section for complete examples.*

*Explain why some things are required and others are optional.*

*List and explain any rules that apply to this class (e.g. from Schematron).*

### Color_Display_Settings
Use this class if your array object is an RGB color image, or a banded image for which you would like to define a default set of channels to be interpreted as RGB levels.

#### color_display_axis
This required attribute must correspond to the *axis_name* value of one of the axes of the relavant array-type object. This axis is considered to be the "color" or "band" axis.

#### comment
Use this optional free-format text attribute for any additional information.

#### red_channel_band
This required attribute is the subscript to be used in the named *color_display_axis* for the red (R) value.

#### green_channel_band
This required attribute is the subscript to be used in the named *color_display_axis* for the green (G) value.

#### blue_channel_band
This required attribute is the subscript to be used in the named *color_display_axis* for the blue (B) value.

### Movie_Display_Settings
Use this class to define a time axis and parameters for displaying the associated array object as a movie.

#### time_display_axis
The value of this required attribute must correspond to the *axis_name* value of one of the axes of the relevant array-type object. This is the axis that will be considered the "time" axis. 

#### comment
Use this optional free-format text attribute for any additional information.

#### frame_rate
This optional attribute indicates how many images should be displayed each second. A unit, such as "frames/s" must be specified. The minimum value is 1.0.

	<frame_rate unit="frames/s">12</frame_rate>

#### loop_flag
This optional attribute contains the value *true* if the movie should be looped or *false* if not.

#### loop_count
This optional attribute contains the number of times the movie should be looped before being stopped. The minimum value is one.

#### loop_delay
This optional attribute gives the amount of time to pause between playback loops. A unit, such as "ms", must be included. The minimum value is zero.

	<loop_delay="ms">500</loop_delay>

#### loop_back_and_forth_flag
This optional attribute contains the value *true* if the movie should be played alternately forward and in reverse while looping, or *false* if it should only be played in the forward direction when looping.


[repeat this subsection for each class]

# Definitions

*Give an alphabetical list of all classes and attributes
with complete definitions. (Useful ones, not silly ones like "The
map_projection_name attribute provides the name of the map projection.")*

*Include:*

- *Class or attribute name (indicate which it is; capitalize class names according to PDS4 standard)*
- *PDS4 data type (ASCII_Short_String_Collapsed, ASCII_Real, ASCII_Date, etc.)*
- *Definition in complete sentences*
- *Cardinality (minimum and maximum number of values permitted)*
- *Nillable, yes or no? Explain when it is appropriate to use a nil value*
- *Minimum and maximum numeric values, if applicable*
- *Minimum and maximum number of characters, if applicable*
- *List of valid values, if applicable.*

# Examples

*Give one or more examples of label snippets for real products, annotated as appropriate. 
Make sure the examples can be successfully validated using the latest version of the PDS4 
core dictionary and, of course, the dictionary described in this document.*

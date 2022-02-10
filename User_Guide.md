# Table of Contents

[1 Introduction](#introduction)

[2 Overview of the Display Discipline Data Dictionary
](#overview-of-the-display-discipline-data-dictionary)

[3 How to Include the Display Dictionary in a PDS4 Label
](#how-to-include-the-display-dictionary-in-a-pds4-label)

[4 Organization of Classes and Attributes
](#organization-of-classes-and-attributes)

[5 Definitions](#definitions)

[6 Examples](#examples)

# Introduction

*The Display Dictionary contains classes, elements, attributes, and
rules describing the appropriate way to correctly draw an image also
called an array-type data object in PDS4. This dictionary should be used
(and likely soon required) for any PDS4 image or spectral cube. The
Cartography and Imaging Node at the U.S. Geological Survey and Jet
Propulsion Laboratories (JPL) are the stewards of this dictionary.
Expect updates at least once per year. Currently, Trent Hare from USGS,
oversees updates to the dictionary and any questions can be addressed to
him (*<thare@usgs.gov>*).*

*Fortunately, the creation of the display section can generally be fully
automated. Although, for full validation, the PDS4 image array should be
manually visualized using existing PDS4 viewers. Methods to automate the
creation of this section can be found in On-Line Archiving Facility
(OLAF) and from within applications which use the Geospatial Data
Abstraction Library (GDAL). Tools to visualize and validate the display
direction for PDS4 images can be found here:
<https://pds.nasa.gov/tools/tool-registry/> .*

# Overview of the Display Discipline Data Dictionary

*The Display Dictionary is a relatively simple class and contains only
four classes and about twenty attributes (Figure 1). While currently not
mandatory, the Display Dictionary should be used for
<span class="underline">all</span> PDS4 images (also known as array-type
data objects). Not only does this dictionary control how images are
displayed to the user, but it can also define how the mapping of
separate image axes (e.g., bands) are mapped to red, green, and blue
channels for color display. The dictionary can also define if the image
should be shown as a movie or animation. For example, you can define the
\<frame\_rate\> and how many times the full set of frames should looped
over. To tie this to a real-world example, similar settings are
typically found in animated GIFs (Graphics Interchange Format).*

*This dictionary is essential since it is common to see different
conventions across various formats on how to actually display an image
data to the user. For example, FITS images are conventionally displayed
with row number increasing from bottom to top. In other words, the
bottom row of the image is displayed first, and the top row of the image
is displayed last. This is also called a bottom-up organization. In
contrast, more recently introduced formats like TIFF or USGS’s ISIS
cube, are generally displayed from top to bottom (or top-down
organization). To specify a bottom-up or top-down display direction the
\<Display\_Direction\> class is used in concert with the
\<vertical\_display\_direction\> label attribute, which only has two
options available including “Top to Bottom” and “Bottom to Top”.
Critical to complete the vertical definition, one must also define the
\<vertical\_display\_axis\>. The user defined attribute in
\<vertical\_display\_axis\> defines which axis of the array is
considered the vertical axis (generally tagged as "Line"). This
attribute should directly reference the \<axis\_name\> from the
\<File\_Area\_Observational\> array object (e.g., \<Array\_2D\>,
\<Array\_3D\_Image\>, etc.) and the value must match the name exactly
(case included). This will be check during validation.*

*While more infrequent to see variation across formats, the Display
Dictionary also requires that the \<horizontal\_display\_direction\> and
\<horizontal\_display\_axis\> attributes are defined. For the
\<horiztonal\_display\_direction\> the two choices allowed including
“Left to Right” or “Right to Left”. It is typical that most image
arrays will be displayed to the user defined as “Left to Right” and the
\<horizontal\_display\_axis\> will likely be defined as “Sample”. See
examples below.*

![](media/image1.png)Figure 1. shows the full class listing of the
Display Dictionary. Note that not all the attributes are exposed.

# How to Include the Display Dictionary in a PDS4 Label

*If you use the recommended method for defining references for
validation (as described in [Schema Referencing in PDS4
Labels](http://sbndev.astro.umd.edu/wiki/Schema_Referencing_in_PDS4_Labels)),
the \<?xml-model\> processing instructions at the top of your label will
look like this:*

*\<?xml-model
href="https://pds.nasa.gov/pds4/sp/v1/PDS4\_DISP\_1H00\_1510.sch"
schematypens="http://purl.oclc.org/dsdl/schematron"?\>*

*Similarly, if you're following the recommendations on that page for XSD
referencing, then inside the \<Product\_Observational\> tag you will
need to add this namespace definition:*

*xmlns:disp="http://pds.nasa.gov/pds4/disp/v1"*

*and this pair inside the quotes of your xsi:schemaLocation XML
attribute:*

*https://pds.nasa.gov/pds4/disp/v1*

*https://pds.nasa.gov/pds4/disp/v1/PDS4\_DISP\_1H00\_1510.xsd*

*Note the disp: prefix is reserved by PDS for classes and attributes
from the Display Discipline Dictionary. Next is show the initial top
part of a PDS4 label with the display dictionary defined.*

# Organization of Classes and Attributes

*Looking at the top-level schematic diagram in figure 1, shows that
Display Dictionary is simply structured and straight forward. Currently,
only the \<Display\_Direction\> class is required.*

## *\< disp:Local\_Internal\_Reference\>*

*OPTIONAL. The Local Internal Reference class is used to cross-reference
the specific image (array-type object) to which these display settings
apply. Note that the class name \<Local\_Internal\_Reference\> and the
attributes within it all come from the PDS core namespace. For the
purposes of this description, we'll indicate the attributes in the PDS
core namespace by adding an explicit "pds:" namespace abbreviation
prefix to them.*

> *\<pds:comment\>*
> 
> *OPTIONAL. This is a free-text field for any clarifying comments you
> might wish to include.*
> 
> *\<pds:local\_identifier\_reference\>*
> 
> *REQUIRED. This attribute identifies the array object to which the
> display settings apply, by citing the local\_identifier value from the
> associated array object. All array-type objects have an optional
> \<local\_identifier\> attribute, which, when present, must have a
> value that is unique within the label. You must assign
> local\_identifier values to your arrays when you are providing display
> information.*
> 
> *\<pds:local\_reference\_type\>*
> 
> *REQUIRED. This must have the value display\_settings\_to\_array.*

## \<*disp:*Display\_Direction\>

*REQUIRED. This class defines the correct orientation for displaying the
array axes associated with a single image plane (that is, the Line and
Sample axes).*

> *\<comment\>*
> 
> *OPTIONAL. This is a free-text field for any clarifying comments.*
> 
> *\<horizontal\_display\_axis\>*
> 
> *REQUIRED. This attribute identifies which axis of the array is
> considered the horizontal (or "Sample") axis by referencing the
> \<axis\_name\> value. The value must match the name exactly (case
> included).*
> 
> *\<horizontal\_display\_direction\>*
> 
> *REQUIRED. This attribute indicates the direction in which pixels
> should be drawn sequentially along the horizontal axis of the display
> device. It must have one of these two values (case and embedded blanks
> are significant):*

  - *Left to Right*

  - *Right to Left*

> *\<vertical\_display\_axis\>*
> 
> *REQUIRED. This attribute identifies which axis of the array is
> considered the vertical (or "Line") axis by reference the
> \<axis\_name\> value. The value must match the name exactly (case
> included).*
> 
> *\<vertical\_display\_direction\>*
> 
> *REQUIRED. This attribute indicates the direction in which lines of
> pixels should be stacked sequentially along the vertical direction of
> the display device. It must have one of these two values (case and
> embedded blanks are significant):*

  - *Top to Bottom*

  - *Bottom to Top*

## \<*disp:* *Color\_Display\_Settings*\>

*OPTIONAL. Use this class if your array object is an RGB (Red, Green,
Blue) color image, or a banded image for which you would like to define
a default set of channels to be interpreted as RGB levels.*

> *\<color\_display\_axis\>*
> 
> *REQUIRED. The value of this attribute must correspond to the
> \<axis\_name\> value of one of the axes of the relevant array-type
> object. This is the axis that well be considered the "color" or "band"
> axis. Logically, it must not be the same value as found in either the
> \<horizontal\_display\_axis\> or \<vertical\_display\_axis\> of the
> \<Display\_Direction\> class, but this is not validated - so type
> carefully.*
> 
> *\<comment\>*
> 
> *OPTIONAL. Free-format text for additional notes to users.*
> 
> *\<red\_channel\_band\>*
> 
> *REQUIRED. This attribute is the subscript to be used in the named
> color\_display\_axis for the red (R) value. Note that the first
> element along this axis is considered to have a subscript of 1 (one).*
> 
> *\<green\_channel\_band\>*
> 
> *REQUIRED. This attribute is the subscript to be used in the named
> color\_display\_axis for the green (G) value. Note that the first
> element along this axis is considered to have a subscript of 1 (one).*
> 
> *\<blue\_channel\_band\>*
> 
> *REQUIRED. This attribute is the subscript to be used in the named
> color\_display\_axis for the blue (B) value. Note that the first
> element along this axis is considered to have a subscript of 1 (one).*

## \<*disp:Movie\_Display\_Settings*\>

*OPTIONAL. Use this class to define a time axis and parameters for
displaying the associated array object as a movie.*

> *\<time\_display\_axis\>*
> 
> *REQUIRED. The value of this attribute must correspond to the
> \<axis-name\> value of one of the axes of the relevant array-type
> object. This is the axis that well be considered the "time" axis.
> Logically, it must not be the same value as either
> \<horizontal\_display\_axis\> or \<vertical\_display\_axis\> of the
> \<Display\_Direction\> class. This will be tested during label
> validation.*
> 
> *\<comment\>*
> 
> *OPTIONAL. Free-format text for additional notes to the user.*
> 
> *\<frame\_rate\>*
> 
> *OPTIONAL. This attribute indicates how many images (i.e, "frames")
> should be displayed each second. You must specify a unit of
> "frames/s". For example:*
> 
> *\<frame\_rate unit="frames/s"\>12\</frame\_rate\>*
> 
> *The minimum valid value for this attribute is 1.0.*
> 
> *\<loop\_flag\>*
> 
> *OPTIONAL. This attribute will contain the value true if the movie
> should be looped, or false if not.*
> 
> *\<loop\_count\>*
> 
> *OPTIONAL. This attribute contains the number of times the movie
> should be looped before being stopped. It may have a minimum value of
> one (1).*
> 
> *\<loop\_delay\>*
> 
> *OPTIONAL.This attribute give the amount of time to pause between
> playback loops. You must include a time unit with the value, e.g.:*
> 
> *\<loop\_delay unit="ms"\>500\</loop\_delay\>*
> 
> *This may have a minimum value of zero (0).*
> 
> *\<loop\_back\_and\_forth\_flag\>*
> 
> *OPTIONAL.This attribute will contain the value true if the movie
> should be played alternately forward and in reverse while looping; or
> false if it should only be played in the forward direction when
> looping. Note that this attribute only makes logical sense in the
> presence of other looping attributes, but as of this writing this is
> neither required nor validated.*

# Definitions

*As stated above, there are four classes and about 20 attributes within
the display discipline dictionary.*

5.1 \<disp:time\_display\_axis\>

*The value of this attribute must correspond to the \<axis-name\> value
of one of the axes of the relevant array-type object. This is the axis
that well be considered the "time" axis. Logically, it must not be the
same value as either \<horizontal\_display\_axis\> or
\<vertical\_display\_axis\> of the \<Display\_Direction\> class. This
will be tested during label validation.*

*  
*

# Examples

## Typical FITs Array\_2D\_Image example 

This example shows a typical display section from a FITs 1 band image
array.

## Typical multi-band Array\_3D\_Spectrum example 

This example shows a typical display section from a raw 5 band image
array.

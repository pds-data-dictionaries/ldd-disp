## PDS4 Discipline Display Data Dictionary User&#39;s Guide
### _(preliminary)_

February 01, 2022

Trent Hare and Anne Raugh
# 1

# Table of Contents

[1 Introduction 2](#_Toc95321945)

[2 Overview of the Display Discipline Data Dictionary 2](#_Toc95321946)

[3 How to Include the Display Dictionary in a PDS4 Label 3](#_Toc95321947)

[4 Organization of Classes and Attributes 4](#_Toc95321948)

[5 Definitions 6](#_Toc95321953)

[6 Examples 8](#_Toc95321955)

# 1Introduction

The Display Dictionary contains classes, elements, attributes, and rules describing the appropriate way to correctly draw an image also called an array-type data object in PDS4. This dictionary should be used (and likely soon required) for any PDS4 image or spectral cube. The Cartography and Imaging Node at the U.S. Geological Survey and Jet Propulsion Laboratories (JPL) are the stewards of this dictionary. Expect updates at least once per year. Currently, Trent Hare from USGS, oversees updates to the dictionary and any questions can be addressed to him ([thare@usgs.gov](mailto:thare@usgs.gov)).

Fortunately, the creation of the display section can generally be fully automated. Although, for full validation, the PDS4 image array should be manually visualized using existing PDS4 viewers. Methods to automate the creation of this section can be found in On-Line Archiving Facility (OLAF) and from within applications which use the Geospatial Data Abstraction Library (GDAL). Tools to visualize and validate the display direction for PDS4 images can be found here: [https://pds.nasa.gov/tools/tool-registry/](https://pds.nasa.gov/tools/tool-registry/) .

# 2Overview of the Display Discipline Data Dictionary

The Display Dictionary is a relatively simple class and contains only four classes and about twenty attributes (Figure 1). While currently not mandatory, the Display Dictionary should be used for all PDS4 images (also known as array-type data objects). Not only does this dictionary control how images are displayed to the user, but it can also define how the mapping of separate image axes (e.g., bands) are mapped to red, green, and blue channels for color display. The dictionary can also define if the image should be shown as a movie or animation. For example, you can define the \&lt;frame\_rate\&gt; and how many times the full set of frames should looped over. To tie this to a real-world example, similar settings are typically found in animated GIFs (Graphics Interchange Format).

This dictionary is essential since it is common to see different conventions across various formats on how to actually display an image data to the user. For example, FITS images are conventionally displayed with row number increasing from bottom to top. In other words, the bottom row of the image is displayed first, and the top row of the image is displayed last. This is also called a bottom-up organization. In contrast, more recently introduced formats like TIFF or USGS&#39;s ISIS cube, are generally displayed from top to bottom (or top-down organization). To specify a bottom-up or top-down display direction the \&lt;Display\_Direction\&gt; class is used in concert with the \&lt;vertical\_display\_direction\&gt; label attribute, which only has two options available including &quot;Top to Bottom&quot; and &quot;Bottom to Top&quot;. Critical to complete the vertical definition, one must also define the \&lt;vertical\_display\_axis\&gt;. The user defined attribute in \&lt;vertical\_display\_axis\&gt; defines which axis of the array is considered the vertical axis (generally tagged as &quot;Line&quot;). This attribute should directly reference the \&lt;axis\_name\&gt; from the \&lt;File\_Area\_Observational\&gt; array object (e.g., \&lt;Array\_2D\&gt;, \&lt;Array\_3D\_Image\&gt;, etc.) and the value must match the name exactly (case included). This will be check during validation.

While more infrequent to see variation across formats, the Display Dictionary also requires that the \&lt;horizontal\_display\_direction\&gt; and \&lt;horizontal\_display\_axis\&gt; attributes are defined. For the \&lt;horiztonal\_display\_direction\&gt; the two choices allowed including &quot;Left to Right&quot; or &quot;Right to Left&quot;. It is typical that most image arrays will be displayed to the user defined as &quot;Left to Right&quot; and the \&lt;horizontal\_display\_axis\&gt; will likely be defined as &quot;Sample&quot;. See examples below.

![](RackMultipart20220210-4-1mvl91x_html_668799b4cb0a7b1e.png)Figure 1. shows the full class listing of the Display Dictionary. Note that not all the attributes are exposed.

# 3How to Include the Display Dictionary in a PDS4 Label

If you use the recommended method for defining references for validation (as described in [Schema Referencing in PDS4 Labels](http://sbndev.astro.umd.edu/wiki/Schema_Referencing_in_PDS4_Labels)), the \&lt;?xml-model\&gt; processing instructions at the top of your label will look like this:

\&lt;?xml-model href=&quot;https://pds.nasa.gov/pds4/sp/v1/PDS4\_DISP\_1H00\_1510.sch&quot; schematypens=&quot;http://purl.oclc.org/dsdl/schematron&quot;?\&gt;

Similarly, if you&#39;re following the recommendations on that page for XSD referencing, then inside the \&lt;Product\_Observational\&gt; tag you will need to add this namespace definition:

xmlns:disp=&quot;http://pds.nasa.gov/pds4/disp/v1&quot;

and this pair inside the quotes of your xsi:schemaLocation XML attribute:

https://pds.nasa.gov/pds4/disp/v1

https://pds.nasa.gov/pds4/disp/v1/PDS4\_DISP\_1H00\_1510.xsd

![Shape1](RackMultipart20220210-4-1mvl91x_html_d9a7d71469ef1192.gif)

\&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?\&gt;

\&lt;?xml-model href=&quot;https://pds.nasa.gov/datastandards/schema/released/pds/v1/PDS4\_PDS\_1H00.sch&quot; schematypens=&quot;http://purl.oclc.org/dsdl/schematron&quot;?\&gt;

\&lt;?xml-model href=https://pds.nasa.gov/pds4/disp/v1/PDS4\_DISP\_1H00\_1510.sch

schematypens=&quot;http://purl.oclc.org/dsdl/schematron&quot;?\&gt;

\&lt;Product\_Observational xmlns=&quot;http://pds.nasa.gov/pds4/pds/v1&quot;

xmlns:pds=&quot;http://pds.nasa.gov/pds4/pds/v1&quot;

xmlns:disp=&quot;http://pds.nasa.gov/pds4/disp/v1&quot;

xmlns:xsi=&quot;http://www.w3.org/2001/XMLSchema-instance&quot;

xsi:schemaLocation=&quot;

http://pds.nasa.gov/pds4/pds/v1 https://pds.nasa.gov/datastandards/schema/released/pds/v1/PDS4\_PDS\_1C00.xsd

http://pds.nasa.gov/pds4/disp/v1 https://pds.nasa.gov/pds4/disp/v1/PDS4\_DISP\_1H00\_1510.xsd

\&lt;Identification\_Area\&gt;

…

Note the disp:prefix is reserved by PDS for classes and attributes from the Display Discipline Dictionary. Next is show the initial top part of a PDS4 label with the display dictionary defined.

# 4Organization of Classes and Attributes

Looking at the top-level schematic diagram in figure 1, shows that Display Dictionary is simply structured and straight forward. Currently, only the \&lt;Display\_Direction\&gt; class is required.

## 4.1\&lt; disp:Local\_Internal\_Reference\&gt;

OPTIONAL. The Local Internal Reference class is used to cross-reference the specific image (array-type object) to which these display settings apply. Note that the class name \&lt;Local\_Internal\_Reference\&gt; and the attributes within it all come from the PDS core namespace. For the purposes of this description, we&#39;ll indicate the attributes in the PDS core namespace by adding an explicit &quot;pds:&quot; namespace abbreviation prefix to them.

\&lt;pds:comment\&gt;

OPTIONAL. This is a free-text field for any clarifying comments you might wish to include.

\&lt;pds:local\_identifier\_reference\&gt;

REQUIRED. This attribute identifies the array object to which the display settings apply, by citing the local\_identifier value from the associated array object. All array-type objects have an optional \&lt;local\_identifier\&gt; attribute, which, when present, must have a value that is unique within the label. You must assign local\_identifier values to your arrays when you are providing display information.

\&lt;pds:local\_reference\_type\&gt;

REQUIRED. This must have the value display\_settings\_to\_array.

## 4.2\&lt;disp:Display\_Direction\&gt;

REQUIRED. This class defines the correct orientation for displaying the array axes associated with a single image plane (that is, the Line and Sample axes).

\&lt;comment\&gt;

OPTIONAL. This is a free-text field for any clarifying comments.

\&lt;horizontal\_display\_axis\&gt;

REQUIRED. This attribute identifies which axis of the array is considered the horizontal (or &quot;Sample&quot;) axis by referencing the \&lt;axis\_name\&gt; value. The value must match the name exactly (case included).

\&lt;horizontal\_display\_direction\&gt;

REQUIRED. This attribute indicates the direction in which pixels should be drawn sequentially along the horizontal axis of the display device. It must have one of these two values (case and embedded blanks are significant):

- Left to Right
- Right to Left

\&lt;vertical\_display\_axis\&gt;

REQUIRED. This attribute identifies which axis of the array is considered the vertical (or &quot;Line&quot;) axis by reference the \&lt;axis\_name\&gt; value. The value must match the name exactly (case included).

\&lt;vertical\_display\_direction\&gt;

REQUIRED. This attribute indicates the direction in which lines of pixels should be stacked sequentially along the vertical direction of the display device. It must have one of these two values (case and embedded blanks are significant):

- Top to Bottom
- Bottom to Top

## 4.3\&lt;disp: Color\_Display\_Settings\&gt;

OPTIONAL. Use this class if your array object is an RGB (Red, Green, Blue) color image, or a banded image for which you would like to define a default set of channels to be interpreted as RGB levels.

\&lt;color\_display\_axis\&gt;

REQUIRED. The value of this attribute must correspond to the \&lt;axis\_name\&gt; value of one of the axes of the relevant array-type object. This is the axis that well be considered the &quot;color&quot; or &quot;band&quot; axis. Logically, it must not be the same value as found in either the \&lt;horizontal\_display\_axis\&gt; or \&lt;vertical\_display\_axis\&gt; of the \&lt;Display\_Direction\&gt; class, but this is not validated - so type carefully.

\&lt;comment\&gt;

OPTIONAL. Free-format text for additional notes to users.

\&lt;red\_channel\_band\&gt;

REQUIRED. This attribute is the subscript to be used in the named color\_display\_axis for the red (R) value. Note that the first element along this axis is considered to have a subscript of 1 (one).

\&lt;green\_channel\_band\&gt;

REQUIRED. This attribute is the subscript to be used in the named color\_display\_axis for the green (G) value. Note that the first element along this axis is considered to have a subscript of 1 (one).

\&lt;blue\_channel\_band\&gt;

REQUIRED. This attribute is the subscript to be used in the named color\_display\_axis for the blue (B) value. Note that the first element along this axis is considered to have a subscript of 1 (one).

## 4.4\&lt;disp:Movie\_Display\_Settings\&gt;

OPTIONAL. Use this class to define a time axis and parameters for displaying the associated array object as a movie.

\&lt;time\_display\_axis\&gt;

REQUIRED. The value of this attribute must correspond to the \&lt;axis-name\&gt; value of one of the axes of the relevant array-type object. This is the axis that well be considered the &quot;time&quot; axis. Logically, it must not be the same value as either \&lt;horizontal\_display\_axis\&gt; or \&lt;vertical\_display\_axis\&gt; of the \&lt;Display\_Direction\&gt; class. This will be tested during label validation.

\&lt;comment\&gt;

OPTIONAL. Free-format text for additional notes to the user.

\&lt;frame\_rate\&gt;

OPTIONAL. This attribute indicates how many images (i.e, &quot;frames&quot;) should be displayed each second. You must specify a unit of &quot;frames/s&quot;. For example:

\&lt;frame\_rate unit=&quot;frames/s&quot;\&gt;12\&lt;/frame\_rate\&gt;

The minimum valid value for this attribute is 1.0.

\&lt;loop\_flag\&gt;

OPTIONAL. This attribute will contain the value true if the movie should be looped, or false if not.

\&lt;loop\_count\&gt;

OPTIONAL. This attribute contains the number of times the movie should be looped before being stopped. It may have a minimum value of one (1).

\&lt;loop\_delay\&gt;

OPTIONAL.This attribute give the amount of time to pause between playback loops. You must include a time unit with the value, e.g.:

\&lt;loop\_delay unit=&quot;ms&quot;\&gt;500\&lt;/loop\_delay\&gt;

This may have a minimum value of zero (0).

\&lt;loop\_back\_and\_forth\_flag\&gt;

OPTIONAL.This attribute will contain the value true if the movie should be played alternately forward and in reverse while looping; or false if it should only be played in the forward direction when looping. Note that this attribute only makes logical sense in the presence of other looping attributes, but as of this writing this is neither required nor validated.

# 5Definitions

As stated above, there are four classes and about 20 attributes within the display discipline dictionary.

5.1 \&lt;disp:time\_display\_axis\&gt;

The value of this attribute must correspond to the \&lt;axis-name\&gt; value of one of the axes of the relevant array-type object. This is the axis that well be considered the &quot;time&quot; axis. Logically, it must not be the same value as either \&lt;horizontal\_display\_axis\&gt; or \&lt;vertical\_display\_axis\&gt; of the \&lt;Display\_Direction\&gt; class. This will be tested during label validation.

# 6Examples

## 6.1Typical FITs Array\_2D\_Image example

This example shows a typical display section from a FITs 1 band image array.

…

\&lt;disp:Display\_Settings\&gt;

\&lt;Local\_Internal\_Reference\&gt;

\&lt;local\_identifier\_reference\&gt;ImageData\&lt;/local\_identifier\_reference\&gt;

\&lt;local\_reference\_type\&gt;display\_settings\_to\_array\&lt;/local\_reference\_type\&gt;

\&lt;/Local\_Internal\_Reference\&gt;

\&lt;disp:Display\_Direction\&gt;

\&lt;disp:horizontal\_display\_axis\&gt;Sample\&lt;/disp:horizontal\_display\_axis\&gt;

\&lt;disp:horizontal\_display\_direction\&gt;Left to Right\&lt;/disp:horizontal\_display\_direction\&gt;

\&lt;disp:vertical\_display\_axis\&gt;Line\&lt;/disp:vertical\_display\_axis\&gt;

\&lt;disp:vertical\_display\_direction\&gt;Bottom to Top\&lt;/disp:vertical\_display\_direction\&gt;

\&lt;/disp:Display\_Direction\&gt;

\&lt;/disp:Display\_Settings\&gt;

…

\&lt;File\_Area\_Observational\&gt;

\&lt;File\&gt;

\&lt;file\_name\&gt;hyb2\_tir\_20180617\_041003\_l1.fit\&lt;/file\_name\&gt;

\&lt;creation\_date\_time\&gt;2021-06-29T07:11:41Z\&lt;/creation\_date\_time\&gt;

\&lt;file\_size unit=&quot;byte&quot;\&gt;400320\&lt;/file\_size\&gt;

\&lt;comment\&gt;Hayabusa2 TIR image in the FITS standard format.\&lt;/comment\&gt;

\&lt;/File\&gt;

\&lt;Header\&gt;

\&lt;name\&gt;Hayabusa2 TIR FITS header of the primary HDU\&lt;/name\&gt;

\&lt;offset unit=&quot;byte&quot;\&gt;0\&lt;/offset\&gt;

\&lt;object\_length unit=&quot;byte&quot;\&gt;5760\&lt;/object\_length\&gt;

\&lt;parsing\_standard\_id\&gt;FITS 3.0\&lt;/parsing\_standard\_id\&gt;

\&lt;/Header\&gt;

\&lt;Array\_2D\_Image\&gt;

\&lt;name\&gt;Hayabusa2 TIR FITS data of the primary HDU\&lt;/name\&gt;

\&lt;local\_identifier\&gt;ImageData\&lt;/local\_identifier\&gt;

\&lt;offset unit=&quot;byte&quot;\&gt;5760\&lt;/offset\&gt;

\&lt;axes\&gt;2\&lt;/axes\&gt;

\&lt;axis\_index\_order\&gt;Last Index Fastest\&lt;/axis\_index\_order\&gt;

\&lt;description\&gt;Hayabusa2 TIR raw shutter image data product.\&lt;/description\&gt;

\&lt;Element\_Array\&gt;

\&lt;data\_type\&gt;IEEE754MSBSingle\&lt;/data\_type\&gt;

\&lt;unit\&gt;DN\&lt;/unit\&gt;

\&lt;/Element\_Array\&gt;

\&lt;Axis\_Array\&gt;

\&lt;axis\_name\&gt;Line\&lt;/axis\_name\&gt;

\&lt;elements\&gt;256\&lt;/elements\&gt;

\&lt;sequence\_number\&gt;1\&lt;/sequence\_number\&gt;

\&lt;/Axis\_Array\&gt;

\&lt;Axis\_Array\&gt;

\&lt;axis\_name\&gt;Sample\&lt;/axis\_name\&gt;

\&lt;elements\&gt;384\&lt;/elements\&gt;

\&lt;sequence\_number\&gt;2\&lt;/sequence\_number\&gt;

\&lt;/Axis\_Array\&gt;

\&lt;/Array\_2D\_Image\&gt;

\&lt;/File\_Area\_Observational\&gt;

…

 ![Shape2](RackMultipart20220210-4-1mvl91x_html_b6c146276341b13e.gif)

## 6.2Typical multi-band Array\_3D\_Spectrum example

This example shows a typical display section from a raw 5 band image array.

…

\&lt;disp:Display\_Settings\&gt;

\&lt;disp:Local\_Internal\_Reference\&gt;

\&lt;local\_identifier\_reference\&gt;Spectral\_Qube\&lt;/local\_identifier\_reference\&gt;

\&lt;local\_reference\_type\&gt;display\_settings\_to\_image\&lt;/local\_reference\_type\&gt;

\&lt;/disp:Local\_Internal\_Reference\&gt;

\&lt;disp:Display\_Direction\&gt;

\&lt;disp:horizontal\_display\_axis\&gt;Sample\&lt;/disp:horizontal\_display\_axis\&gt;

\&lt;disp:horizontal\_display\_direction\&gt;Left to Right\&lt;/disp:horizontal\_display\_direction\&gt;

\&lt;disp:vertical\_display\_axis\&gt;Line\&lt;/disp:vertical\_display\_axis\&gt;

\&lt;disp:vertical\_display\_direction\&gt;Top to Bottom\&lt;/disp:vertical\_display\_direction\&gt;

\&lt;/disp:Display\_Direction\&gt;

\&lt;/disp:Display\_Settings\&gt;

…

\&lt;File\_Area\_Observational\&gt;

\&lt;File\&gt;

\&lt;file\_name\&gt;sample\_qube\_5\_bands.img\&lt;/file\_name\&gt;

\&lt;local\_identifier\&gt;DATA\_FILE\&lt;/local\_identifier\&gt;

\&lt;creation\_date\_time\&gt;2013-08-10T13:17:00Z\&lt;/creation\_date\_time\&gt;

\&lt;file\_size unit=&quot;byte&quot;\&gt;0\&lt;/file\_size\&gt;

\&lt;md5\_checksum\&gt;59d3d9ebaf7facadcdca49884793d1ab\&lt;/md5\_checksum\&gt;

\&lt;/File\&gt;

\&lt;Array\_3D\_Spectrum\&gt;

\&lt;local\_identifier\&gt;Spectral\_Qube\&lt;/local\_identifier\&gt;

\&lt;offset unit=&quot;byte&quot;\&gt;7368\&lt;/offset\&gt;

\&lt;axes\&gt;3\&lt;/axes\&gt;

\&lt;axis\_index\_order\&gt;Last Index Fastest\&lt;/axis\_index\_order\&gt;

\&lt;Element\_Array\&gt;

\&lt;data\_type\&gt;SignedMSB2\&lt;/data\_type\&gt;

\&lt;scaling\_factor\&gt;1.3500004E-04\&lt;/scaling\_factor\&gt;

\&lt;value\_offset\&gt;6.3422227E-08\&lt;/value\_offset\&gt;

\&lt;/Element\_Array\&gt;

\&lt;Axis\_Array\&gt;

\&lt;axis\_name\&gt;Band\&lt;/axis\_name\&gt;

\&lt;elements\&gt;5\&lt;/elements\&gt;

\&lt;sequence\_number\&gt;1\&lt;/sequence\_number\&gt;

\&lt;/Axis\_Array\&gt;

\&lt;Axis\_Array\&gt;

\&lt;axis\_name\&gt;Line\&lt;/axis\_name\&gt;

\&lt;elements\&gt;2127\&lt;/elements\&gt;

\&lt;sequence\_number\&gt;2\&lt;/sequence\_number\&gt;

\&lt;/Axis\_Array\&gt;

\&lt;Axis\_Array\&gt;

\&lt;axis\_name\&gt;Sample\&lt;/axis\_name\&gt;

\&lt;elements\&gt;1842\&lt;/elements\&gt;

\&lt;sequence\_number\&gt;3\&lt;/sequence\_number\&gt;

\&lt;/Axis\_Array\&gt;

\&lt;Special\_Constants\&gt;

\&lt;missing\_constant\&gt;-32768\&lt;/missing\_constant\&gt;

…

\&lt;/Array\_3D\_Spectrum\&gt;

\&lt;/File\_Area\_Observational\&gt;

…

 ![Shape3](RackMultipart20220210-4-1mvl91x_html_69586b85d8ae2736.gif)

[1](#sdfootnote1anc)[https://sbnwiki.astro.umd.edu/wiki/Filling\_Out\_the\_Display\_Dictionary\_Classes](https://sbnwiki.astro.umd.edu/wiki/Filling_Out_the_Display_Dictionary_Classes)

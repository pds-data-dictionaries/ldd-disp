# Display (disp) Discipline Namespace User’s Guide

# Contents
   1. Purpose of this User’s Guide
   1. Audience
   1. Applicable Documents

# [Introductory Resources](#introductory)

- [CART Detailed Guide](../docs)
- Using Local Namespaces [SBN Wiki](https://sbnwiki.astro.umd.edu/wiki/Using_Local_Dictionaries)
- Schema Referencing in PDS4 Labels [SBN Wiki](https://sbnwiki.astro.umd.edu/wiki/Schema_Referencing_in_PDS4_Labels)
- Namespace Creation [Resources](https://pds-data-dictionaries.github.io/getting-started/getting-started.html)


# Overview of the Display Namespace

The _Display_ namespace is used to define how an array-type object with two or more 
dimensions should be displayed on, for example, a computer monitor or video screen. The required 
&lt;Display_Direction&gt; class identifies the 2D image plane and how it should be 
displayed using attributes like "Top to Bottom" and "Left to Right".
The namespace also provides classes to identify red, blue, and green channels to display of a color image (color composite) and timing information to display an image cube as an animation or movie. Several looping attributes are optional to define looping count or looping delay time.

# Organization of Classes and Attributes

*Give a schematic diagram or a list showing the hierarchy of
classes in order of appearance in label. Refer the reader to the Definitions
section for complete definitions. An example of such a list is given on the
page [Filling Out The Spectral Dictionary Classes](http://sbndev.astro.umd.edu/wiki/Filling_Out_the_Spectral_Dictionary_Classes#.3CCircular_FOV.3E)
on the PDS Small Bodies Node wiki. In this example the names of classes and attributes have hyperlinks to
their definitions further down the page, a useful lookup tool.*

*The author should take into consideration the complexity
of the dictionary when organizing this section.  If the hierarchy is large or
complicated, it may be helpful to break it down by class as shown in the
following subsections, but don’t forget to provide a high-level view of how the
classes relate to one another.*

## Class 1

*What is this class for?*

*Give a schematic diagram or a list of the attributes in this class in order of 
appearance in label. Refer reader to Definitions section for complete definitions.*

*Give label snippets showing use of the class and attributes, with annotations 
as appropriate. Refer reader to Examples section for complete examples.*

*Explain why some things are required and others are optional.*

*List and explain any rules that apply to this class (e.g. from Schematron).*

## Class 2

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

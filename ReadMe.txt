_______Overview_______

This class computes markups based on initial price, number of people working on the 
job, and the type of materials involved. Initially a base markup of 5% is applied 
to the base price no matter what. After this, the rest of the percentage markups 
are added together and applied to the price + initial markup.

_______Installation_______

Just install the markup-0.0.0.gem file using the ruby gem install command. The 
source is contained in the lib folder.

_______Usage_______

In your ruby script, make sure to include the line:

require "markup"

This will include the markup gem in your script. To use it, assign an object to 
do your calculations with. In the included tests of this class, this is done 
with the line

a = Markup.new

Once this markup object is created, it can be used to calculate any markup you. 
Using the above example, the format is as follows:

a.jobMarkUp(BASE_PRICE, #_PEOPLE, MATERIAL)

Where 	BASE_PRICE is of type float
	#_PEOPLE is of type int
	MATERIAL is of type string or int

This command returns the appropriate markup.

The material markup can be customized using the markups.txt file.

_______markups.txt_______

The material markups that are applied are located in a text file called 
markups.txt that should be located in the directory from which your script is 
run. This file is user customizable so users should be able to add and use 
markups easily. It is a space-separated data file which has the following format.

MATERIAL_ID (MATERIAL_NAMES) MARKUP

Where	MATERIAL_ID 	Is a unique int number that is the ID for that markup
	MATERIAL_NAMES 	Is an optional parameter. It can contain words separated
			by spaces which describe your material (e.g. food, drugs).
			You can use as many or as few as you like. If names are used
			they must also be unique.
	MARKUP		Is the markup percentage in decimal notation (e.g a 7%
			markup would be written as 0.07)

Every line represents an individual markup. Only the MATERIAL_ID and MARKUP are 
required for the markup gem to function.

_______tests_______

I have included a wide variety of test cases to cover a possible inputs, 
improper inputs, reading differently formatted files, and errors that could 
occur. They are located under the tests folder. In the each of the separate 
file tests, there is a different kind of error in the format of markups.txt.

_______Function Descriptions: markup.rb_______

getMaterialList()

	This function reads in the markups.txt file and extracts the markups. 
	It stores them in a markup object in key value pairs for easy retrieval.

jobMarkUp(float basePrice, int workers, int OR string materialType)

	This function calculates the total markup on the product. It returns 
	the final price rounded to 2 decimal places.

getMaterialMarkup(int OR string materialType)
	
	This function checks the markup objects hash of materials and markups for
	the material ID or name. If it is not found, a markup of 0% is returned.




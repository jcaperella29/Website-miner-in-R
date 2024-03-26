# Website-miner-in-R
An R script that will read text from websites and mine them for key words
# First we import needed libaries
#next the user provides the path to a folder contian all urls/websites to be analysied by assigning said path to the "urls_to_mine" variable. 
#next the list.files function extracts the urls from the folder. Since pattern argument is  "*.html" it only return the urls themselves. 
#Next a function is defined that scapes the text from the urls and combines the scraped text into one chunk of text.
#The text is then made into a corpus and tokienized. 
#a few summary statics of text is shown .
#finally , at lines 79, 84 , 88 the user can hunt for keywords within the text. To change the keyword , simplely enter your keywords into the pattern arguement of the kwic function. 
the user then output the results of the search as a csv , using the write.csv function on lines following the kwic searchs.

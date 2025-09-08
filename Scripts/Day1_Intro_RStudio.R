###############################################################################
# Title:        ASDS - Coding Camp - Day 1
# Description:  Introduction to RStudio 
# Author:       Elena Karagianni
# R version:    R 4.4.0
###############################################################################

# Demonstration scripts
# Opens a new window with all available demonstration R scripts
demo()

# Let's run the 'graphics' demo script
# Run the command below, click on the 'Console' and press 'Enter' 
# to execute the script. 
# The commands included in the demo will appear on 'Console'
# To stop, press 'Escape'
demo(graphics)

# Run the following to clear the 'Plots' pane:
# Make sure to run the command after pressing 'Escape'
dev.off()

# R also includes built-in datasets
data()

# Let's examine 'Nile' 
Nile

# More explanation of what this dataset is:
?Nile

# And what type of data it consists of:
class(Nile) # time series

# Another example:
chickwts
?chickwts

# Let's visualize it: 
boxplot(weight ~ feed, data = chickwts)

# Quit R:
q()


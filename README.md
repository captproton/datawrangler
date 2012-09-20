# Started with RailsCasts Example Application

Run these commands to try it out.

```
bundle
rake db:setup
rails s
```

Requires Ruby 1.9.2 or later to run.
===
The next step is to open the spreadsheet with the data you want to wrangle.  In the first two columns, insert the "Lead Source" and the "ResponseType." Close the spreadsheet, go to "root/csv/import" of this app, fill out the form, and upload the spreadsheet.

At the top of the columns, input the proper labels of the columns, go to the bottom of the page, and select the type of resource you want to import to, currently people. Press Merge, this will import the the items and their attributes to the resource you chose, and redirect you to the page with only the items you just imported.

Tagging
-
After importing your resource, you can tag each item with attributes like "no job title and non-corp email," or other tag that can be used to filter down items to the ones you want.  The tagging will be manual at first, but eventually it can be applied automatically upon import.

Filters
-
A RESTful search will be applied to items of 

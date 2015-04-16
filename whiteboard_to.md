fermentables now seeding into db, from csv file in db, csv
	-and command in db seed.rb, 

build crud aournd recipe, user and fermentables, once working, add hops and other things as wanted, 
	-want dropdown of fermentables, as on is selected, you may add another with a + button

4/11
todo:
rendering partial forms, 
rendering drop box from a foreign table

adding to join table from another form?


4/13, reorg db based on talk with mentor, 
	-four tables, user, parts, recipe and ingredients(as join)
	-redo db seed with simpified information
		-only name

-1, seed db
-2 recreate controllers
-3, recreate models
-4, recreate views

working in most basic mode, a new recipe is created, with named ingredients, 
-going to attemp to add amount
-amount adding and rendering, properly associated with ingredient object

lets get some devise user sign in action going so that recipes can be properly associated 

4/14, user created, some shennanigans regarding naming tables, next steps, 
-adding process, steps tables, 
		-steps will have all the basic steps to brew, process will be a join table between recipe and steps that will include custom notes for the process on that recipe, a confident brewer may modify steps to match system, 
-basic math for recipe to conroller to calculate
	-water volume
	-taget gravity (preboil)
	-target gravity (original gravity)
	-target gravity (final gravity (post fermentation))
	-abv (target gravity)

	4/15, due to possible persisting problems from a devise mismatch, I rebuilt with a properly named devise initialization, going to finsish strike water volume calc, make that work, then turn to other pursuits, 
	make sure destroy is set up for all extant features, so that CRUD will be in effect
		-destroy for recipe working, make sure only the owner can do it
		-only in the view?
		-destroy, authenticate user in model, and hide button in view?
		-cannot add ingredient unless owner of recipe, but only thourgh view manipulation, how to add to controller?
		strike water calc working based on mash thickness, will also need to add an system efficiency variable for recipe default of 70, 
		boiloff variable with default of 1.g/hour
		-right now, focus on getting values into db in order to manipulate them
	-got csv into db with appropriate info for each ingredient, now how to separate logic of different ingredient verisons, need to pass that as an attribute for an ingredient object
		-can fit formula to ingredient.component.verison, but I will need to further subdivide the components list to fit other formulas, like for instanc, I won't need to calculate the strike water for DME, though it is a fermentable
		
	4/16, things to do, 
		-merge current local master with github(done)
		-overall, finish up basic crud, (create recipe, delete recipe, add ingredient, delete ingredient, create user, update user, delete user, edit recipe,)
				-remove recipe items, view/ edit, functions, dependent on user ownership (done)
				-label attributes of recipe that are there/make formulas for baiscs, water amounts, (sparge calculator?) gravity amounts pre and post boil
		-make a splash page, with some simple js, like make links glow when hovered over
		-further subdivide versions(types) of ingredients, see if you can get hops and fermentables in two different drop down menus, 
	
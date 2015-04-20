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
		-can fit formula to ingredient.component.version, but I will need to further subdivide the components list to fit other formulas, like for instanc, I won't need to calculate the strike water for DME, though it is a fermentable
		
	4/16, things to do, 
		-merge current local master with github(done)
		-overall, finish up basic crud, (create recipe, delete recipe, add ingredient, delete ingredient, create user, update user, delete user, edit recipe,)
				-remove recipe items, view/ edit, functions, dependent on user ownership (done)
				-label attributes of recipe that are there/make formulas for baiscs, consider where to add, system loss, boil-off rate, grain absorption, water amounts, (sparge calculator?) gravity amounts pre and post boil(done, but formulas need verifying, and process comparison, biab vs 3 vessel)
		-make a splash page, with some simple js, like make links glow when hovered over
		-further subdivide versions(types) of ingredients, see if you can get hops and fermentables in two different drop down menus, 

	4/17, todo, 
		-rebuild components table to include yeast attributes, (done)
		-add yeast to db, components to calcuate target final gravity, (done) 
		-subdivide fermentables, into further categories, sugars, mashed_grain, (done, feremntable-grain, fermentable-dme, fermentable-sugar, yeast, hops)
		-get separate dropdowns for ingredient types
		-find place to put extraction efficiency, (added to recipe create, need to add recipe edit, so it can be added after create if desired, or changed) 
		-write gravity formulas so that fermentable_grains are calculated against an extraction efficency
				-efficiency as selectable for recipe on recipe show page, but has a default of 70 (done)
				-give mash thickness a default of 1.5 (done)
		-add show final grav calc only if yeast is among selected ingredients, 
					-going to put it on the recipe create form, maybe eventually be a system, so a user could have many systems, but for now, field with default on recipe create page
		-develop list of steps for 3 vessel process, and BIAB, create tables, steps and process, process would be a join table with recipe_id, step_id and proecess notes
		-also need a dictionary, brewing terms mash sparge, etc, and ingredients, malt, hops, bittering, non fermentable sugar

		4/18, todo, 
			-procced with calcs, og, target fg, preboil g, revisit water volume calcs, different for 3 vessel vs biab, (got basic calcs done, water could be improved, but adequate for proceeding)
			-further research on createing select boxes would be nice, but reading docs has not helped so far
			-index view for ingredients, split amont ing types, each a link to a show to explore
				-already have the index for components, just add links and create templated
			-if basic functions attained today, consider working on process, 

		4/19, 
			-got syntax for separating table into separate dropdowns
			-added links for editing ingredient (ugly, need to revisit)
			-added links for viewing ingredient information (also ugly, need to revisit)
			-separate into each, hops, fermentables, yeast, 
			-added column to ingredients table for boil time, most important now for hop IBU calculation, but long term, if I get srm up and running, it will be important for that as well for kettle darkening, 
			-next steps, steps and process join table, for note taking
			-add strike water temp calculations
				-brew dictionary
				-brew how to (essentially the 'description' column for steps)
				-MAKE IT PRETTY!
				https://hide.me/en/proxy in browser vpn for researching beer at launch

		4/20
			-todo,  
			-bug, non owner can remove ingredients from recipe, restrict access in view and controller, 
				-try using the recipe model method owner? in controller..., in destroy, check owner of ingredient, if that fails, maybe create method on ingredient model and try again, check that the method works in the view to prove efficacy
					-owner? method works as restriction in controller, but throws no template error for false, perhaps good enough, only malicious would find hidden link on view and its ok if they get errror, though better if they get 404, revisit for 404 redirect...
					-restriced on view with owner?, restricted on controller with owner, but need redirect rather than error
			-add dme to fermentables table and calcuation, also need volume addition for dme
			-add lme to fermentables, 
			-strike water temperature calculator


	
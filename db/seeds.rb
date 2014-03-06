# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
  Question.create(
  	[
  		{ title: "Tell me about your favorite product?", 
  		details: "Please describe the product in detail and explain to me why the product is well designed.",
  		user: "kchanthasiriphan",
		job: "Product Management",
		firm: "Kabam",
		category: "Technology"}
  	])
  Question.create(
  	[	
  		{title: "Describe to me the components of a well designed website.", 
	  	details: "Walk me through the design best practices on your selected website.",
	  	user: "mtang",
		job: "UX design",
		firm: "DemandForce",
		category: "Technology" }
  	])

  # cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
  # Mayor.create(name: 'Emanuel', city: cities.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

roles = [
  { name: "admin", description: "Site Administrator: General Access to everything.", grantable: false },
  { name: "campus_admin", description: "Campus Administrator: Administration rights over Campuses.", grantable: true },
  { name: "contact_admin", description: "Contact Us Administrator: Administration rights over Support.", grantable: true },
  { name: "events_admin", description: "Event Administrator: Administration rights over events.", grantable: true },
  { name: "granter", description: "Role Granter: The right to grant others roles.", grantable: false },
  { name: "modules_admin", description: "UDL Modules Administrator: Administration rights over Udl Modules.", grantable: true },
  { name: "modules_author", description: "UDL Modules Author: Rights to create Udl Modules.", grantable: true },
  { name: "module_proposals_admin", description: "UDL Module Proposals Administrator: Administrative rights over Udl Module Proposals.", grantable: true },
  { name: "news_articles_admin", description: "News Articles Administrator: Rights to create/edit News Articles.", grantable: true },
  { name: "redesign_summaries_admin", description: "Redesign Summaries Administrator: Administrative rights to Redesign Summaries.", grantable: true },
  { name: "redesign_summaries_author", description: "Redesign Summaries Author: Rights to create Redesign Summaries.", grantable: true },
  { name: "users_admin", description: "User Administrator: Administrative rights to Users.", grantable: false },
  { name: "star_learning_communities_admin", description: "STAR Learning Communities Administrator: Administrative rights to SLC's.", grantable: true },
  { name: "dss_contacts__admin", description: "Disability Support Services Contacts Administrator: Administrative rights to DSS Contacts index.", grantable: true }
]

pages = [
  { title: "Welcome to College STAR", slug: "home", text: "College STAR Home text" },
  { title: "About College STAR", slug: "about", text: "About College STAR text" },
  { title: "College STAR Terms of Use Policy", slug: "terms", text: "College STAR terms of use text" },
  { title: "How can we help you?", slug: "contact-us", text: "Contact us page text." }
]

roles.each do |role|
  found_role = Role.find_or_create_by( name: role[:name] ) do |new_role|
    new_role.description = role[:description]
    new_role.grantable = role[:grantable]
  end
  found_role.description = role[:description] if found_role.description != role[:description]
  found_role.grantable = role[:grantable] if found_role.grantable != role[:grantable]
  found_role.save
end

pages.each do |page|
  Page.find_or_create_by( slug: page[:slug] ) do |new_page|
    new_page.title = page[:title]
    new_page.text = page[:text]
  end
end

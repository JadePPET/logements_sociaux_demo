# Define the database connection to be used for this model.
connection: "postgres_talan"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: logements_sociaux_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: logements_sociaux_demo_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Logements Sociaux Demo"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

#20221004 - ldo, version jade
#explore: arrondissements {
#  join: commercants_parisiens {
#    type: left_outer
#    relationship: one_to_one
#    sql_on: ${arrondissements.code_postal} = ${commercants_parisiens.code_postal} ;;
#  }
#}

#explore: commercants_parisiens {}

#20221004 - version ldo
explore: logement_sociaux_fin   {

  join: commercants_parisiens {
    type: left_outer
    relationship: one_to_one
    sql_on: ${commercants_parisiens.code_postal}  = ${logement_sociaux_fin.code_postal} ;;
  }
  join: arrondissements {
    type: left_outer
    relationship: one_to_one
    sql_on: ${arrondissements.code_postal} = ${logement_sociaux_fin.code_postal} ;;
  }
#<<<<<<< HEAD


#=======
#  join: commercants_parisiens {
#    type: left_outer
#    relationship: one_to_one
#    sql_on: ${logement_sociaux_fin.code_postal} = ${commercants_parisiens.code_postal} ;;
#  }
#>>>>>>> branch 'main' of https://github.com/JadePPET/logements_sociaux_demo
}

explore: arrondissements {}
explore: commercants_parisiens {}

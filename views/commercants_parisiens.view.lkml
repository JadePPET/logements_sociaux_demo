# The name of this view in Looker is "Commercants Parisiens"
view: commercants_parisiens {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "Open_data_paris".commercants_parisiens ;;
  drill_fields: [id_commerce]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id_commerce {
    primary_key: yes
    type: string
    sql: ${TABLE}."id_commerce" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Adresse" in Explore.

  dimension: adresse {
    type: string
    sql: ${TABLE}."adresse" ;;
  }

  dimension: code_postal {
    type: string
    sql: ${TABLE}."code_postal" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }

  dimension: fabrique_a_paris {
    type: string
    sql: ${TABLE}."fabrique_a_paris" ;;
  }

  dimension: geo_point_2d {
    type: string
    sql: ${TABLE}."geo_point_2d" ;;
  }

  dimension: geo_shape {
    type: string
    sql: ${TABLE}."geo_shape" ;;
  }

  dimension: mail {
    type: string
    sql: ${TABLE}."mail" ;;
  }

  dimension: nom_du_commerce {
    type: string
    sql: ${TABLE}."nom_du_commerce" ;;
  }

  dimension: precisions {
    type: string
    sql: ${TABLE}."precisions" ;;
  }

  dimension: services {
    type: string
    sql: ${TABLE}."services" ;;
  }

  dimension: site_internet {
    type: string
    sql: ${TABLE}."site_internet" ;;
  }

  dimension: telephone {
    type: string
    sql: ${TABLE}."telephone" ;;
  }

  dimension: type_de_commerce {
    type: string
    sql: ${TABLE}."type_de_commerce" ;;
  }

  measure: count {
    type: count
    drill_fields: [id_commerce]
  }
}

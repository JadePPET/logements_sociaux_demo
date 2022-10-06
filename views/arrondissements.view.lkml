# The name of this view in Looker is "Arrondissements"
view: arrondissements {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "Open_data_paris".arrondissements ;;
  # drill_fields: [id_arrondissement]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: code_postal {
    primary_key: yes
    type: string
    sql: CONCAT(SUBSTRING(arrondissements."id_arrondissement",1,3), '',SUBSTRING(arrondissements."id_arrondissement",8,2))
     ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Geo Point 2d" in Explore.

  dimension: geo_point_2d {
    type: string
    sql: ${TABLE}."geo_point_2d" ;;
  }

  dimension: geo_shape {
    type: string
    sql: ${TABLE}."geo_shape" ;;
  }

  dimension: n_sq_co {
    type: string
    sql: ${TABLE}."n_sq_co" ;;
  }

  dimension: nom_arrondissement {
    type: string
    sql: ${TABLE}."nom_arrondissement" ;;
  }

  dimension: nom_officiel {
    type: string
    sql: ${TABLE}."nom_officiel" ;;
  }

  dimension: numero_arrondissement {
    type: string
    sql: ${TABLE}."numero_arrondissement" ;;
  }

  dimension: numero_insee {
    type: string
    sql: ${TABLE}."numero_insee" ;;
  }

  dimension: perimetre {
    type: number
    sql: ${TABLE}."perimetre" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_perimetre {
    type: sum
    sql: ${perimetre} ;;
  }

  measure: average_perimetre {
    type: average
    sql: ${perimetre} ;;
  }

  dimension: surface {
    type: number
    sql: ${TABLE}."surface";;
  }

  #measure: count {(${TABLE}."surface")/10000
  # value_format: "#,##0.0"
  #  type: count
  #  drill_fields: [id_arrondissement]
  # }
}

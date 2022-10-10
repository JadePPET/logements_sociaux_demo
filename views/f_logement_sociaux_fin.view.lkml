# The name of this view in Looker is "Logement Sociaux Fin"
view: logement_sociaux_fin {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "Open_data_paris".logement_sociaux_fin ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Adresse Programme" in Explore.

  dimension: adresse_programme {
    type: string
    sql: ${TABLE}."adresse_programme" ;;
  }

  dimension: annee_financement {
    type: string
    sql: ${TABLE}."annee_financement" ;;
  }

  dimension: arrondissement {
    type: string
    sql: ${TABLE}."arrondissement" ;;
  }

  dimension: bailleur_social {
    type: string
    sql: ${TABLE}."bailleur_social" ;;
  }

  dimension: code_postal {
    primary_key: yes
    type: string
    sql: ${TABLE}."code_postal" ;;
  }

  dimension: commentaires {
    type: string
    sql: ${TABLE}."commentaires" ;;
  }

  dimension: coord_x_l93 {
    type: string
    sql: ${TABLE}."coord_x_l93" ;;
  }

  dimension: coord_y_l93 {
    type: string
    sql: ${TABLE}."coord_y_l93" ;;
  }

  dimension: geo_point_2d {
    type: string
    sql: ${TABLE}."geo_point_2d" ;;
  }

  dimension: geo_shape {
    type: string
    sql: ${TABLE}."geo_shape" ;;
  }

  dimension: id_livraison {
    type: string
    sql: ${TABLE}."id_livraison" ;;
  }

  dimension: mode_realisation {
    type: string
    sql: ${TABLE}."mode_realisation" ;;
  }

  dimension: nature_de_programme {
    type: string
    sql: ${TABLE}."nature_de_programme" ;;
  }

  dimension: nb_logment_finance {
    type: number
    sql: ${TABLE}."nb_logment_finance" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_nb_logment_finance {
    type: sum
    sql: ${nb_logment_finance} ;;
  }

  measure: average_nb_logment_finance {
    type: average
    sql: ${nb_logment_finance} ;;
  }

  dimension: nb_logment_pla_i {
    type: number
    sql: ${TABLE}."nb_logment_pla_i" ;;
  }

  dimension: nb_logment_pls {
    type: number
    sql: ${TABLE}."nb_logment_pls" ;;
  }

  dimension: nb_logment_plus {
    type: number
    sql: ${TABLE}."nb_logment_plus" ;;
  }

  dimension: nb_logment_plus_cd {
    type: number
    sql: ${TABLE}."nb_logment_plus_cd" ;;
  }

  dimension: ville {
    type: string
    sql: ${TABLE}."ville" ;;
  }

  dimension: maps_points {
    type: location
    sql_latitude: ${TABLE}."latitude" ;;
    sql_longitude: ${TABLE}."longitude" ;;
  }


  measure: aggr_logement_finance_by_bailleur {
    type: sum
    sql: ${TABLE}."nb_logment_finance" group by ${TABLE}."bailleur_social";;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

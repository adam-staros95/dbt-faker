{% macro databricks__fake_credit_card(seed_column, formatted=true) %}
    {{ return(dbt_faker.databricks__fake_card_number(seed_column, formatted)) }}
{% endmacro %}

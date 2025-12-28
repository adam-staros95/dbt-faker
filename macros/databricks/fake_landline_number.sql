{% macro databricks__fake_landline_number(seed_column, locale='en_US') %}
    {{ return(dbt_faker.databricks__fake_landline_fax_number(seed_column, locale)) }}
{% endmacro %}

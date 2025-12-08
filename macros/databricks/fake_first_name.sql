{% macro databricks__fake_first_name(seed_column, locale='en_US') %}
    {% set locale_map = dbt_faker.get_first_names_by_locale() %}
    {{ return(dbt_faker.databricks__fake_value_from_map(seed_column, locale_map, locale)) }}
{% endmacro %}

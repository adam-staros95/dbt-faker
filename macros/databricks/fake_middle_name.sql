{% macro databricks__fake_middle_name(seed_column, locale='en_US') %}
    {% set locale_map = dbt_faker.get_middle_names_by_locale() %}
    {{ return(dbt_faker.databricks__fake_name_from_map(seed_column, locale_map, locale)) }}
{% endmacro %}

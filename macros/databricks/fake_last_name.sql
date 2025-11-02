{% macro databricks__fake_last_name(seed_column, locale='en_US') %}
    {% set locale_map = get_last_names_by_locale() %}
    {{ return(databricks__fake_name_from_map(seed_column, locale_map, locale)) }}
{% endmacro %}


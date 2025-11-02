{% macro databricks__fake_first_name(seed_column, locale='en_US') %}
    {% set locale_map = get_first_names_by_locale() %}
    {{ return(databricks__fake_name_from_map(seed_column, locale_map, locale)) }}
{% endmacro %}



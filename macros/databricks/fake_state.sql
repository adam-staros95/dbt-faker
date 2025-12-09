{% macro databricks__fake_state(seed_column, locale='en_US') %}
    {% set locale_map = dbt_faker.get_states_by_locale() %}
    {{ return(dbt_faker.databricks__fake_value_from_map(seed_column, locale_map, locale)) }}
{% endmacro %}

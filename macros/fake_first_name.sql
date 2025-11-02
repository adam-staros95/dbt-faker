{% macro fake_first_name(seed_column, locale='en_US') %}
    {{ return(adapter.dispatch('fake_first_name', 'dbt_faker')(seed_column, locale)) }}
{% endmacro %}

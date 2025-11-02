{% macro fake_last_name(seed_column, locale='en_US') %}
    {{ return(adapter.dispatch('fake_last_name', 'dbt_faker')(seed_column, locale)) }}
{% endmacro %}


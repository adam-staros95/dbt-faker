{% macro fake_middle_name(seed_column, locale='en_US') %}
    {{ return(adapter.dispatch('fake_middle_name', 'dbt_faker')(seed_column, locale)) }}
{% endmacro %}


{% macro fake_home_number(seed_column, locale='en_US') %}
    {% do dbt_faker.validate_locale(locale) %}
    {{ return(adapter.dispatch('fake_home_number', 'dbt_faker')(seed_column, locale)) }}
{% endmacro %}

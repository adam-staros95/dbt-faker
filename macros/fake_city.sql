{% macro fake_city(seed_column, locale='en_US') %}
    {% do dbt_faker.validate_locale(locale) %}
    {{ return(adapter.dispatch('fake_city', 'dbt_faker')(seed_column, locale)) }}
{% endmacro %}

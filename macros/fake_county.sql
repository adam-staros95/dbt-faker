{% macro fake_county(seed_column, locale='en_US') %}
    {% do dbt_faker.validate_locale(locale) %}
    {{ return(adapter.dispatch('fake_county', 'dbt_faker')(seed_column, locale)) }}
{% endmacro %}

{% macro fake_postal_code(seed_column, locale='en_US') %}
    {% do dbt_faker.validate_locale(locale) %}
    {{ return(adapter.dispatch('fake_postal_code', 'dbt_faker')(seed_column, locale)) }}
{% endmacro %}

{% macro fake_full_name(seed_column, locale='en_US') %}
    {% do dbt_faker.validate_locale(locale) %}
    {{ return(adapter.dispatch('fake_full_name', 'dbt_faker')(seed_column, locale)) }}
{% endmacro %}

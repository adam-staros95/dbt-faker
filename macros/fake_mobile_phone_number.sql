{% macro fake_mobile_phone_number(seed_column, locale='en_US') %}
    {% do dbt_faker.validate_locale(locale) %}
    {{ return(adapter.dispatch('fake_mobile_phone_number', 'dbt_faker')(seed_column, locale)) }}
{% endmacro %}

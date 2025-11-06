{% macro fake_bank_account(seed_column, locale='en_US') %}
    {% do dbt_faker.validate_locale(locale) %}
    {{ return(adapter.dispatch('fake_bank_account', 'dbt_faker')(seed_column, locale)) }}
{% endmacro %}


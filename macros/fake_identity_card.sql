{% macro fake_identity_card(seed_column, locale='en_US') %}
    {% do dbt_faker.validate_locale(locale) %}
    {{ return(adapter.dispatch('fake_identity_card', 'dbt_faker')(seed_column, locale)) }}
{% endmacro %}

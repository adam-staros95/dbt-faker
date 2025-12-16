{% macro fake_gender(seed_column, locale='en_US', full_value=false) %}
    {% do dbt_faker.validate_locale(locale) %}
    {{ return(adapter.dispatch('fake_gender', 'dbt_faker')(seed_column, locale, full_value)) }}
{% endmacro %}

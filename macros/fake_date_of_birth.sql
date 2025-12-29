{% macro fake_date_of_birth(seed_column, locale='en_US', min_date=none, max_date=none, minimum_age=none, maximum_age=none, return_type='date') %}
    {% do dbt_faker.validate_locale(locale) %}
    {% if (minimum_age is not none or maximum_age is not none) and (min_date is not none or max_date is not none) %}
        {% do exceptions.raise_compiler_error("Cannot provide both age parameters (minimum_age, maximum_age) and date parameters (min_date, max_date). Please use either age-based or date-based parameters.") %}
    {% endif %}
    {{ return(adapter.dispatch('fake_date_of_birth', 'dbt_faker')(seed_column, locale, min_date, max_date, minimum_age, maximum_age, return_type)) }}
{% endmacro %}

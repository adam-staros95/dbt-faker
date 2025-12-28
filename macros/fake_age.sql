{% macro fake_age(seed_column, minimum_age=0, maximum_age=120, return_type='int') %}
    {% if minimum_age < 0 %}
        {% do exceptions.raise_compiler_error("minimum_age must be >= 0, but got: " ~ minimum_age) %}
    {% endif %}
    {% if maximum_age > 120 %}
        {% do exceptions.raise_compiler_error("maximum_age must be <= 120, but got: " ~ maximum_age) %}
    {% endif %}
    {{ return(adapter.dispatch('fake_age', 'dbt_faker')(seed_column, minimum_age, maximum_age, return_type)) }}
{% endmacro %}

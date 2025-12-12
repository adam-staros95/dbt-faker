{% macro fake_salary(seed_column, min_salary=none, max_salary=none, return_type='decimal(10,2)') %}
    {% if min_salary is not none and min_salary < 0 %}
        {% do exceptions.raise_compiler_error("min_salary must be >= 0, but got: " ~ min_salary) %}
    {% endif %}
    {% if max_salary is not none and min_salary is not none and max_salary < min_salary %}
        {% do exceptions.raise_compiler_error("max_salary must be >= min_salary, but got: min_salary=" ~ min_salary ~ ", max_salary=" ~ max_salary) %}
    {% endif %}
    {{ return(adapter.dispatch('fake_salary', 'dbt_faker')(seed_column, min_salary, max_salary, return_type)) }}
{% endmacro %}

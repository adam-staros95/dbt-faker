{% macro databricks__fake_age(seed_column, minimum_age=0, maximum_age=120, return_type='int') %}
    {% set age_range = maximum_age - minimum_age + 1 %}
    cast(
        {{ minimum_age }} + mod(
            abs(hash(cast({{ seed_column }} as string))), {{ age_range }}
        ) as {{ return_type }}
    )
{% endmacro %}

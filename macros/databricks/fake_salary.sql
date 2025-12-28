{% macro databricks__fake_salary(seed_column, min_salary=none, max_salary=none, return_type='decimal(10,2)') %}
    {% set supported_return_types = ['decimal(10,2)', 'double', 'float', 'string'] %}
    {% if return_type not in supported_return_types %}
        {% do exceptions.raise_compiler_error("Invalid return_type for Databricks: '" ~ return_type ~ "'. Supported return types are: " ~ (supported_return_types | join(", "))) %}
    {% endif %}
    {% if min_salary is none %} {% set min_salary = 2000 %} {% endif %}
    {% if max_salary is none %} {% set max_salary = 80000 %} {% endif %}
    {% set salary_range = max_salary - min_salary %}
    cast(
        (
            {{ min_salary }}
            + mod(abs(hash(cast({{ seed_column }} as string))), {{ salary_range + 1 }})
        ) + (
            cast(
                mod(
                    abs(hash(cast(concat({{ seed_column }}, '_decimal') as string))),
                    100
                ) as double
            )
            / 100.0
        ) as {{ return_type }}
    )
{% endmacro %}

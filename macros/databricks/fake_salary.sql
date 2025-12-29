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
            + {{ dbt_faker.databricks__hash_mod(seed_column=seed_column, range=(salary_range + 1)) }}
        ) + (
            cast(
                {{ dbt_faker.databricks__hash_mod(seed_column=seed_column, range=100, suffix='_decimal') }}
                as double
            )
            / 100.0
        ) as {{ return_type }}
    )
{% endmacro %}

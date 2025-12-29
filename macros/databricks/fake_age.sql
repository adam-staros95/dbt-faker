{% macro databricks__fake_age(seed_column, minimum_age=0, maximum_age=120, return_type='int') %}
    {% set supported_return_types = ['string', 'int', 'bigint', 'integer'] %}
    {% if return_type not in supported_return_types %}
        {% do exceptions.raise_compiler_error("Invalid return_type for Databricks: '" ~ return_type ~ "'. Supported return types are: " ~ (supported_return_types | join(", "))) %}
    {% endif %}
    {% set age_range = maximum_age - minimum_age + 1 %}
    cast(
        {{ minimum_age }} + mod(
            abs(hash(cast({{ seed_column }} as string))), {{ age_range }}
        ) as {{ return_type }}
    )
{% endmacro %}

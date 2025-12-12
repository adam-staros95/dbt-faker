{% macro fake_age(seed_column, minimum_age=0, maximum_age=120, return_type='int') %}
    {% set supported_return_types = ['string', 'int'] %}
    {% if return_type not in supported_return_types %}
        {% do exceptions.raise_compiler_error("Invalid return_type: '" ~ return_type ~ "'. Supported return types are: " ~ (supported_return_types | join(", "))) %}
    {% endif %}
    {% if minimum_age < 0 %}
        {% do exceptions.raise_compiler_error("minimum_age must be >= 0, but got: " ~ minimum_age) %}
    {% endif %}
    {% if maximum_age > 120 %}
        {% do exceptions.raise_compiler_error("maximum_age must be <= 120, but got: " ~ maximum_age) %}
    {% endif %}
    {{ return(adapter.dispatch('fake_age', 'dbt_faker')(seed_column, minimum_age, maximum_age, return_type)) }}
{% endmacro %}
